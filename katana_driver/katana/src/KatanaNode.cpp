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
 * KatanaNode.cpp
 *
 *  Created on: 11.12.2010
 *      Author: Martin Günther <mguenthe@uos.de>
 */

#include <katana/KatanaNode.h>

namespace katana
{

KatanaNode::KatanaNode()
{
  bool simulation;
  std::string katana_type;
  ros::NodeHandle pn("~");
  ros::NodeHandle n;

  pn.param("simulation", simulation, false);

  if (simulation)
    katana.reset(new SimulatedKatana());
  else
  {
    bool has_katana_type = n.getParam("katana_type", katana_type);
    if (!has_katana_type)
    {
      ROS_ERROR("Parameter katana_type was not set!");
      exit(-1);
    }

    if (katana_type == "katana_300_6m180")
      katana.reset(new Katana300());
    else if (katana_type == "katana_400_6m180" || katana_type == "katana_450_6m90a"
        || katana_type == "katana_450_6m90b")
      katana.reset(new Katana());
    else
    {
      ROS_ERROR(
          "Parameter katana_type was set to invalid value: %s; please use one of the following: katana_300_6m180, katana_400_6m180, katana_450_6m90a, katana_450_6m90b", katana_type.c_str());
      exit(-1);
    }
  }
}

KatanaNode::~KatanaNode()
{
}

int KatanaNode::loop()
{
  ros::Rate loop_rate(25);

  JointStatePublisher jointStatePublisher(katana);
  JointMovementActionController jointMovementActionController(katana);
  JointTrajectoryActionController jointTrajectoryActionController(katana);
  KatanaGripperGraspController katanaGripperGraspController(katana);

  while (ros::ok())
  {
    katana->refreshEncoders();
    jointStatePublisher.update();
    jointTrajectoryActionController.update();

    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}

}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "katana");
  katana::KatanaNode katana_node;

  katana_node.loop();

  return 0;
}
