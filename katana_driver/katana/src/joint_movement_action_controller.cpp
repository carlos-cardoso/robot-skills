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
 * joint_movement_action_controller.cpp
 *
 *  Created on: 07.04.2011
 *      Author: Henning Deeken <hdeeken@uos.de>
 *
 */

#include "katana/joint_movement_action_controller.h"
#include <fstream>
#include <iostream>
#include <cstdio>

namespace katana
{

JointMovementActionController::JointMovementActionController(boost::shared_ptr<AbstractKatana> katana) :
  katana_(katana), action_server_(ros::NodeHandle(), "katana_arm_controller/joint_movement_action",
                                  boost::bind(&JointMovementActionController::executeCB, this, _1), false)
{
  joints_ = katana_->getJointNames();
  gripper_joints_ = katana_->getGripperJointNames();
  action_server_.start();
}

JointMovementActionController::~JointMovementActionController()
{
}

/**
 * Checks if all joints in the joint goal match a among joints of the katana
 */
bool JointMovementActionController::suitableJointGoal(const std::vector<std::string> &jointGoalNames)
{
  for (size_t i = 0; i < jointGoalNames.size(); i++)
  {
    bool exists = false;

    for (size_t j = 0; j < joints_.size(); j++)
    {
      if (jointGoalNames[i] == joints_[j])
        exists = true;
    }

    for (size_t k = 0; k < gripper_joints_.size(); k++)
    {
      if (jointGoalNames[i] == gripper_joints_[k])
        exists = true;
    }
    if (!exists)
    {
      ROS_ERROR("joint name %s is not one of our controlled joints", jointGoalNames[i].c_str());
      return false;
    }
  }

  return true;
}

sensor_msgs::JointState JointMovementActionController::adjustJointGoalPositionsToMotorLimits(
                                                                                             const sensor_msgs::JointState &jointGoal)
{
  sensor_msgs::JointState adjustedJointGoal;

  adjustedJointGoal.name = jointGoal.name;
  adjustedJointGoal.position = jointGoal.position;

  for (size_t i = 0; i < jointGoal.name.size(); i++)
  {
    ROS_DEBUG("%s - min: %f - max: %f - curr: % f - req: %f", jointGoal.name[i].c_str(), katana_->getMotorLimitMin(jointGoal.name[i]), katana_->getMotorLimitMax(jointGoal.name[i]), katana_->getMotorAngles()[katana_->getJointIndex(jointGoal.name[i])], jointGoal.position[i]);
  }

  for (size_t i = 0; i < jointGoal.name.size(); i++)
  {

    if (jointGoal.position[i] < katana_->getMotorLimitMin(jointGoal.name[i]))
    {
      adjustedJointGoal.position[i] = katana_->getMotorLimitMin(jointGoal.name[i]);

      ROS_INFO("%s - requested JointGoalPosition: %f exceeded MotorLimit: %f  - adjusted JointGoalPosition to MotorLimit", jointGoal.name[i].c_str(), jointGoal.position[i], katana_->getMotorLimitMin(jointGoal.name[i]));
    }

    if (jointGoal.position[i] > katana_->getMotorLimitMax(jointGoal.name[i]))
    {
      adjustedJointGoal.position[i] = katana_->getMotorLimitMax(jointGoal.name[i]);
      ROS_INFO("%s - requested JointGoalPosition: %f exceeded MotorLimit: %f  - adjusted JointGoalPosition to MotorLimit", jointGoal.name[i].c_str(), jointGoal.position[i], katana_->getMotorLimitMax(jointGoal.name[i]));
    }
  }

  return adjustedJointGoal;
}

void JointMovementActionController::executeCB(const JMAS::GoalConstPtr &goal)
{
  // note: the SimpleActionServer guarantees that we enter this function only when
  // there is no other active goal. in other words, only one instance of executeCB()
  // is ever running at the same time.

  if (!suitableJointGoal(goal->jointGoal.name))
  {
    ROS_ERROR("Joints on incoming goal don't match our joints/gripper_joints");

    for (size_t i = 0; i < goal->jointGoal.name.size(); i++)
    {
      ROS_INFO("  incoming joint %d: %s", (int)i, goal->jointGoal.name[i].c_str());
    }

    for (size_t i = 0; i < joints_.size(); i++)
    {
      ROS_INFO("  our joint      %d: %s", (int)i, joints_[i].c_str());
    }

    for (size_t i = 0; i < gripper_joints_.size(); i++)
    {
      ROS_INFO("  our gripper_joint      %d: %s", (int)i, gripper_joints_[i].c_str());
    }
    action_server_.setAborted();
    return;
  }

  if (action_server_.isPreemptRequested())
  {
    ROS_WARN("New action goal already seems to have been cancelled!");
    action_server_.setPreempted();
    return;
  }

  // adjust all goal positions to match the given motor limits
  sensor_msgs::JointState adjustedJointGoal = adjustJointGoalPositionsToMotorLimits(goal->jointGoal);

  ROS_INFO("Sending movement to Katana arm...");

  for (size_t i = 0; i < adjustedJointGoal.name.size(); i++)
  {
    if (!katana_->moveJoint(katana_->getJointIndex(adjustedJointGoal.name[i]), adjustedJointGoal.position[i]))
    {
      ROS_ERROR("Problem while transferring movement to Katana arm. Aborting...");
      action_server_.setAborted();
      return;
    }
  }

  ros::Rate goalWait(10.0);

  while (ros::ok())
  {
    // always have to call this before calling someMotorCrashed() or allJointsReady()
    katana_->refreshMotorStatus();

    if (katana_->someMotorCrashed())
    {
      ROS_ERROR("Some motor has crashed! Aborting...");
      action_server_.setAborted();
      return;
    }

    if (katana_->allJointsReady())
    {
      ROS_INFO("...movement successfully executed.");
      action_server_.setSucceeded();
      return;
    }

    if (action_server_.isPreemptRequested())
    {
      ROS_WARN("Goal canceled by client while waiting for movement to finish, aborting!");
      action_server_.setPreempted();
      return;
    }

    goalWait.sleep();
  }
}

}

