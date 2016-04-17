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
 * SimulatedKatana.h
 *
 *  Created on: 20.12.2010
 *      Author: Martin Günther <mguenthe@uos.de>
 */

#ifndef SIMULATEDKATANA_H_
#define SIMULATEDKATANA_H_

#include "AbstractKatana.h"
#include "spline_functions.h"

namespace katana
{

class SimulatedKatana : public katana::AbstractKatana
{
public:
  SimulatedKatana();
  virtual ~SimulatedKatana();

  virtual void refreshEncoders();
  virtual bool executeTrajectory(boost::shared_ptr<SpecifiedTrajectory> traj,
                                 boost::function<bool()> isPreemptRequested);
  virtual void moveGripper(double openingAngle);
  virtual bool moveJoint(int jointIndex, double turningAngle);

  virtual bool someMotorCrashed();
  virtual bool allJointsReady();
  virtual bool allMotorsReady();

private:
  boost::shared_ptr<SpecifiedTrajectory> current_trajectory_;
};

}

#endif /* SIMULATEDKATANA_H_ */
