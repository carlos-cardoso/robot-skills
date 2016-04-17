#!/usr/bin/env python
import roslib; roslib.load_manifest('katana')
import rospy
from sensor_msgs.msg import JointState

def fake_katana_joint_publisher():
    pub = rospy.Publisher('/joint_states', JointState)
    rospy.init_node('fake_katana_joint_publisher')
    while not rospy.is_shutdown():
        js = JointState()
        js.header.stamp = rospy.Time.now()
        js.name = ['katana_motor1_pan_joint', 'katana_motor2_lift_joint', 'katana_motor3_lift_joint', 'katana_motor4_lift_joint', 'katana_motor5_wrist_roll_joint', 'katana_r_finger_joint', 'katana_l_finger_joint']
        js.position = [-2.9641690268167444, 2.1288782921967493, -2.1556486321117725, -1.971949347057968, -2.9318804356548496, 0.28921755238530117, 0.28921755238530117]
        js.velocity = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        pub.publish(js)
        rospy.sleep(0.02)
if __name__ == '__main__':
    try:
        fake_katana_joint_publisher()
    except rospy.ROSInterruptException: pass
