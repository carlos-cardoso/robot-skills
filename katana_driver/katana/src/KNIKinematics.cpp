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
 * KNIKinematics.cpp
 *
 *  Created on: 20.01.2011
 *      Author: Martin Günther
 */

#include <katana/KNIKinematics.h>

namespace katana
{

KNIKinematics::KNIKinematics()
{
  joint_names_.resize(NUM_JOINTS);

  // ------- get parameters
  ros::NodeHandle pn("~");
  ros::NodeHandle n;

  std::string config_file_path;

  pn.param("config_file_path", config_file_path, ros::package::getPath("kni")
      + "/KNI_4.3.0/configfiles450/katana6M90A_G.cfg");

  converter_ = new KNIConverter(config_file_path);

  XmlRpc::XmlRpcValue joint_names;

  // ------- get joint names
  if (!n.getParam("katana_joints", joint_names))
  {
    ROS_ERROR("No joints given. (namespace: %s)", n.getNamespace().c_str());
  }
  if (joint_names.getType() != XmlRpc::XmlRpcValue::TypeArray)
  {
    ROS_ERROR("Malformed joint specification.  (namespace: %s)", n.getNamespace().c_str());
  }
  if (joint_names.size() != (size_t)NUM_JOINTS)
  {
    ROS_ERROR("Wrong number of joints! was: %d, expected: %zu", joint_names.size(), NUM_JOINTS);
  }
  for (size_t i = 0; i < NUM_JOINTS; ++i)
  {
    XmlRpc::XmlRpcValue &name_value = joint_names[i];
    if (name_value.getType() != XmlRpc::XmlRpcValue::TypeString)
    {
      ROS_ERROR("Array of joint names should contain all strings.  (namespace: %s)",
          n.getNamespace().c_str());
    }

    joint_names_[i] = (std::string)name_value;
  }


  // ------- get joint limits
  std::string robot_desc_string;
  if (!n.getParam("robot_description", robot_desc_string)) {
    ROS_FATAL("Couldn't get a robot_description from the param server");
    return;
  }

  urdf::Model model;
  model.initString(robot_desc_string);

  joint_limits_.resize(joint_names_.size());
  for (size_t i = 0; i < joint_names_.size(); i++)
  {
    joint_limits_[i].joint_name = joint_names_[i];
    joint_limits_[i].has_position_limits = true;
    joint_limits_[i].min_position = model.getJoint(joint_names_[i])->limits->lower;
    joint_limits_[i].max_position = model.getJoint(joint_names_[i])->limits->upper;
    joint_limits_[i].has_velocity_limits = false;
    joint_limits_[i].has_acceleration_limits = false;
  }


  // ------- set up the KNI stuff
  KNI::kmlFactory config;
  bool success = config.openFile(config_file_path.c_str());

  if (!success)
    ROS_ERROR("Could not open config file: %s", config_file_path.c_str());

  ikBase_.create(&config, NULL);

  // ------- register services
  get_kinematic_solver_info_server_ = nh_.advertiseService("get_kinematic_solver_info",
                                                           &KNIKinematics::get_kinematic_solver_info, this);

  get_fk_server_ = nh_.advertiseService("get_fk", &KNIKinematics::get_position_fk, this);

  get_ik_server_ = nh_.advertiseService("get_ik", &KNIKinematics::get_position_ik, this);
}

KNIKinematics::~KNIKinematics()
{
  delete converter_;
}

bool KNIKinematics::get_kinematic_solver_info(moveit_msgs::GetKinematicSolverInfo::Request &req,
                                              moveit_msgs::GetKinematicSolverInfo::Response &res)
{
  res.kinematic_solver_info.joint_names = joint_names_;
  res.kinematic_solver_info.limits = joint_limits_;

  return true;
}

bool KNIKinematics::get_position_fk(moveit_msgs::GetPositionFK::Request &req,
                                    moveit_msgs::GetPositionFK::Response &res)
{
  std::vector<double> jointAngles, coordinates;

  if (req.fk_link_names.size() != 1 || req.fk_link_names[0] != "katana_gripper_tool_frame")
  {
    ROS_ERROR("The KNI kinematics solver can only solve requests for katana_gripper_tool_frame!");
    return false;
  }

  // ignoring req.robot_state.multi_dof_joint_state

  std::vector<int> lookup = makeJointsLookup(req.robot_state.joint_state.name);
  if (lookup.size() == 0)
    return false;

  for (size_t i = 0; i < joint_names_.size(); i++)
  {
    jointAngles.push_back(req.robot_state.joint_state.position[lookup[i]]);
  }

  coordinates = getCoordinates(jointAngles);

  geometry_msgs::PoseStamped pose_in, pose_out;

  pose_in.header.frame_id = "katana_base_frame";
  pose_in.header.stamp = ros::Time(0);

  pose_in.pose.position.x = coordinates[0];
  pose_in.pose.position.y = coordinates[1];
  pose_in.pose.position.z = coordinates[2];

  pose_in.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(coordinates[3], coordinates[4], coordinates[5]);

  // The frame_id in the header message is the frame in which
  // the forward kinematics poses will be returned
  try
  {
    bool success = tf_listener_.waitForTransform(req.header.frame_id, pose_in.header.frame_id, pose_in.header.stamp,
                                                 ros::Duration(1.0));

    if (!success)
    {
      ROS_ERROR("Could not get transform");
      return false;
    }

    tf_listener_.transformPose(req.header.frame_id, pose_in, pose_out);
  }
  catch (const tf::TransformException &ex)
  {
    ROS_ERROR("%s", ex.what());
    return false;
  }

  res.pose_stamped.push_back(pose_out);
  res.fk_link_names = req.fk_link_names;
  res.error_code.val = res.error_code.SUCCESS;

  return true;
}

bool KNIKinematics::get_position_ik(moveit_msgs::GetPositionIK::Request &req,
                                    moveit_msgs::GetPositionIK::Response &res)
{
  std::vector<double> kni_coordinates(6, 0.0);
  std::vector<int> solution(NUM_JOINTS + 1);
  std::vector<int> seed_encoders(NUM_JOINTS + 1);

  if (req.ik_request.ik_link_name != "katana_gripper_tool_frame")
  {
    ROS_ERROR("The KNI kinematics solver can only solve requests for katana_gripper_tool_frame!");
    return false;
  }

  // ------- convert req.ik_request.ik_seed_state into seed_encoders
  std::vector<int> lookup = makeJointsLookup(req.ik_request.robot_state.joint_state.name);
  if (lookup.size() == 0)
    return false;

  for (size_t i = 0; i < joint_names_.size(); i++)
  {
    seed_encoders[i] = converter_->angle_rad2enc(i, req.ik_request.robot_state.joint_state.position[lookup[i]]);
  }

  // ------- convert req.ik_request.pose_stamped into kni_coordinates
  geometry_msgs::PoseStamped pose_out;
  try
  {
    bool success = tf_listener_.waitForTransform("katana_base_frame", req.ik_request.pose_stamped.header.frame_id, req.ik_request.pose_stamped.header.stamp,
                                                 ros::Duration(1.0));

    if (!success)
    {
      ROS_ERROR("Could not get transform");
      return false;
    }

    tf_listener_.transformPose("katana_base_frame", req.ik_request.pose_stamped, pose_out);
  }
  catch (const tf::TransformException &ex)
  {
    ROS_ERROR("%s", ex.what());
    return false;
  }

  kni_coordinates[0] = pose_out.pose.position.x / KNI_TO_ROS_LENGTH;
  kni_coordinates[1] = pose_out.pose.position.y / KNI_TO_ROS_LENGTH;
  kni_coordinates[2] = pose_out.pose.position.z / KNI_TO_ROS_LENGTH;

  tfScalar roll, pitch, yaw;
  tf::Quaternion bt_q;
  tf::quaternionMsgToTF(pose_out.pose.orientation, bt_q);
  tf::Matrix3x3(bt_q).getRPY(roll, pitch,yaw);

  EulerTransformationMatrices::zyx_to_zxz_angles(yaw, pitch, roll, kni_coordinates[3], kni_coordinates[4], kni_coordinates[5]);

  try
  {
    ikBase_.IKCalculate(kni_coordinates[0], kni_coordinates[1], kni_coordinates[2], kni_coordinates[3],
                        kni_coordinates[4], kni_coordinates[5], solution.begin(), seed_encoders);
  }
  catch (const KNI::NoSolutionException &e)
  {
    res.error_code.val = res.error_code.NO_IK_SOLUTION;
    return true; // this means that res is valid; the error code is stored inside
  }


  // ------- convert solution into radians
  res.solution.joint_state.name = joint_names_;
  res.solution.joint_state.position.resize(NUM_JOINTS);
  for (size_t i = 0; i < NUM_JOINTS; i++) {
    res.solution.joint_state.position[i] = converter_->angle_enc2rad(i, solution[i]);
  }

  res.error_code.val = res.error_code.SUCCESS;
  return true;
}

/// copied from joint_trajectory_action_controller
std::vector<int> KNIKinematics::makeJointsLookup(std::vector<std::string> &joint_names)
{
  std::vector<int> lookup(joint_names_.size(), -1); // Maps from an index in joint_names_ to an index in the msg
  for (size_t j = 0; j < joint_names_.size(); ++j)
  {
    for (size_t k = 0; k < joint_names.size(); ++k)
    {
      if (joint_names[k] == joint_names_[j])
      {
        lookup[j] = k;
        break;
      }
    }

    if (lookup[j] == -1)
    {
      ROS_ERROR("Unable to locate joint %s in the commanded trajectory.", joint_names_[j].c_str());
      return std::vector<int>(); // return empty vector to signal error
    }
  }

  return lookup;
}

/**
 * Return the position of the tool center point as calculated by the KNI.
 *
 * @param jointAngles the joint angles to compute the pose for (direct kinematics)
 * @return a vector <x, y, z, r, p, y>; xyz in [m], rpy in [rad]
 */
std::vector<double> KNIKinematics::getCoordinates(std::vector<double> jointAngles)
{
  std::vector<double> result(6, 0.0);
  std::vector<double> pose(6, 0.0);
  std::vector<int> encoders(NUM_JOINTS + 1, 0.0); // must be of size NUM_JOINTS + 1, otherwise KNI crashes
  for (size_t i = 0; i < jointAngles.size(); i++)
    encoders[i] = converter_->angle_rad2enc(i, jointAngles[i]);

  ikBase_.getCoordinatesFromEncoders(pose, encoders);

  // zyx = yaw, pitch, roll = result[5], result[4], result[3]
  EulerTransformationMatrices::zxz_to_zyx_angles(pose[3], pose[4], pose[5], result[5], result[4], result[3]);

  result[0] = pose[0] * KNI_TO_ROS_LENGTH;
  result[1] = pose[1] * KNI_TO_ROS_LENGTH;
  result[2] = pose[2] * KNI_TO_ROS_LENGTH;

  return result;
}

} // end namespace

int main(int argc, char** argv)
{
  ros::init(argc, argv, "katana_arm_kinematics");

  katana::KNIKinematics node;

  ros::spin();
  return 0;
}
