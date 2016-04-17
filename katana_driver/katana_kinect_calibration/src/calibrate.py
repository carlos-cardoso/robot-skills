#!/usr/bin/env python
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# Katana.cpp
#
#  Created on: 08.03.2013
#      Author: Michael Goerner <mgoerner@uos.de>

import os

import roslib; roslib.load_manifest('katana_kinect_calibration')
import rospy

import tf
from tf.transformations import quaternion_slerp, euler_from_quaternion

from geometry_msgs.msg import Point, Quaternion, Pose, PoseStamped
from sensor_msgs.msg import JointState
from katana_msgs.msg import JointMovementAction, JointMovementGoal
from ar_pose.msg import ARMarkers

from actionlib import SimpleActionClient

from math import sqrt, acos


class CalibrateException(Exception):
	pass
class NoJointStatesFoundException(CalibrateException):
	pass
class NoTransformCachedException(CalibrateException):
	pass
class LastHopReachedException(CalibrateException):
	pass

# order of katana joints in the whole calibrate module
JOINTS=['katana_motor1_pan_joint', 'katana_motor2_lift_joint', 'katana_motor3_lift_joint', 'katana_motor4_lift_joint', 'katana_motor5_wrist_roll_joint', 'katana_r_finger_joint', 'katana_l_finger_joint']


def averagePoses(pose1, pose2, t):
		"""Average two poses with weighting t to 1

		This computes the average of the kartesian positions using
		linear interpolation and of the rotation using SLERP"""

		factor= float(t)/(t+1)
		translation= tuple(map(lambda x,y: factor*x + (1-factor)*y, pose1[0], pose2[0]))
		rotation= quaternion_slerp(pose1[1], pose2[1], 1.0/(t+1))
		return (translation, rotation)


class Dance:
	"""Move Katana arm around in a given fashion"""

	def __init__(self):
		self.poses= [
[-0.07, 0.21, -0.14, -1.03, -2.96, 0.27, 0.27],
[-1.35, 0.15, -0.25, -0.89, -2.96, 0.27, 0.27],
[-1.3, 0.96, -0.09, 0.33, -2.96, 0.27, 0.27],
[-0.07, 0.92, 0.1, 0.16, -2.96, 0.27, 0.27],
[1.13, 0.93, 0.02, 0.16, -2.96, 0.27, 0.27],
[1.64, 0.05, 0.26, -0.19, -2.96, 0.27, 0.27],
# ... what a nice dance ;)
		]
		self.i= -1
		self.hopping= False
		self.client= SimpleActionClient('katana_arm_controller/joint_movement_action', JointMovementAction)
		self.client.wait_for_server()

	def hop(self, pose= None, noreset= False):
		"""Hop to next stance of the dance

		pose - JointState, optional. If given, this pose will be taken instead of the next one
		noreset - Boolean, optional. If True, don't reset the PoseBuffer during movement
		"""
		if pose == None:
			if self.i+1 >= len(self.poses):
				self.i= -1
				raise LastHopReachedException()

			self.i= (self.i+1) % len(self.poses)
			goal= JointMovementGoal( jointGoal= JointState(name=JOINTS, position=self.poses[self.i]) )
		else:
			goal= JointMovementGoal(jointGoal= pose)

		self.hopping= True
		if not noreset:
			transform.reset()
		self.client.send_goal(goal)
		self.client.wait_for_result()
		self.hopping= False
		if not noreset:
			transform.reset()
		return self.client.get_result()

	def setup(self):
		"""Get as safe as possible to the first stance"""

		try:
			jointmsg= rospy.wait_for_message('/katana_joint_states', JointState, 2.0)
			self.old_pose= []
			for n in JOINTS:
				self.old_pose.append(jointmsg.position[jointmsg.name.index(n)])
		except Exception, e:
			raise NoJointStatesFoundException(e)

		self.hop(JointState(
			name= ['katana_motor3_lift_joint', 'katana_motor4_lift_joint', 'katana_motor5_wrist_roll_joint', 'katana_r_finger_joint', 'katana_l_finger_joint'],
			position= [-2.18, -2.02, -2.96, 0.28, 0.28]
		), noreset= True)
		self.hop( JointState(name= ['katana_motor2_lift_joint'], position= [2.16]), noreset= True )
		self.hop( JointState(name= ['katana_motor1_pan_joint'], position= [0.00]), noreset= True )
		self.hop(noreset= True)

	def restoreOldPose(self):
		"""This restores the pose of the arm before setup() was called"""

		self.hop( JointState(name= JOINTS, position= [0.00, 2.16, -2.18, -2.02, -2.96, 0.28, 0.28]), noreset= True )
		self.hop( JointState(name= [JOINTS[0]], position= [self.old_pose[0]]), noreset= True)
		self.hop( JointState(name= [JOINTS[1]], position= [self.old_pose[1]]), noreset= True)
		self.hop( JointState(name= JOINTS[2:], position= self.old_pose[2:]), noreset= True )


