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

#include <katana_gazebo_plugins/gazebo_ros_katana_gripper.h>
#include <sensor_msgs/JointState.h>

#include <ros/time.h>

using namespace gazebo;

GazeboRosKatanaGripper::GazeboRosKatanaGripper() :
    publish_counter_(0)
{
  this->spinner_thread_ = new boost::thread(boost::bind(&GazeboRosKatanaGripper::spin, this));

  for (size_t i = 0; i < NUM_JOINTS; ++i)
  {
    joints_[i].reset();
  }

}

GazeboRosKatanaGripper::~GazeboRosKatanaGripper()
{
  // delete all gripper actions
  for (std::size_t i = 0; i != gripper_action_list_.size(); i++)
  {
    /* delete object at pointer */
    delete gripper_action_list_[i];
  }

  rosnode_->shutdown();
  this->spinner_thread_->join();
  delete this->spinner_thread_;
  delete rosnode_;
}

void GazeboRosKatanaGripper::Load(physics::ModelPtr _parent, sdf::ElementPtr _sdf)
{
  this->my_world_ = _parent->GetWorld();

  this->my_parent_ = _parent;
  if (!this->my_parent_)
  {
    ROS_FATAL("Gazebo_ROS_Create controller requires a Model as its parent");
    return;
  }

  this->node_namespace_ = "katana/";
  if (_sdf->HasElement("robotNamespace"))
    this->node_namespace_ = _sdf->Get<std::string>("node_namespace") + "/";

  torque_ = 0.5;
  if (_sdf->HasElement("max_torque"))
    torque_ = _sdf->Get<float>("max_torque");

  joint_names_.resize(NUM_JOINTS);
  joint_names_[0] = "katana_r_finger_joint";
  if (_sdf->HasElement("r_finger_joint"))
    joint_names_[0] = _sdf->Get<std::string>("r_finger_joint");

  joint_names_[1] = "katana_r_finger_joint";
  if (_sdf->HasElement("l_finger_joint"))
    joint_names_[1] = _sdf->Get<std::string>("l_finger_joint");

  if (!ros::isInitialized())
  {
    int argc = 0;
    char** argv = NULL;
    ros::init(argc, argv, "gazebo_ros_katana_gripper",
              ros::init_options::NoSigintHandler | ros::init_options::AnonymousName);
  }

  rosnode_ = new ros::NodeHandle(node_namespace_);

  controller_state_pub_ = rosnode_->advertise<katana_msgs::GripperControllerState>("gripper_controller_state", 1);

  for (size_t i = 0; i < NUM_JOINTS; ++i)
  {
    joints_[i] = my_parent_->GetJoint(joint_names_[i]);
    if (!joints_[i])
      gzthrow("The controller couldn't get joint " << joint_names_[i]);
  }

  // construct pid controller
  if (!pid_controller_.init(ros::NodeHandle(*rosnode_, "gripper_pid")))
  {
    ROS_FATAL("gazebo_ros_katana_gripper could not construct PID controller!");
  }

  // create gripper actions
  katana_gazebo_plugins::IGazeboRosKatanaGripperAction* gripper_grasp_controller_ =
      new katana_gazebo_plugins::KatanaGripperGraspController(ros::NodeHandle(node_namespace_));
  katana_gazebo_plugins::IGazeboRosKatanaGripperAction* gripper_jt_controller_ =
      new katana_gazebo_plugins::KatanaGripperJointTrajectoryController(ros::NodeHandle(node_namespace_));

  // "register" gripper actions
  gripper_action_list_.push_back(gripper_grasp_controller_);
  gripper_action_list_.push_back(gripper_jt_controller_);

  // set default action
  active_gripper_action_ = gripper_grasp_controller_;
  updateGains();

  // Get the name of the parent model
  std::string modelName = _sdf->GetParent()->Get<std::string>("name");

  // Listen to the update event. This event is broadcast every
  // simulation iteration.
  this->updateConnection = event::Events::ConnectWorldUpdateBegin(
      boost::bind(&GazeboRosKatanaGripper::UpdateChild, this));
  gzdbg << "plugin model name: " << modelName << "\n";

  ROS_INFO("gazebo_ros_katana_gripper plugin initialized");
}

void GazeboRosKatanaGripper::InitChild()
{
  pid_controller_.reset();
  prev_update_time_ = this->my_world_->GetSimTime();
}

void GazeboRosKatanaGripper::FiniChild()
{
  rosnode_->shutdown();
}

