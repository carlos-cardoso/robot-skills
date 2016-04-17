katana_driver
=============

This stack contains ROS hardware drivers, Gazebo plugins and other basic functionalities for the Neuronics Katana family of robot arms. Specifically, it provides: 

* JointTrajectory and FollowJointTrajectory execution on the physical arm (packages `katana`, `kni`, `katana_trajectory_filter`, `katana_msgs`),
* simulation of the Katana arm in Gazebo (packages `katana_gazebo_plugins`, `katana_arm_gazebo`),
* URDF descriptions (package `katana_description`),
* simple teleoperation (packages `katana_teleop`, `katana_joint_movement_adapter`), and
* some demo programs (package `katana_tutorials`).

For more information, visit the [katana_driver ROS wiki page](http://www.ros.org/wiki/katana_driver).
