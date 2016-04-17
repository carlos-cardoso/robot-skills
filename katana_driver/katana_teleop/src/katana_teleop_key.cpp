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
 * katana_teleop_key.cpp
 *
 *  Created on: 21.04.2011
 *  Author: Henning Deeken <hdeeken@uos.de>
 *
 * based on a pr2 teleop by Kevin Watts
 */

#include <katana_teleop/katana_teleop_key.h>

namespace katana
{

KatanaTeleopKey::KatanaTeleopKey() :
  action_client("katana_arm_controller/joint_movement_action", true), gripper_("gripper_grasp_posture_controller", true)
{
  ROS_INFO("KatanaTeleopKey starting...");
  ros::NodeHandle n_;
  ros::NodeHandle n_private("~");

  n_.param("increment", increment, 0.017453293); // default increment = 1°
  n_.param("increment_step", increment_step, 0.017453293); // default step_increment = 1°
  n_.param("increment_step_scaling", increment_step_scaling, 1.0); // default scaling = 1

  js_sub_ = n_.subscribe("joint_states", 1000, &KatanaTeleopKey::jointStateCallback, this);

  got_joint_states_ = false;

  jointIndex = 0;

  action_client.waitForServer();
  gripper_.waitForServer();

  // Gets all of the joints
  XmlRpc::XmlRpcValue joint_names;

  // Gets all of the joints
  if (!n_.getParam("katana_joints", joint_names))
  {
    ROS_ERROR("No joints given. (namespace: %s)", n_.getNamespace().c_str());
  }
  joint_names_.resize(joint_names.size());

  if (joint_names.getType() != XmlRpc::XmlRpcValue::TypeArray)
  {
    ROS_ERROR("Malformed joint specification.  (namespace: %s)", n_.getNamespace().c_str());
  }

  for (size_t i = 0; (int)i < joint_names.size(); ++i)
  {
    XmlRpc::XmlRpcValue &name_value = joint_names[i];

    if (name_value.getType() != XmlRpc::XmlRpcValue::TypeString)
    {
      ROS_ERROR("Array of joint names should contain all strings.  (namespace: %s)",
          n_.getNamespace().c_str());
    }

    joint_names_[i] = (std::string)name_value;
  }

  // Gets all of the gripper joints
  XmlRpc::XmlRpcValue gripper_joint_names;

  // Gets all of the joints
  if (!n_.getParam("katana_gripper_joints", gripper_joint_names))
  {
    ROS_ERROR("No gripper joints given. (namespace: %s)", n_.getNamespace().c_str());
  }

  gripper_joint_names_.resize(gripper_joint_names.size());

  if (gripper_joint_names.getType() != XmlRpc::XmlRpcValue::TypeArray)
  {
    ROS_ERROR("Malformed gripper joint specification.  (namespace: %s)", n_.getNamespace().c_str());
  }
  for (size_t i = 0; (int)i < gripper_joint_names.size(); ++i)
  {
    XmlRpc::XmlRpcValue &name_value = gripper_joint_names[i];
    if (name_value.getType() != XmlRpc::XmlRpcValue::TypeString)
    {
      ROS_ERROR("Array of gripper joint names should contain all strings.  (namespace: %s)",
          n_.getNamespace().c_str());
    }

    gripper_joint_names_[i] = (std::string)name_value;
  }

  combined_joints_.resize(joint_names_.size() + gripper_joint_names_.size());

  for (unsigned int i = 0; i < joint_names_.size(); i++)
  {
    combined_joints_[i] = joint_names_[i];
  }

  for (unsigned int i = 0; i < gripper_joint_names_.size(); i++)
  {
    combined_joints_[joint_names_.size() + i] = gripper_joint_names_[i];
  }

  giveInfo();

}

void KatanaTeleopKey::giveInfo()
{
  ROS_INFO("---------------------------");
  ROS_INFO("Use 'WS' to increase/decrease the joint position about one increment");
  ROS_INFO("Current increment is set to: %f", increment);
  ROS_INFO("Use '+#' to alter the increment by a increment/decrement of: %f", increment_step);
  ROS_INFO("Use ',.' to alter the increment_step_size altering the scaling factor by -/+ 1.0");
  ROS_INFO("Current scaling is set to: %f" , increment_step_scaling);
  ROS_INFO("---------------------------");
  ROS_INFO("Use 'R' to return to the arm's initial pose");
  ROS_INFO("Use 'I' to display this manual and the current joint state");
  ROS_INFO("---------------------------");
  ROS_INFO("Use 'AD' to switch to the next/previous joint");
  ROS_INFO("Use '0-9' to select a joint by number");
  ROS_INFO("---------------------------");
  ROS_INFO("Use 'OC' to open/close gripper");

  for (unsigned int i = 0; i < joint_names_.size(); i++)
  {
    ROS_INFO("Use '%d' to switch to Joint: '%s'",i, joint_names_[i].c_str());
  }

  for (unsigned int i = 0; i < gripper_joint_names_.size(); i++)
  {
    ROS_INFO("Use '%zu' to switch to Gripper Joint: '%s'",i + joint_names_.size(), gripper_joint_names_[i].c_str());
  }

  if (!current_pose_.name.empty())
  {
    ROS_INFO("---------------------------");
    ROS_INFO("Current Joint Positions:");

    for (unsigned int i = 0; i < current_pose_.position.size(); i++)
    {
      ROS_INFO("Joint %d - %s: %f", i, current_pose_.name[i].c_str(), current_pose_.position[i]);
    }
  }
}

void KatanaTeleopKey::jointStateCallback(const sensor_msgs::JointState::ConstPtr& js)
{
  // ROS_INFO("KatanaTeleopKeyboard received a new JointState");

  current_pose_.name = js->name;
  current_pose_.position = js->position;

  if (!got_joint_states_)
  {
    // ROS_INFO("KatanaTeleopKeyboard received initial JointState");
    initial_pose_.name = js->name;
    initial_pose_.position = js->position;
    got_joint_states_ = true;
  }
}

bool KatanaTeleopKey::matchJointGoalRequest(double increment)
{
  bool found_match = false;

  for (unsigned int i = 0; i < current_pose_.name.size(); i++)
  {
    if (current_pose_.name[i] == combined_joints_[jointIndex])
    {
      //ROS_DEBUG("incoming inc: %f - curren_pose: %f - resulting pose: %f ",increment, current_pose_.position[i], current_pose_.position[i] + increment);
      movement_goal_.position.push_back(current_pose_.position[i] + increment);
      found_match = true;
      break;

    }
  }

  return found_match;
}

void KatanaTeleopKey::keyboardLoop()
{

  char c;
  bool dirty = true;
  bool shutdown = false;

  // get the console in raw mode
  tcgetattr(kfd, &cooked);
  memcpy(&raw, &cooked, sizeof(struct termios));
  raw.c_lflag &= ~(ICANON | ECHO);
  // Setting a new line, then end of file
  raw.c_cc[VEOL] = 1;
  raw.c_cc[VEOF] = 2;
  tcsetattr(kfd, TCSANOW, &raw);

  ros::Rate r(50.0); // 50 Hz

  while (ros::ok() && !shutdown)
  {
    r.sleep();
    ros::spinOnce();

    if (!got_joint_states_)
      continue;

    dirty = false;

    // get the next event from the keyboard
    if (read(kfd, &c, 1) < 0)
    {
      perror("read():");
      exit(-1);
    }

    size_t selected_joint_index;
    switch (c)
    {
      // Increasing/Decreasing JointPosition
      case KEYCODE_W:
        if (matchJointGoalRequest(increment))
        {
          movement_goal_.name.push_back(combined_joints_[jointIndex]);
          dirty = true;
        }
        else
        {
          ROS_WARN("movement with the desired joint: %s failed due to a mismatch with the current joint state", combined_joints_[jointIndex].c_str());
        }

        break;

      case KEYCODE_S:
        if (matchJointGoalRequest(-increment))
        {
          movement_goal_.name.push_back(combined_joints_[jointIndex]);
          dirty = true;
        }
        else
        {
          ROS_WARN("movement with the desired joint: %s failed due to a mismatch with the current joint state", combined_joints_[jointIndex].c_str());
        }

        break;

        // Switching active Joint
      case KEYCODE_D:
        // use this line if you want to use "the gripper" instead of the single gripper joints
        jointIndex = (jointIndex + 1) % (joint_names_.size() + 1);

        // use this line if you want to select specific gripper joints
        //jointIndex = (jointIndex + 1) % combined_joints_.size();
        break;

      case KEYCODE_A:
        // use this line if you want to use "the gripper" instead of the single gripper joints
        jointIndex = (jointIndex - 1) % (joint_names_.size() + 1);

        // use this line if you want to select specific gripper joints
        //jointIndex = (jointIndex - 1) % combined_joints_.size();

        break;

      case KEYCODE_R:
        ROS_INFO("Resetting arm to its initial pose..");

        movement_goal_.name = initial_pose_.name;
        movement_goal_.position = initial_pose_.position;
        dirty = true;
        break;

      case KEYCODE_Q:
        // in case of shutting down the teleop node the arm is moved back into it's initial pose
        // assuming that this is a proper resting pose for the arm

        ROS_INFO("Shutting down the Katana Teleoperation node...");
        shutdown = true;
        break;

      case KEYCODE_I:
        giveInfo();
        break;

      case KEYCODE_0:
      case KEYCODE_1:
      case KEYCODE_2:
      case KEYCODE_3:
      case KEYCODE_4:
      case KEYCODE_5:
      case KEYCODE_6:
      case KEYCODE_7:
      case KEYCODE_8:
      case KEYCODE_9:
        selected_joint_index = c - KEYCODE_0;

        if (combined_joints_.size() > jointIndex)
        {
          ROS_DEBUG("You choose to adress joint no. %zu: %s", selected_joint_index, combined_joints_[9].c_str());
          jointIndex = selected_joint_index;
        }
        else
        {
          ROS_WARN("Joint Index No. %zu can not be adressed!", jointIndex);
        }
        break;

      case KEYCODE_PLUS:
        increment += (increment_step * increment_step_scaling);
        ROS_DEBUG("Increment increased to: %f",increment);
        break;

      case KEYCODE_NUMBER:
        increment -= (increment_step * increment_step_scaling);
        if (increment < 0)
        {
          increment = 0.0;
        }
        ROS_DEBUG("Increment decreased to: %f",increment);
        break;

      case KEYCODE_POINT:
        increment_step_scaling += 1.0;
        ROS_DEBUG("Increment_Scaling increased to: %f",increment_step_scaling);
        break;

      case KEYCODE_COMMA:
        increment_step_scaling -= 1.0;
        ROS_DEBUG("Increment_Scaling decreased to: %f",increment_step_scaling);
        break;

      case KEYCODE_C:
        send_gripper_action(GRASP);
        break;

      case KEYCODE_O:
        send_gripper_action(RELEASE);
        break;

    } // end switch case

    if (dirty)
    {
      ROS_INFO("Sending new JointMovementActionGoal..");

      katana_msgs::JointMovementGoal goal;
      goal.jointGoal = movement_goal_;

      for (size_t i = 0; i < goal.jointGoal.name.size(); i++)
      {
        ROS_DEBUG("Joint: %s to %f rad", goal.jointGoal.name[i].c_str(), goal.jointGoal.position[i]);
      }

      action_client.sendGoal(goal);
      bool finished_within_time = action_client.waitForResult(ros::Duration(10.0));
      if (!finished_within_time)
      {
        action_client.cancelGoal();
        ROS_INFO("Timed out achieving goal!");
      }
      else
      {
        actionlib::SimpleClientGoalState state = action_client.getState();
        if (state == actionlib::SimpleClientGoalState::SUCCEEDED)
          ROS_INFO("Action finished: %s",state.toString().c_str());
        else
          ROS_INFO("Action failed: %s", state.toString().c_str());

      }

      movement_goal_.name.clear();
      movement_goal_.position.clear();

    } // end if dirty
  }
}

bool KatanaTeleopKey::send_gripper_action(int goal_type)
{
  GCG goal;

  switch (goal_type)
  {
    case GRASP:
      goal.command.position = -0.44; 
      // leave velocity and effort empty
      break;

    case RELEASE:
      goal.command.position = 0.3; 
      // leave velocity and effort empty
      break;

    default:
      ROS_ERROR("unknown goal code (%d)", goal_type);
      return false;

  }


  bool finished_within_time = false;
  gripper_.sendGoal(goal);
  finished_within_time = gripper_.waitForResult(ros::Duration(10.0));
  if (!finished_within_time)
  {
    gripper_.cancelGoal();
    ROS_WARN("Timed out achieving goal!");
    return false;
  }
  else
  {
    actionlib::SimpleClientGoalState state = gripper_.getState();
    bool success = (state == actionlib::SimpleClientGoalState::SUCCEEDED);
    if (success)
      ROS_INFO("Action finished: %s",state.toString().c_str());
    else
      ROS_WARN("Action failed: %s",state.toString().c_str());

    return success;
  }

}
}// end namespace "katana"

void quit(int sig)
{
  tcsetattr(kfd, TCSANOW, &cooked);
  exit(0);
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "katana_teleop_key");

  katana::KatanaTeleopKey ktk;

  signal(SIGINT, quit);

  ktk.keyboardLoop();

  return 0;
}

