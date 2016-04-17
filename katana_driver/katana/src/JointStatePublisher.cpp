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
 * JointStatePublisher.cpp
 *
 *  Created on: 06.12.2010
 *      Author: Martin Günther <mguenthe@uos.de>
 */

#include "katana/JointStatePublisher.h"

namespace katana
{

JointStatePublisher::JointStatePublisher(boost::shared_ptr<AbstractKatana> katana) :
  katana(katana)
{
  ros::NodeHandle nh;
  pub = nh.advertise<sensor_msgs::JointState> ("joint_states", 1000);
}

JointStatePublisher::~JointStatePublisher()
{
}

void JointStatePublisher::update()
{
  /* ************** Publish joint angles ************** */
  sensor_msgs::JointStatePtr msg = boost::make_shared<sensor_msgs::JointState>();
  std::vector<std::string> joint_names = katana->getJointNames();
  std::vector<double> angles = katana->getMotorAngles();
  std::vector<double> vels = katana->getMotorVelocities();

  for (size_t i = 0; i < NUM_JOINTS; i++)
  {
    msg->name.push_back(joint_names[i]);
    msg->position.push_back(angles[i]);
    msg->velocity.push_back(vels[i]);
  }

  msg->name.push_back(katana->getGripperJointNames()[0]);
  msg->position.push_back(angles[5]);
  msg->velocity.push_back(vels[5]);

  msg->name.push_back(katana->getGripperJointNames()[1]);
  msg->position.push_back(angles[5]); // both right and left finger are controlled by motor 6
  msg->velocity.push_back(vels[5]);

  msg->header.stamp = ros::Time::now();
  pub.publish(msg); // NOTE: msg must not be changed after publishing; use reset() if necessary (http://www.ros.org/wiki/roscpp/Internals)
}

}
