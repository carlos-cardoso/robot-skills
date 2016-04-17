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
 * SimulatedKatana.cpp
 *
 *  Created on: 20.12.2010
 *      Author: Martin Günther <mguenthe@uos.de>
 */

#include "../include/katana/SimulatedKatana.h"

namespace katana
{

SimulatedKatana::SimulatedKatana() :
  AbstractKatana()
{
  // Creates a "hold current position" trajectory.
  boost::shared_ptr<SpecifiedTrajectory> hold_ptr(new SpecifiedTrajectory(1));
  SpecifiedTrajectory &hold = *hold_ptr;
  hold[0].start_time = ros::Time::now().toSec() - 0.001;
  hold[0].duration = 0.0;
  hold[0].splines.resize(NUM_MOTORS);

  hold[0].splines[0].coef[0] = -3.022;
  hold[0].splines[1].coef[0] = 2.163;
  hold[0].splines[2].coef[0] = -2.207;
  hold[0].splines[3].coef[0] = -2.026;
  hold[0].splines[4].coef[0] = -2.990;
  hold[0].splines[5].coef[0] = GRIPPER_OPEN_ANGLE;

  current_trajectory_ = hold_ptr;
}

SimulatedKatana::~SimulatedKatana()
{
}

void SimulatedKatana::refreshEncoders()
{
  const SpecifiedTrajectory &traj = *current_trajectory_;

  // Determines which segment of the trajectory to use
  size_t seg = 0;
  while (seg + 1 < traj.size() && traj[seg + 1].start_time <= ros::Time::now().toSec())
  {
    seg++;
  }

  for (size_t j = 0; j < traj[seg].splines.size(); j++)
  {
    double pos_t, vel_t, acc_t;
    sampleSplineWithTimeBounds(traj[seg].splines[j].coef, traj[seg].duration, ros::Time::now().toSec()
        - traj[seg].start_time, pos_t, vel_t, acc_t);

    motor_angles_[j] = pos_t;
    motor_velocities_[j] = vel_t;
  }
}

bool SimulatedKatana::executeTrajectory(boost::shared_ptr<SpecifiedTrajectory> traj_ptr, boost::function<bool ()> isPreemptRequested)
{
  // ------- wait until start time
  ros::Time::sleepUntil(ros::Time(traj_ptr->at(0).start_time));

  current_trajectory_ = traj_ptr;
  return true;
}

void SimulatedKatana::moveGripper(double openingAngle)
{
  static const double DURATION = 2.877065;   // time to open/close gripper, measured on real Katana

  if (openingAngle < GRIPPER_CLOSED_ANGLE || GRIPPER_OPEN_ANGLE < openingAngle)
  {
    ROS_ERROR("Desired opening angle %f is out of range [%f, %f]", openingAngle, GRIPPER_CLOSED_ANGLE, GRIPPER_OPEN_ANGLE);
    return;
  }

  // create a new trajectory
  boost::shared_ptr<SpecifiedTrajectory> new_traj_ptr(new SpecifiedTrajectory(1));
  SpecifiedTrajectory &new_traj = *new_traj_ptr;
  new_traj[0].start_time = ros::Time::now().toSec();
  new_traj[0].duration = DURATION;
  new_traj[0].splines.resize(NUM_MOTORS);

  // hold all joints at their current position
  for (size_t j = 0; j < NUM_MOTORS; ++j)
    new_traj[0].splines[j].coef[0] = motor_angles_[j];

  // move the gripper to the desired angle
  new_traj[0].splines[GRIPPER_INDEX].target_position = openingAngle;
  getCubicSplineCoefficients(motor_angles_[GRIPPER_INDEX], 0.0, openingAngle, 0.0, DURATION,
                             new_traj[0].splines[GRIPPER_INDEX].coef);

  current_trajectory_ = new_traj_ptr;
  return;
}

bool SimulatedKatana::moveJoint(int jointIndex, double turningAngle){
  ROS_ERROR("moveJoint() not yet implemented for SimulatedKatana!");
  return false;
}

bool SimulatedKatana::someMotorCrashed() {
  return false;
}

bool SimulatedKatana::allJointsReady() {
  return true;
}

bool SimulatedKatana::allMotorsReady() {
  return true;
}


}
