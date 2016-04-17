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
 *  gazebo_ros_katana_gripper_action_interface.h
 *
 *  Created on: 07.11.2011
 *      Author: Karl Glatz <glatz@hs-weingarten.de>
 *              Ravensburg-Weingarten, University of Applied Sciences
 *
 *
 */

#ifndef IGAZEBOROSKATANAGRIPPERACTION_H_
#define IGAZEBOROSKATANAGRIPPERACTION_H_

#include<ros/time.h>

namespace katana_gazebo_plugins
{

struct GRKAPoint
{
  double position;
  double velocity;
};

class IGazeboRosKatanaGripperAction
{
public:
  virtual ~IGazeboRosKatanaGripperAction()
  {
  }
  virtual GRKAPoint getNextDesiredPoint(ros::Time time) = 0;
  virtual void setCurrentPoint(GRKAPoint point) = 0;
  virtual bool hasActiveGoal() const = 0;
  virtual void cancelGoal() = 0;

  virtual void getGains(double &p, double &i, double &d, double &i_max, double &i_min) = 0;
  virtual void setCurrentPoint(double pos, double vel);

};

}
#endif /* IGAZEBOROSKATANAGRIPPERACTION_H_ */
