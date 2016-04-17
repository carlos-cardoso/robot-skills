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
 * spline_functions.h
 *
 *  Created on: 20.12.2010
 *      Author: Martin Günther <mguenthe@uos.de>
 */

#ifndef SPLINE_FUNCTIONS_H_
#define SPLINE_FUNCTIONS_H_

#include <boost/numeric/ublas/lu.hpp>

namespace katana
{
// These functions are pulled from the spline_smoother package.
// They've been moved here to avoid depending on packages that aren't
// mature yet.
inline void generatePowers(int n, double x, double* powers);

/**
 * \brief Samples a cubic spline segment at a particular time
 */
void sampleCubicSpline(const std::vector<double>& coefficients, double time, double& position, double& velocity,
                       double& acceleration);

void getCubicSplineCoefficients(double start_pos, double start_vel, double end_pos, double end_vel, double time,
                                std::vector<double>& coefficients);

/**
 * copied from KNI: lmBase.cpp
 *
 * Calculates the spline coefficients for a single motor. Assumptions: velocity and acceleration at
 * start and end of trajectory = 0.
 *
 * @param steps         number of segments (input)
 * @param timearray     timearray[0]: start time of trajectory, timearray[i+1]: end time of segment i.
 *                      Only the differences are important for the result, so if timearray[0] is set
 *                      to 0.0, then timearray[i+1] = duration of segment i (input, size [steps + 1],
 *                      unit: seconds!)
 * @param encoderarray  encoderarray[0]: starting position of encoders, encoderarray[i+1]: target position
 *                      after segment i (input, size [steps + 1], unit: motor
 *                      encoders)
 * @param arr_p1        arr_p1[i]: segment i's spline coefficients for t^0 (= position)     (output, size [steps])
 * @param arr_p2        arr_p2[i]: segment i's spline coefficients for t^1 (= velocity)     (output, size [steps])
 * @param arr_p3        arr_p3[i]: segment i's spline coefficients for t^2 (= acceleration) (output, size [steps])
 * @param arr_p4        arr_p4[i]: segment i's spline coefficients for t^3 (= jerk)         (output, size [steps])
 */
void splineCoefficients(int steps, double *timearray, double *encoderarray, double *arr_p1, double *arr_p2,
                        double *arr_p3, double *arr_p4);

/**
 * Samples, but handling time bounds.  When the time is past the end
 * of the spline duration, the position is the last valid position,
 * and the derivatives are all 0.
 */
void sampleSplineWithTimeBounds(const std::vector<double>& coefficients, double duration, double time,
                                double& position, double& velocity, double& acceleration);

} // namespace katana

#endif /* SPLINE_FUNCTIONS_H_ */
