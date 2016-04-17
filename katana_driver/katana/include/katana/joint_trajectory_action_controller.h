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
 * joint_trajectory_action_controller.h
 *
 *  Created on: 07.12.2010
 *      Author: Martin Günther <mguenthe@uos.de>
 */

#ifndef JOINT_TRAJECTORY_ACTION_CONTROLLER_H__
#define JOINT_TRAJECTORY_ACTION_CONTROLLER_H__

#include <vector>

#include <ros/node_handle.h>

#include <actionlib/server/simple_action_server.h>
#include <actionlib/client/simple_action_client.h>

#include <trajectory_msgs/JointTrajectory.h>
#include <pr2_controllers_msgs/QueryTrajectoryState.h>
#include <pr2_controllers_msgs/JointTrajectoryControllerState.h>

#include <pr2_controllers_msgs/JointTrajectoryAction.h>
#include <control_msgs/FollowJointTrajectoryAction.h>

#include <katana/AbstractKatana.h>
#include <katana/SpecifiedTrajectory.h>
#include <katana/spline_functions.h>

namespace katana
{

class JointTrajectoryActionController
{

// Action typedefs for the original PR2 specific joint trajectory action
typedef actionlib::SimpleActionServer<pr2_controllers_msgs::JointTrajectoryAction> JTAS;
typedef actionlib::SimpleActionClient<pr2_controllers_msgs::JointTrajectoryAction> JTAC;

// Action typedefs for the new follow joint trajectory action
typedef actionlib::SimpleActionServer<control_msgs::FollowJointTrajectoryAction> FJTAS;

public:
  JointTrajectoryActionController(boost::shared_ptr<AbstractKatana> katana);
  virtual ~JointTrajectoryActionController();

  void reset_trajectory_and_stop();
  void update();

private:
  // additional control_msgs::FollowJointTrajectoryResult
  enum { PREEMPT_REQUESTED = -1000 };

  // robot and joint state
  std::vector<std::string> joints_; // controlled joints, same order as expected by the KNI (index 0 = first motor, ...)
  boost::shared_ptr<AbstractKatana> katana_;

  // parameters
//  double goal_time_constraint_;
  double stopped_velocity_tolerance_;
  std::vector<double> goal_constraints_;

  // subscriber to "command" topic
  void commandCB(const trajectory_msgs::JointTrajectory::ConstPtr &msg);
  ros::Subscriber sub_command_;

  // "query_state" service
  bool queryStateService(pr2_controllers_msgs::QueryTrajectoryState::Request &req,
                         pr2_controllers_msgs::QueryTrajectoryState::Response &resp);
  ros::ServiceServer serve_query_state_;

  // publisher to "state" topic
  ros::Publisher controller_state_publisher_;

  // action servers
  JTAS action_server_;
  FJTAS action_server_follow_;
  void executeCB(const JTAS::GoalConstPtr &goal);
  void executeCBFollow(const FJTAS::GoalConstPtr &goal);
  int executeCommon(const trajectory_msgs::JointTrajectory &trajectory, boost::function<bool ()> isPreemptRequested);

  boost::shared_ptr<SpecifiedTrajectory> current_trajectory_;

  boost::shared_ptr<SpecifiedTrajectory> calculateTrajectory(const trajectory_msgs::JointTrajectory &msg);

  bool validJoints(std::vector<std::string> new_joint_names);

  std::vector<int> makeJointsLookup(const trajectory_msgs::JointTrajectory &msg);

  bool validTrajectory(const SpecifiedTrajectory &traj);

  bool goalReached();

  bool allJointsStopped();
};
}

#endif /* JOINT_TRAJECTORY_ACTION_CONTROLLER_H_ */
