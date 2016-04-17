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
 * katana_gripper_grasp_controller.cpp
 *
 *  Created on: 29.01.2011
 *      Author: Martin Günther <mguenthe@uos.de>
 *
 * based on pr2_gripper_grasp_controller
 *
 */

#include <katana_gazebo_plugins/katana_gripper_grasp_controller.h>

namespace katana_gazebo_plugins
{

// copied from katana_constants.h:

/// Constants for gripper fully open or fully closed (should be equal to the value in the urdf description)
static const double GRIPPER_OPEN_ANGLE = 0.30;

/// Constants for gripper fully open or fully closed (should be equal to the value in the urdf description)
static const double GRIPPER_CLOSED_ANGLE = -0.44;

/// The maximum time it takes to open or close the gripper
static const double GRIPPER_OPENING_CLOSING_DURATION = 3.0;

KatanaGripperGraspController::KatanaGripperGraspController(ros::NodeHandle private_nodehandle) :
  desired_angle_(0.0), current_angle_(0.0), has_new_desired_angle_(false)
{
  ros::NodeHandle root_nh("");

  private_nodehandle.param<double> ("goal_threshold", goal_threshold_, 0.01);

  std::string query_service_name = root_nh.resolveName("gripper_grasp_status");
  query_srv_ = root_nh.advertiseService(query_service_name, &KatanaGripperGraspController::serviceCallback, this);
  ROS_INFO_STREAM("katana gripper grasp query service started on topic " << query_service_name);

  std::string gripper_grasp_posture_controller = root_nh.resolveName("gripper_grasp_posture_controller");
  action_server_ = new actionlib::SimpleActionServer<control_msgs::GripperCommandAction>(root_nh,
      gripper_grasp_posture_controller, boost::bind(&KatanaGripperGraspController::executeCB, this, _1), false);
  action_server_->start();
  ROS_INFO_STREAM("katana gripper grasp hand posture action server started on topic " << gripper_grasp_posture_controller);
}

KatanaGripperGraspController::~KatanaGripperGraspController()
{
  delete action_server_;
}

void KatanaGripperGraspController::executeCB(const control_msgs::GripperCommandGoalConstPtr &goal)
{
  ROS_INFO("Moving gripper to position: %f", goal->command.position);

  control_msgs::GripperCommandResult result;
  result.position = current_angle_;
  result.reached_goal = false;
  result.stalled = false;

  if(goal->command.position < GRIPPER_CLOSED_ANGLE || goal->command.position > GRIPPER_OPEN_ANGLE)
  {
    ROS_WARN("Goal position (%f) outside gripper range. Or some other stuff happened.", goal->command.position);
    action_server_->setAborted(result);
  }
  else
  {
    setDesiredAngle(goal->command.position);
    ros::Duration(GRIPPER_OPENING_CLOSING_DURATION).sleep();
    if(fabs(goal->command.position - current_angle_) > goal_threshold_)
    {
      ROS_INFO("Gripper stalled.");
      result.stalled = true;
    }
    else
    {
      ROS_INFO("Gripper goal reached.");
      result.reached_goal = true;
    }
    result.position = current_angle_;
    action_server_->setSucceeded(result);
  }
}

bool KatanaGripperGraspController::serviceCallback(control_msgs::QueryTrajectoryState::Request &request,
                                                   control_msgs::QueryTrajectoryState::Response &response)
{
  response.position.resize(1);
  response.position[0] = current_angle_;
  return true;
}

void KatanaGripperGraspController::getGains(double &p, double &i, double &d, double &i_max, double &i_min) {
  p = 0.4;
  i = 0.1;
  d = 0.0;
}


}