void GazeboRosKatanaGripper::UpdateChild()
{
  // --------------- command joints  ---------------
  common::Time time_now = this->my_world_->GetSimTime();
  common::Time step_time = time_now - prev_update_time_;
  prev_update_time_ = time_now;
  ros::Duration dt = ros::Duration(step_time.Double());

  double desired_pos[NUM_JOINTS];
  double actual_pos[NUM_JOINTS];
  double commanded_effort[NUM_JOINTS];

  // check for new goals, this my change the active_gripper_action_
  this->updateActiveGripperAction();

  for (size_t i = 0; i < NUM_JOINTS; ++i)
  {
    // desired_pos = 0.3 * sin(0.25 * this->my_world_->GetSimTime());
    //if ((prev_update_time_.sec / 6) % 2 == 0)
    //  desired_pos[i] = 0.3;
    //else
    //  desired_pos[i] = -0.44;

    desired_pos[i] = active_gripper_action_->getNextDesiredPoint(ros::Time::now()).position;
    actual_pos[i] = joints_[i]->GetAngle(0).Radian();

    commanded_effort[i] = pid_controller_.computeCommand(desired_pos[i] - actual_pos[i], -joints_[i]->GetVelocity(0), dt);

    if (commanded_effort[i] > torque_)
      commanded_effort[i] = torque_;
    else if (commanded_effort[i] < -torque_)
      commanded_effort[i] = -torque_;

    joints_[i]->SetForce(0, commanded_effort[i]);

    // TODO: ensure that both joints are always having (approximately)
    // the same joint position, even if one is blocked by an object
  }
  if (fabs(commanded_effort[0]) > 0.001)
    ROS_DEBUG("efforts: r %f, l %f (max: %f)", commanded_effort[0], commanded_effort[1], torque_);

  // --------------- update gripper_grasp_controller  ---------------
  for (size_t i = 0; i < NUM_JOINTS; ++i)
  {

    // update all actions
    for (std::size_t i = 0; i != gripper_action_list_.size(); i++)
    {
      gripper_action_list_[i]->setCurrentPoint(joints_[i]->GetAngle(0).Radian(), joints_[i]->GetVelocity(0));
    }

  }

  // --------------- limit publishing frequency to 25 Hz ---------------
  publish_counter_ = ((publish_counter_ + 1) % 40);

  if (publish_counter_ == 0)
  {
    // --------------- publish gripper controller state  ---------------
    katana_msgs::GripperControllerState controller_state;
    controller_state.header.stamp = ros::Time::now();
    for (size_t i = 0; i < NUM_JOINTS; ++i)
    {
      controller_state.name.push_back(joints_[i]->GetName());
      controller_state.actual.push_back(actual_pos[i]);
      controller_state.desired.push_back(desired_pos[i]);
      controller_state.error.push_back(desired_pos[i] - actual_pos[i]);
    }

    controller_state_pub_.publish(controller_state);

    // don't publish joint states: The pr2_controller_manager publishes joint states for
    // ALL joints, not just the ones it controls.
    //
    //    // --------------- publish joint states ---------------
    //    js_.header.stamp = ros::Time::now();
    //
    //    for (size_t i = 0; i < NUM_JOINTS; ++i)
    //    {
    //      js_.position[i] = joints_[i]->GetAngle(0).Radian();
    //      js_.velocity[i] = joints_[i]->GetVelocity(0);
    //      js_.effort[i] = commanded_effort[i];
    //
    //      ROS_DEBUG("publishing gripper joint state %d (effort: %f)", i, commanded_effort[i]);
    //    }
    //
    //    joint_state_pub_.publish(js_);
  }
}

/**
 * Checks for new goals, if found changes the active_gripper_action_ member
 */
void GazeboRosKatanaGripper::updateActiveGripperAction()
{
  //TODO: improve the selection of the action, maybe prefer newer started actions (but how to know?)
  //      atm the list gives some kind of priority, and it its impossible to cancel a goal
  //      by submitting a new one to another action (but you can cancel the goal via a message)

  // search for a new action if the current (or default on) is finished with its goal
  // if we cant find a new action, just use the current one
  if (!active_gripper_action_->hasActiveGoal())
  {

    // find a new action with a goal
    for (std::size_t i = 0; i != gripper_action_list_.size(); i++)
    {
      // just use the first found
      if (gripper_action_list_[i]->hasActiveGoal())
      {
        // change the active gripper action
        active_gripper_action_ = gripper_action_list_[i];
        updateGains();

        break;
      }
    }
  }
}

void GazeboRosKatanaGripper::updateGains()
{
  // PID Controller parameters (gains)
  double p, i, d, i_max, i_min;
  // get current values
  pid_controller_.getGains(p, i, d, i_max, i_min);
  // overwrite with defaults from the active action
  active_gripper_action_->getGains(p, i, d, i_max, i_min);
  // set changed values
  pid_controller_.setGains(p, i, d, i_max, i_min);
}

void GazeboRosKatanaGripper::spin()
{
  while (ros::ok())
    ros::spinOnce();
}

GZ_REGISTER_MODEL_PLUGIN(GazeboRosKatanaGripper);
