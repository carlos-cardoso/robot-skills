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
 * katana_gripper_joint_trajectory_controller.h
 *
 *  Created on: 20.10.2011
 *      Author: Karl Glatz <glatz@hs-weingarten.de>
 *              Ravensburg-Weingarten, University of Applied Sciences
 *
 *  based on joint_trajectory_action/src/joint_trajectory_action.cpp
 *
 */

#include <katana_gazebo_plugins/katana_gripper_joint_trajectory_controller.h>

namespace katana_gazebo_plugins
{

KatanaGripperJointTrajectoryController::KatanaGripperJointTrajectoryController(ros::NodeHandle pn) :
    has_active_goal_(false), trajectory_finished_(true) /* c++0x: , current_point_({0.0, 0.0}), last_desired_point_( {0.0, 0.0})*/
{

  GRKAPoint default_point = {0.0, 0.0};
  current_point_ = default_point;
  last_desired_point_ = default_point;

  // set the joints fixed here
  joint_names_.push_back((std::string)"katana_r_finger_joint");
  joint_names_.push_back((std::string)"katana_l_finger_joint");

  pn.param("constraints/goal_time", goal_time_constraint_, 5.0);

  // Gets the constraints for each joint.
  for (size_t i = 0; i < joint_names_.size(); ++i)
  {
    std::string ns = std::string("constraints/") + joint_names_[i];
    double g, t;
    pn.param(ns + "/goal", g, -1.0);
    pn.param(ns + "/trajectory", t, -1.0);
    goal_constraints_[joint_names_[i]] = g;
    trajectory_constraints_[joint_names_[i]] = t;
  }
  pn.param("constraints/stopped_velocity_tolerance", stopped_velocity_tolerance_, 0.01);

  ros::NodeHandle action_node("katana_arm_controller");

  action_server_ = new JTAS(action_node, "gripper_joint_trajectory_action",
                            boost::bind(&KatanaGripperJointTrajectoryController::goalCB, this, _1),
                            boost::bind(&KatanaGripperJointTrajectoryController::cancelCB, this, _1), false);

  action_server_->start();
  ROS_INFO(
      "katana gripper joint trajectory action server started on topic katana_arm_controller/gripper_joint_trajectory_action");

}

KatanaGripperJointTrajectoryController::~KatanaGripperJointTrajectoryController()
{
  delete action_server_;
}

bool KatanaGripperJointTrajectoryController::setsEqual(const std::vector<std::string> &a,
                                                       const std::vector<std::string> &b)
{
  if (a.size() != b.size())
    return false;

  for (size_t i = 0; i < a.size(); ++i)
  {
    if (count(b.begin(), b.end(), a[i]) != 1)
      return false;
  }
  for (size_t i = 0; i < b.size(); ++i)
  {
    if (count(a.begin(), a.end(), b[i]) != 1)
      return false;
  }

  return true;
}

void KatanaGripperJointTrajectoryController::checkGoalStatus()
{

  ros::Time now = ros::Time::now();

  if (!has_active_goal_)
    return;
  if (current_traj_.points.empty())
    return;

  // time left?
  if (now < current_traj_.header.stamp + current_traj_.points[0].time_from_start)
    return;

  int last = current_traj_.points.size() - 1;
  ros::Time end_time = current_traj_.header.stamp + current_traj_.points[last].time_from_start;

  bool inside_goal_constraints = false;

  if (this->isTrajectoryFinished())
  {

    if (this->currentIsDesiredAngle())
    {
      inside_goal_constraints = true;
    }

  }

  if (inside_goal_constraints)
  {
    ROS_DEBUG("Goal Succeeded!");
    active_goal_.setSucceeded();
    has_active_goal_ = false;
    ROS_INFO("last_desired_point_.position: %f current_point_.position: %f", last_desired_point_.position, current_point_.position);
  }
  else if (now < end_time + ros::Duration(goal_time_constraint_))
  {
    // Still have some time left to make it.
    ROS_DEBUG("Still have some time left to make it.");
    //ROS_INFO("Still have some time left to make it. current_point_.position: %f ", current_point_.position);
  }
  else
  {
    ROS_WARN(
        "Aborting because we wound up outside the goal constraints [current_angle: %f last_desired_angle: %f ]", current_point_.position, last_desired_point_.position);
    active_goal_.setAborted();
    has_active_goal_ = false;
  }

}

bool KatanaGripperJointTrajectoryController::currentIsDesiredAngle()
{

  double current_angle_ = current_point_.position;
  double desired_angle_ = last_desired_point_.position;

  ROS_DEBUG("current_angle_: %f desired_angle_: %f", current_angle_, desired_angle_);

  return ((current_angle_ - GRIPPER_ANGLE_THRESHOLD) <= desired_angle_
      && (current_angle_ + GRIPPER_ANGLE_THRESHOLD) >= desired_angle_);

}

void KatanaGripperJointTrajectoryController::goalCB(GoalHandle gh)
{

  ROS_DEBUG("KatanaGripperJointTrajectoryController::goalCB");

  // Ensures that the joints in the goal match the joints we are commanding.
  if (!setsEqual(joint_names_, gh.getGoal()->trajectory.joint_names))
  {
    ROS_ERROR("KatanaGripperJointTrajectoryController::goalCB: Joints on incoming goal don't match our joints");
    gh.setRejected();
    return;
  }

  double desired_start_pos = gh.getGoal()->trajectory.points[0].positions[0];
  if (fabs(desired_start_pos - current_point_.position) > 0.05) {
    ROS_ERROR("Input trajectory is invalid (difference between desired and current point too high: %f). This might crash Gazebo with error \"The minimum corner of the box must be less than or equal to maximum corner\".", fabs(desired_start_pos - current_point_.position));
    gh.setRejected();
    return;
  }

  // Cancels the currently active goal.
  if (has_active_goal_)
  {
    // Stops the controller.
    trajectory_finished_ = true;

    // Marks the current goal as canceled.
    active_goal_.setCanceled();
    has_active_goal_ = false;
  }

  gh.setAccepted();
  active_goal_ = gh;
  has_active_goal_ = true;

  // Sends the trajectory "along to the controller"
  this->setCurrentTrajectory(active_goal_.getGoal()->trajectory);
}

void KatanaGripperJointTrajectoryController::cancelCB(GoalHandle gh)
{
  if (active_goal_ == gh)
  {
    // stop sending points
    trajectory_finished_ = true;

    // Marks the current goal as canceled.
    active_goal_.setCanceled();
    has_active_goal_ = false;
  }
}

void KatanaGripperJointTrajectoryController::setCurrentTrajectory(trajectory_msgs::JointTrajectory traj)
{

  if (traj.points.empty())
  {
    ROS_WARN("KatanaGripperJointTrajectoryController::setCurrentTrajectory: Empty trajectory");
    return;
  }

  //TODO: check current position of the gripper to avoid too big efforts

  // traj.points.resize(traj.points.size()+1);


  this->current_traj_ = traj;
  // set the finished flag to false for this new trajectory
  this->trajectory_finished_ = false;

}

GRKAPoint KatanaGripperJointTrajectoryController::getNextDesiredPoint(ros::Time time)
{
  //ROS_INFO("getNextDesiredPoint");

  trajectory_msgs::JointTrajectory traj = current_traj_;

  // is there a active trajectory?
  if (trajectory_finished_)
  {
    // just send the last point (default 0.0)
    return current_point_;
  }

  // should we start already??
  if (time.toSec() < traj.header.stamp.toSec())
  {
    // just send the last point (default 0.0)
    return current_point_;
  }

  ros::Duration relative_time = ros::Duration(time.toSec() - traj.header.stamp.toSec());

  //ROS_INFO("time: %f | header.stamp %f", time.toSec(), traj.header.stamp.toSec());
  //ROS_INFO("relative_time %f", relative_time.toSec());

  // search for correct trajectory segment
  size_t traj_segment = 0;
  bool found_traj_seg = false;
  size_t numof_points = traj.points.size();
  for (size_t i = 1; i < numof_points; i++)
  {
    if (traj.points[i].time_from_start >= relative_time)
    {
      traj_segment = i;
      found_traj_seg = true;
      break;
    }
  }

  // segment found?
  // not found happens only if the time is beyond of any time_from_start values of the points in the trajectory
  if (!found_traj_seg)
  {
    ROS_INFO(
        "Trajectory finished (requested time %f time_from_start[last_point]: %f)", relative_time.toSec(), traj.points[traj.points.size()-1].time_from_start.toSec());

    // set trajectory to finished
    trajectory_finished_ = true;

    // stay at the last point
    return last_desired_point_;
  }

  // sample one point at current time
  size_t start_index = traj_segment - 1;
  size_t end_index = traj_segment;

  double start_pos = traj.points[start_index].positions[0];
  double start_vel = traj.points[start_index].velocities[0];
//  double start_acc = traj.points[start_index].accelerations[0];

  //ROS_INFO("start_index %i: start_pos %f start_vel %f", start_index, start_pos, start_vel);

  double end_pos = traj.points[end_index].positions[0];
  double end_vel = traj.points[end_index].velocities[0];
//  double end_acc = traj.points[end_index].accelerations[0];

  //ROS_INFO("end_index %i: end_pos %f end_vel %f", end_index, end_pos, end_vel);

  double time_from_start = traj.points[end_index].time_from_start.toSec();
//  double duration = traj.points[end_index].time_from_start.toSec()  - traj.points[start_index].time_from_start.toSec();

  //ROS_INFO("time_from_start %f | relative_time.toSec() %f", time_from_start, relative_time.toSec());

  //TODO: save the coefficients for each segment
  std::vector<double> coefficients;

  spline_smoother::getCubicSplineCoefficients(start_pos, start_vel, end_pos, end_vel, time_from_start, coefficients);

  double sample_pos = 0, sample_vel = 0, sample_acc = 0;
//  katana::sampleSplineWithTimeBounds(coefficients, duration, relative_time.toSec(), sample_pos, sample_vel, sample_acc);
  spline_smoother::sampleCubicSpline(coefficients, relative_time.toSec(), sample_pos, sample_vel, sample_acc);

  //ROS_INFO("sample_pos: %f, sample_vel: %f", sample_pos, sample_vel);
  //ROS_INFO("current_point_.position: %f ", current_point_.position);

  GRKAPoint point = {sample_pos, sample_vel};

  // set the last desired point
  last_desired_point_ = point;

  return point;

}

bool KatanaGripperJointTrajectoryController::isTrajectoryFinished()
{
  return trajectory_finished_;
}


void KatanaGripperJointTrajectoryController::getGains(double &p, double &i, double &d, double &i_max, double &i_min) {
  p = 6.0;
  i = 0.1;
  d = 0.1;
}


} // end namespace

