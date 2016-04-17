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
#ifndef KATANA_GRIPPER_JOINT_TRAJECTORY_CONTROLLER_H_
#define KATANA_GRIPPER_JOINT_TRAJECTORY_CONTROLLER_H_

#include <ros/ros.h>
#include <actionlib/server/action_server.h>

#include <trajectory_msgs/JointTrajectory.h>
#include <pr2_controllers_msgs/JointTrajectoryAction.h>
#include <pr2_controllers_msgs/JointTrajectoryControllerState.h>

#include <katana_gazebo_plugins/gazebo_ros_katana_gripper_action_interface.h>

namespace katana_gazebo_plugins
{

/**
 *  allowed difference between desired and actual position
 */
static const double GRIPPER_ANGLE_THRESHOLD = 0.005;

/**
 * This class allows you to send JointTrajectory messages to the Katana Arm simulated in Gazebo
 */
class KatanaGripperJointTrajectoryController : public IGazeboRosKatanaGripperAction
{

private:
  typedef actionlib::ActionServer<pr2_controllers_msgs::JointTrajectoryAction> JTAS;
  typedef JTAS::GoalHandle GoalHandle;

public:

  KatanaGripperJointTrajectoryController(ros::NodeHandle pn);
  virtual ~KatanaGripperJointTrajectoryController();

private:

  JTAS *action_server_;

  bool has_active_goal_;
  GoalHandle active_goal_;
  trajectory_msgs::JointTrajectory current_traj_;
  bool trajectory_finished_;

  // the internal state of the gripper
  GRKAPoint current_point_;
  GRKAPoint last_desired_point_;

  std::vector<std::string> joint_names_;
  std::map<std::string, double> goal_constraints_;
  std::map<std::string, double> trajectory_constraints_;
  double goal_time_constraint_;
  double stopped_velocity_tolerance_;

  // call-back methods
  void goalCB(GoalHandle gh);
  void cancelCB(GoalHandle gh);

  // helper methods
  static bool setsEqual(const std::vector<std::string> &a, const std::vector<std::string> &b);
  void checkGoalStatus();
  bool currentIsDesiredAngle();
  void setCurrentTrajectory(trajectory_msgs::JointTrajectory traj);
  bool isTrajectoryFinished();

public:
  // public methods defined by interface IGazeboRosKatanaGripperAction

  GRKAPoint getNextDesiredPoint(ros::Time time);
  void getGains(double &p, double &i, double &d, double &i_max, double &i_min);

  void setCurrentPoint(GRKAPoint point)
  {
    this->current_point_ = point;
    this->checkGoalStatus();
  }

  void cancelGoal()
  {
    cancelCB(active_goal_);
  }

  /**
   * are there any more points?
   */
  bool hasActiveGoal() const
  {
    return has_active_goal_;
  }

};

} // namespace katana_gazebo_plugins


// copied here from package spline_smoother, which was removed in hydro
namespace spline_smoother
{

static inline void generatePowers(int n, double x, double* powers)
{
  powers[0] = 1.0;
  for (int i=1; i<=n; i++)
  {
    powers[i] = powers[i-1]*x;
  }
}

/**
 * \brief Calculates cubic spline coefficients given the start and end way-points
 *
 * The input to this function is the start and end way-point, with position, velocity
 * and the duration of the spline segment. (assumes that the spline runs from 0 to time)
 *
 * Returns 4 coefficients of the quintic polynomial in the "coefficients" vector. The spline can then
 * be sampled as:
 * x = coefficients[0]*t^0 + coefficients[1]*t^1 ... coefficients[3]*t^3
 */
void getCubicSplineCoefficients(double start_pos, double start_vel,
    double end_pos, double end_vel, double time, std::vector<double>& coefficients);

/**
 * \brief Samples a cubic spline segment at a particular time
 */
void sampleCubicSpline(const std::vector<double>& coefficients, double time,
    double& position, double& velocity, double& acceleration);


inline void getCubicSplineCoefficients(double start_pos, double start_vel,
    double end_pos, double end_vel, double time, std::vector<double>& coefficients)
{
  coefficients.resize(4);

  double T[4];
  generatePowers(3, time, T);

  coefficients[0] = start_pos;
  coefficients[1] = start_vel;
  coefficients[2] = (-3.0*start_pos + 3.0*end_pos - 2.0*start_vel*T[1] - end_vel*T[1]) / T[2];
  coefficients[3] = (2.0*start_pos - 2.0*end_pos + start_vel*T[1] + end_vel*T[1]) / T[3];
}

inline void sampleCubicSpline(const std::vector<double>& coefficients, double time,
    double& position, double& velocity, double& acceleration)
{
  double t[4];
  generatePowers(3, time, t);

  position = t[0]*coefficients[0] +
    t[1]*coefficients[1] +
    t[2]*coefficients[2] +
    t[3]*coefficients[3];

  velocity = t[0]*coefficients[1] +
    2.0*t[1]*coefficients[2] +
    3.0*t[2]*coefficients[3];

  acceleration = 2.0*t[0]*coefficients[2] +
    6.0*t[1]*coefficients[3];
}

} // namespace spline_smoother

#endif /* KATANA_GRIPPER_JOINT_TRAJECTORY_CONTROLLER_H_ */
