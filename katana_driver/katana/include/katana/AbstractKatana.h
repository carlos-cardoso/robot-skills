/*
 * UOS-ROS packages - Robot Operating System code by the University of Osnabrück
 * Copyright (C) 2010  University of Osnabrück
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * AbstractKatana.h
 *
 *  Created on: 20.12.2010
 *      Author: Martin Günther <mguenthe@uos.de>
 */

#ifndef ABSTRACTKATANA_H_
#define ABSTRACTKATANA_H_

#include <ros/ros.h>
#include <urdf/model.h>
#include <urdf_model/joint.h>

#include <katana/SpecifiedTrajectory.h>
#include <katana/katana_constants.h>

#include <moveit_msgs/JointLimits.h>

namespace katana
{

class AbstractKatana
{
public:
  AbstractKatana();
  virtual ~AbstractKatana();

  virtual void refreshEncoders() = 0;
  virtual bool executeTrajectory(boost::shared_ptr<SpecifiedTrajectory> traj,
                                 boost::function<bool()> isPreemptRequested) = 0;
  virtual void freezeRobot();

  /**
   * Move the joint to the desired angle. Do not wait for result,
   * but return immediately.
   *
   * @param jointIndex the joint to move
   * @param turningAngle the target angle
   * @return true iff command was successfully sent to Katana
   */
  virtual bool moveJoint(int jointIndex, double turningAngle) = 0;

  virtual int getJointIndex(std::string joint_name);

  virtual std::vector<std::string> getJointNames();
  virtual std::vector<int> getJointTypes();

  virtual std::vector<std::string> getGripperJointNames();
  virtual std::vector<int> getGripperJointTypes();

  virtual std::vector<double> getMotorAngles();
  virtual std::vector<double> getMotorVelocities();

  virtual std::vector<moveit_msgs::JointLimits> getMotorLimits();
  virtual double getMotorLimitMax(std::string joint_name);
  virtual double getMotorLimitMin(std::string joint_name);

  virtual void refreshMotorStatus();
  virtual bool someMotorCrashed() = 0;
  virtual bool allJointsReady() = 0;
  virtual bool allMotorsReady() = 0;


protected:
  // only the 5 "real" joints:
  std::vector<std::string> joint_names_;
  std::vector<int> joint_types_;

  // the two "finger" joints of the gripper:
  std::vector<std::string> gripper_joint_names_;
  std::vector<int> gripper_joint_types_;

  // all motors (the 5 "real" joints plus the gripper)

  std::vector<double> motor_angles_;
  std::vector<double> motor_velocities_;

  // the motor limits of the 6 motors

  std::vector<moveit_msgs::JointLimits> motor_limits_;
};

}

#endif /* ABSTRACTKATANA_H_ */
