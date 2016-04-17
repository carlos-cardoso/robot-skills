/*
 * UOS-ROS packages - Robot Operating System code by the University of Osnabrück
 * Copyright (C) 2011  University of Osnabrück
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
 * gazebo_ros_katana_gripper.cpp
 *
 *  Created on: 29.08.2011
 *      Author: Martin Günther <mguenthe@uos.de>
 */
#ifndef GAZEBO_ROS_KATANA_H
#define GAZEBO_ROS_KATANA_H

#include <vector>

#include <katana_gazebo_plugins/gazebo_ros_katana_gripper_action_interface.h>
#include <katana_gazebo_plugins/katana_gripper_grasp_controller.h>
#include <katana_gazebo_plugins/katana_gripper_joint_trajectory_controller.h>

#include <gazebo/common/Plugin.hh>
#include <gazebo/common/Time.hh>
#include <gazebo/common/Events.hh>
#include <gazebo/physics/physics.hh>

#include <katana_msgs/GripperControllerState.h>
#include <control_toolbox/pid.h>
#include <ros/ros.h>

#include <boost/thread.hpp>

namespace gazebo
{
class GazeboRosKatanaGripper : public ModelPlugin
{
public:
  GazeboRosKatanaGripper();
  virtual ~GazeboRosKatanaGripper();

  virtual void Load(physics::ModelPtr _parent, sdf::ElementPtr _sdf);
  virtual void InitChild();
  virtual void FiniChild();
  virtual void UpdateChild();

private:
  void updateActiveGripperAction();
  void updateGains();

  static const size_t NUM_JOINTS = 2;

  ros::NodeHandle *rosnode_;

  //  ros::Publisher joint_state_pub_;
  ros::Publisher controller_state_pub_;

  std::string node_namespace_;
  std::vector<std::string> joint_names_;

  ///Torque applied to the joints
  float torque_;

  physics::WorldPtr my_world_;
  physics::ModelPtr my_parent_;

  control_toolbox::Pid pid_controller_;

  physics::JointPtr joints_[NUM_JOINTS];

  // sensor_msgs::JointState js_;

  // Simulation time of the last update
  common::Time prev_update_time_;

  // Pointer to the update event connection
  event::ConnectionPtr updateConnection;

  katana_gazebo_plugins::IGazeboRosKatanaGripperAction* active_gripper_action_;
  std::vector<katana_gazebo_plugins::IGazeboRosKatanaGripperAction*> gripper_action_list_;

  short publish_counter_;

  void spin();
  boost::thread *spinner_thread_;
};
}
#endif
