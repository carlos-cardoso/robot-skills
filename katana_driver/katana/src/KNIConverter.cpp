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
 * KNIConverter.cpp
 *
 *  Created on: 21.01.2011
 *      Author: Martin Günther <mguenthe@uos.de>
 */

#include <katana/KNIConverter.h>

namespace katana
{

KNIConverter::KNIConverter(std::string config_file_path)
{
  bool success = config_.openFile(config_file_path.c_str());

  if (!success)
    ROS_ERROR("Could not open config file: %s", config_file_path.c_str());
}

KNIConverter::~KNIConverter()
{
}

/**
 * Theoretically, all *_rad2enc functions should return integers (because encoder values are integer). However,
 * because velocities, accelerations and jerks are divided by 100/100^2/100^3, they would return 0 most of the
 * time. Therefore, return the values as double.
 */
double KNIConverter::angle_rad2enc(int index, double angle)
{
  // Attention:
  //   - if you get TMotInit using config_.getMotInit(index), then angleOffset etc. will be in degrees
  //   - if you get TMotInit using config_.getMOT().arr[index].GetInitialParameters(), all angles will be in radian.
  //
  // whoever coded the KNI has some serious issues...

  const TMotInit param = config_.getMotInit(index);

  // normalize our input to [-pi, pi)
  while (angle < -M_PI)
    angle += 2 * M_PI;

  while (angle >= M_PI)
    angle -= 2 * M_PI;

  // motors 0, 2, 3, 4 had to be shifted by Pi so that the range can be normalized
  // into a range [-Pi ... 0 ... Pi]; now shift back
  if (index == 0 || index == 2 || index == 3 || index == 4)
    angle += M_PI;

  if (index == (int)GRIPPER_INDEX)
    angle = (angle - GRIPPER_CLOSED_ANGLE) / KNI_TO_URDF_GRIPPER_FACTOR + KNI_GRIPPER_CLOSED_ANGLE;

  return ((deg2rad(param.angleOffset) - angle) * (double)param.encodersPerCycle * (double)param.rotationDirection)
      / (2.0 * M_PI) + param.encoderOffset;
}

double KNIConverter::angle_enc2rad(int index, int encoders)
{
  const TMotInit param = config_.getMotInit(index);

  double result = deg2rad(param.angleOffset) - (((double)encoders - (double)param.encoderOffset) * 2.0 * M_PI)
      / ((double)param.encodersPerCycle * (double)param.rotationDirection);

  if (index == (int)GRIPPER_INDEX)
  {
    result = (result - KNI_GRIPPER_CLOSED_ANGLE) * KNI_TO_URDF_GRIPPER_FACTOR + GRIPPER_CLOSED_ANGLE;
  }

  // motors 0, 2, 3, 4 have to be shifted by Pi so that the range can be normalized
  // into a range [-Pi ... 0 ... Pi]
  // (the KNI normalizes these angles to [0, 2 * Pi])
  if (index == 0 || index == 2 || index == 3 || index == 4)
    result -= M_PI;

  // normalize our output to [-pi, pi)
  while (result < -M_PI)
    result += 2 * M_PI;

  while (result >= M_PI)
    result -= 2 * M_PI;

  return result;
}

/**
 * Conversions for velocity, acceleration and jerk (first derivative of acceleration).
 * Basically the same as for angle, but without the offsets.
 */
double KNIConverter::vel_rad2enc(int index, double vel)
{
  return vel_acc_jerk_rad2enc(index, vel) / KNI_TO_ROS_TIME;
}

double KNIConverter::acc_rad2enc(int index, double acc)
{
  return vel_acc_jerk_rad2enc(index, acc) / pow(KNI_TO_ROS_TIME, 2);
}

double KNIConverter::jerk_rad2enc(int index, double jerk)
{
  return vel_acc_jerk_rad2enc(index, jerk) / pow(KNI_TO_ROS_TIME, 3);
}

double KNIConverter::vel_enc2rad(int index, short encoders)
{
  return vel_acc_jerk_enc2rad(index, encoders) * KNI_TO_ROS_TIME;
}

double KNIConverter::acc_enc2rad(int index, short encoders)
{
  return vel_acc_jerk_enc2rad(index, encoders) * pow(KNI_TO_ROS_TIME, 2);
}

double KNIConverter::jerk_enc2rad(int index, short encoders)
{
  return vel_acc_jerk_enc2rad(index, encoders) * pow(KNI_TO_ROS_TIME, 3);
}

double KNIConverter::vel_acc_jerk_rad2enc(int index, double vel_acc_jerk)
{
  const TMotInit param = config_.getMotInit(index);

  if (index == (int)GRIPPER_INDEX)
    vel_acc_jerk = vel_acc_jerk / KNI_TO_URDF_GRIPPER_FACTOR;

  return ((-vel_acc_jerk) * (double)param.encodersPerCycle * (double)param.rotationDirection) / (2.0 * M_PI);
}

double KNIConverter::vel_acc_jerk_enc2rad(int index, short encoders)
{
  const TMotInit param = config_.getMotInit(index);

  double result = -((double)encoders * 2.0 * M_PI) / ((double)param.encodersPerCycle * (double)param.rotationDirection);

  if (index == (int)GRIPPER_INDEX)
  {
    result = result * KNI_TO_URDF_GRIPPER_FACTOR;
  }

  return result;
}

double KNIConverter::deg2rad(const double deg)
{
  return deg * (M_PI / 180.0);
}

}
