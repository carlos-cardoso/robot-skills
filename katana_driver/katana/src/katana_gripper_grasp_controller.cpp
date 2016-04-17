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

#include <katana/katana_gripper_grasp_controller.h>

namespace katana
{

KatanaGripperGraspController::KatanaGripperGraspController(boost::shared_ptr<AbstractKatana> katana) :
  katana_(katana)
{
  ros::NodeHandle root_nh("");
  ros::NodeHandle pn("~");

  pn.param<double> ("goal_threshold", goal_threshold_, 0.01);

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
  bool moveJointSuccess = katana_->moveJoint(GRIPPER_INDEX, goal->command.position);
  // wait for gripper to open/close
  ros::Duration(GRIPPER_OPENING_CLOSING_DURATION).sleep();
  
  control_msgs::GripperCommandResult result;
  result.position = katana_->getMotorAngles()[GRIPPER_INDEX];
  result.reached_goal = false;
  result.stalled = false;
  
  if (moveJointSuccess && fabs(result.position - goal->command.position) < goal_threshold_)
  {  
    ROS_INFO("Gripper goal reached");
    result.reached_goal = true;
    action_server_->setSucceeded(result); 
  }
  else if (moveJointSuccess && fabs(result.position - goal->command.position) > goal_threshold_)
  {
    ROS_INFO("Gripper stalled.");
    result.stalled = true;
    action_server_->setSucceeded(result);
  }
  else
  {
    ROS_WARN("Goal position (%f) outside gripper range. Or some other stuff happened.", goal->command.position);
    action_server_->setAborted(result);
  }


}

bool KatanaGripperGraspController::serviceCallback(control_msgs::QueryTrajectoryState::Request &request, 
                                                   control_msgs::QueryTrajectoryState::Response &response)
{
  response.position.resize(1);
  response.position[0] = katana_->getMotorAngles()[GRIPPER_INDEX];
  return true;
}

}
