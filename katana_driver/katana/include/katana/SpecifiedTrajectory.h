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
 * SpecifiedTrajectory.h
 *
 *  Created on: 12.12.2010
 *      Author: Martin Günther <mguenthe@uos.de>
 */

#ifndef SPECIFIEDTRAJECTORY_H_
#define SPECIFIEDTRAJECTORY_H_

namespace katana
{
// coef[0] + coef[1]*t + coef[2]*t^2 + coef[3]*t^3
struct Spline
{
  std::vector<double> coef;
  double target_position;

  Spline() :
    coef(4, 0.0), target_position(0.0)
  {
  }
};

struct Segment
{
  double start_time;
  double duration;
  std::vector<Spline> splines;
};
typedef std::vector<Segment> SpecifiedTrajectory;

}

#endif /* SPECIFIEDTRAJECTORY_H_ */
