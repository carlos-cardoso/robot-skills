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
 * katana_constants.h
 *
 *  Created on: 29.01.2011
 *      Author: Martin Günther <mguenthe@uos.de>
 */

#ifndef KATANA_CONSTANTS_H_
#define KATANA_CONSTANTS_H_

namespace katana
{
/// The number of motors in the katana (= all 5 "real" joints + the gripper)
const size_t NUM_MOTORS = 6;

/// The number of joints in the katana (= only the 5 "real" joints)
const size_t NUM_JOINTS = NUM_MOTORS - 1;

/// The number of gripper_joints in the katana (= the two gripper finger joints)
const size_t NUM_GRIPPER_JOINTS = 2;

/// The motor index of the gripper (used in all vectors -- e.g., motor_angles_)
const size_t GRIPPER_INDEX = NUM_MOTORS - 1;

/// Constants for gripper fully open or fully closed (should be equal to the value in the urdf description)
static const double GRIPPER_OPEN_ANGLE = 0.30;

/// Constants for gripper fully open or fully closed (should be equal to the value in the urdf description)
static const double GRIPPER_CLOSED_ANGLE = -0.44;

/// The maximum time it takes to open or close the gripper
static const double GRIPPER_OPENING_CLOSING_DURATION = 3.0;

/// constants for converting between the KNI gripper angle and the URDF gripper angle
static const double KNI_GRIPPER_CLOSED_ANGLE = 0.21652991032554647;
static const double KNI_GRIPPER_OPEN_ANGLE = -2.057443;

static const double KNI_TO_URDF_GRIPPER_FACTOR = (GRIPPER_OPEN_ANGLE - GRIPPER_CLOSED_ANGLE) / (KNI_GRIPPER_OPEN_ANGLE
    - KNI_GRIPPER_CLOSED_ANGLE);

/// KNI time is in 10 milliseconds (most of the time), ROS time is in seconds
static const double KNI_TO_ROS_TIME = 100.0;

/// the conversion factor from KNI coordinates (in mm) to ROS coordinates (in m)
static const double KNI_TO_ROS_LENGTH = 0.001;

/// velocity limit <= 180 [enc / 10 ms]
static const int KNI_MAX_VELOCITY = 180;

/// acceleration limit = 1 or 2 [enc / (10 ms)^2]
static const int KNI_MAX_ACCELERATION = 2;

static const size_t MOVE_BUFFER_SIZE = 16;  // TODO: find out exact value

} // namespace katana


#endif /* KATANA_CONSTANTS_H_ */