class TransformBuffer:
	"""Accumulate poses of the camera as average"""

	def __init__(self):
		self.reset()
		self.listener= tf.TransformListener()
		rospy.Subscriber('/ar_pose_markers', ARMarkers, self.update_cb)

	def addTransform(self, transform):
		"""add new transform to current average"""

		(self.translation, self.rotation)= averagePoses( (self.translation, self.rotation), transform, self.samples)
		self.samples+= 1

	def getTransform(self):
		if self.samples == 0:
			raise NoTransformCachedException()
		return (self.translation, self.rotation)

	def reset(self):
		self.translation= (0,0,0)
		self.rotation= (1,0,0,0)
		self.samples= 0
		self.last_reset= rospy.get_time()

	def update_cb(self, msg):
		if len(msg.markers) > 0:
			if dance.hopping:
				self.reset()
			try:
				self.listener.waitForTransform('/katana_pattern_seen', '/kinect_link', msg.header.stamp, rospy.Duration(2.0))
				transform= self.listener.lookupTransform('/katana_pattern_seen', '/kinect_link', msg.header.stamp)

				# it's not beautiful, but transformPose expects a PoseStamped object
				pose= PoseStamped( msg.header, Pose(Point(*(transform[0])), Quaternion(*(transform[1]))) )
				pose.header.frame_id= '/katana_pattern'
				base_transform= self.listener.transformPose('/base_link', pose)

				p= base_transform.pose.position
				r= base_transform.pose.orientation
				self.addTransform(((p.x,p.y,p.z),(r.x, r.y, r.z, r.w)))
			except tf.Exception, e:
				rospy.loginfo('no transform /katana_pattern_seen -> /kinect_link available')


if __name__ == '__main__':
	rospy.init_node('kinect_transform')

	# fetch all parameters
	config_file=      rospy.get_param('~config_file', os.getenv('HOME') + '/.ros/kinect_pose.urdf.xacro')
	timeout=          max(1, rospy.get_param('~timeout', 20))
	samples_required= max(1, rospy.get_param('~samples_required', 300))
	runs=             max(1, rospy.get_param('~runs', 1))
	write_config=     rospy.get_param('~write_config', True)
	publish_tf=       rospy.get_param('~publish_tf', False)

	dance= Dance()
	transform= TransformBuffer()

	broadcaster= tf.TransformBroadcaster()

	r= rospy.Rate(10)
	dance.setup()
	poses= []
	current_run= 0
	while not rospy.is_shutdown():
		if publish_tf:
			try:
				t= transform.getTransform()
				broadcaster.sendTransform(t[0], t[1], rospy.Time.now(), '/kinect_link', '/base_link')
			except NoTransformCachedException:
				pass

		try:
			if transform.samples >= samples_required:
				rospy.loginfo('finished pose with %d samples.' % samples_required)
				poses.append(transform.getTransform())
				dance.hop()
			elif rospy.get_time() - transform.last_reset > timeout:
				if transform.samples > 0:
					rospy.logwarn('found only %d samples, but %d are required. Ignoring pose!' % (transform.samples, samples_required) )
				else:
					rospy.logwarn('could not detect marker! Ignoring pose!')
				dance.hop()
		except LastHopReachedException:
			current_run+= 1
			if current_run >= runs:
				break
			else:
				# dance resets its index before this exception
				# so there's nothing we want to catch here
				dance.hop()
		r.sleep()

	dance.restoreOldPose()

	if len(poses) == 0:
		rospy.logfatal('Could not use any pose at all! There were not enough (any?) recognized samples before timeout.')
		exit(1)

	# averaging
	mean= ((0,0,0), (1,0,0,0))
	avgdev= [0,0,0,0]
	for i in xrange(len(poses)):
		mean= averagePoses(mean, poses[i], i)
	for p in poses:
		# cartesian diffs
		avgdev[0]+= abs(p[0][0]-mean[0][0])/len(poses)
		avgdev[1]+= abs(p[0][1]-mean[0][1])/len(poses)
		avgdev[2]+= abs(p[0][2]-mean[0][2])/len(poses)
		# angle diffs: acos( dotprod( mean_angle, pose_angle ) )
		avgdev[3]+= acos(sum( map(lambda x,y: x*y, mean[1], p[1]) )) / len(poses)

		rospy.logdebug('Dist: %f (%f, %f, %f) / Angle: %f' % (sqrt(sum( map(lambda x,y: (x-y)*(x-y), p[0], mean[0]) )), p[0][0]-mean[0][0], p[0][1]-mean[0][1], p[0][2]-mean[0][2], acos(sum( map(lambda x,y: x*y, mean[1], p[1])))) )

	rospy.loginfo('Averaged over %d poses\nMean: %s\nAvg. Dev.: (x: %.4f, y: %.4f, z: %.4f), rotation: %.4f' % (len(poses), str(mean), avgdev[0], avgdev[1], avgdev[2], avgdev[3]))

	xyz= mean[0]
	rpy= euler_from_quaternion(mean[1])
	if write_config:
		config= open( config_file, 'w' )
		config.write('<?xml version="1.0"?>\n<robot xmlns:xacro="http://ros.org/wiki/xacro">\n')
		config.write('<property name="kinect_xyz" value="%.3f %.3f %.3f"/>\n' % (xyz[0], xyz[1], xyz[2]))
		config.write('<property name="kinect_rpy" value="%.3f %.3f %.3f"/>\n' % (rpy[0], rpy[1], rpy[2]))
		config.write('</robot>')
		config.close()
