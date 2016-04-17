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
 * KNIKinematics.h
 *
 *  Created on: 20.01.2011
 *      Author: Martin Günther
 */

#ifndef KNIKINEMATICS_H_
#define KNIKINEMATICS_H_

#include <ros/ros.h>
#include <ros/package.h>
#include <tf/transform_listener.h>
#include <geometry_msgs/PoseStamped.h>
#include <moveit_msgs/GetKinematicSolverInfo.h>
#include <moveit_msgs/GetPositionFK.h>
#include <moveit_msgs/GetPositionIK.h>
#include <urdf/model.h>

#include <KNI_InvKin/ikBase.h>
#include <KNI/kmlFactories.h>
#include <KNI_InvKin/KatanaKinematics.h>

#include <katana/KNIConverter.h>
#include <katana/EulerTransformationMatrices.hh>

#include "tf/LinearMath/Transform.h"

namespace katana
{

class KNIKinematics
{
public:
  KNIKinematics();
  virtual ~KNIKinematics();

private:
  ros::NodeHandle nh_;
  ros::ServiceServer get_kinematic_solver_info_server_;
  ros::ServiceServer get_fk_server_;
  ros::ServiceServer get_ik_server_;

  std::vector<std::string> joint_names_;
  std::vector<moveit_msgs::JointLimits> joint_limits_;

  CikBase ikBase_;
  KNIConverter* converter_;
  tf::TransformListener tf_listener_;

  bool get_kinematic_solver_info(moveit_msgs::GetKinematicSolverInfo::Request &req,
                                 moveit_msgs::GetKinematicSolverInfo::Response &res);

  bool get_position_fk(moveit_msgs::GetPositionFK::Request &req, moveit_msgs::GetPositionFK::Response &res);
  bool get_position_ik(moveit_msgs::GetPositionIK::Request &req, moveit_msgs::GetPositionIK::Response &res);

  std::vector<double> getCoordinates();
  std::vector<double> getCoordinates(std::vector<double> jointAngles);
  std::vector<int> makeJointsLookup(std::vector<std::string> &joint_names);

};

}

#endif /* KNIKINEMATICS_H_ */
