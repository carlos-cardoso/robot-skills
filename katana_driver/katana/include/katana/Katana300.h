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
 * Katana300.h
 *
 *  Created on: Dec 13, 2011
 *  Authors:
 *    Hannes Raudies <h.raudies@hs-mannheim.de>
 *    Martin Günther <mguenthe@uos.de>
 */

#ifndef KATANA300_H_
#define KATANA300_H_

#include <ros/ros.h>
#include <boost/thread/recursive_mutex.hpp>
#include <boost/thread.hpp>

#include <kniBase.h>

#include <katana/SpecifiedTrajectory.h>
#include <katana/AbstractKatana.h>
#include <katana/KNIConverter.h>
#include <katana/Katana.h>

namespace katana
{

class Katana300 : public Katana
{
public:
  Katana300();
  virtual ~Katana300();

  virtual void setLimits();

  virtual bool executeTrajectory(boost::shared_ptr<SpecifiedTrajectory> traj,
                                 boost::function<bool()> isPreemptRequested);

  virtual void freezeRobot();
  virtual bool moveJoint(int jointIndex, double turningAngle);

  virtual void refreshMotorStatus();
  virtual bool allJointsReady();
  virtual bool allMotorsReady();

  virtual void testSpeed();

  static const double JOINTS_STOPPED_POS_TOLERANCE = 0.01;
  static const double JOINTS_STOPPED_VEL_TOLERANCE = 0.01;

private:
  std::vector<double> desired_angles_;

};

}

#endif /* KATANA300_H_ */
