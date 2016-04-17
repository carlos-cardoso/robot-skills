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
 * spline_functions.cpp
 *
 *  Created on: 28.01.2011
 *      Author: Martin Günther <mguenthe@uos.de>
 */

#include <katana/spline_functions.h>

namespace katana
{
inline void generatePowers(int n, double x, double* powers)
{
  powers[0] = 1.0;
  for (int i = 1; i <= n; i++)
  {
    powers[i] = powers[i - 1] * x;
  }
}

void sampleCubicSpline(const std::vector<double>& coefficients, double time, double& position, double& velocity,
                       double& acceleration)
{
  // create powers of time:
  double t[4];
  generatePowers(3, time, t);

  position = t[0] * coefficients[0] + t[1] * coefficients[1] + t[2] * coefficients[2] + t[3] * coefficients[3];
  velocity = t[0] * coefficients[1] + 2.0 * t[1] * coefficients[2] + 3.0 * t[2] * coefficients[3];
  acceleration = 2.0 * t[0] * coefficients[2] + 6.0 * t[1] * coefficients[3];
}

void getCubicSplineCoefficients(double start_pos, double start_vel, double end_pos, double end_vel, double time,
                                std::vector<double>& coefficients)
{
  coefficients.resize(4);

  if (time == 0.0)
  {
    coefficients[0] = end_pos;
    coefficients[1] = end_vel;
    coefficients[2] = 0.0;
    coefficients[3] = 0.0;
  }
  else
  {
    double T[4];
    generatePowers(3, time, T);

    coefficients[0] = start_pos;
    coefficients[1] = start_vel;
    coefficients[2] = (-3.0 * start_pos + 3.0 * end_pos - 2.0 * start_vel * T[1] - end_vel * T[1]) / T[2];
    coefficients[3] = (2.0 * start_pos - 2.0 * end_pos + start_vel * T[1] + end_vel * T[1]) / T[3];
  }
}

// copied from KNI
void splineCoefficients(int steps, double *timearray, double *encoderarray, double *arr_p1, double *arr_p2,
                        double *arr_p3, double *arr_p4)
{

  int i, j; // counter variables

  // calculate time differences between points and b-coefficients
  double deltatime[steps];
  double b[steps];
  for (i = 0; i < steps; i++)
  {
    deltatime[i] = timearray[i + 1] - timearray[i];
    b[i] = 1.0 / deltatime[i];
  }

  // calculate a-coefficients
  double a[steps - 1];
  for (i = 0; i < (steps - 1); i++)
  {
    a[i] = (2 / deltatime[i]) + (2 / deltatime[i + 1]);
  }

  // build up the right hand side of the linear system
  double c[steps];
  double d[steps + 1];
  d[0] = 0; // f_1' and f_n' equal zero
  d[steps] = 0;
  for (i = 0; i < steps; i++)
  {
    c[i] = (encoderarray[i + 1] - encoderarray[i]) / (deltatime[i] * deltatime[i]);
  }
  for (i = 0; i < (steps - 1); i++)
  {
    d[i + 1] = 3 * (c[i] + c[i + 1]);
  }

  // compose A * f' = d
  double Alin[steps - 1][steps]; // last column of Alin is right hand side

  // fill with zeros
  for (i = 0; i < (steps - 1); i++)
  {
    for (j = 0; j < steps; j++)
    {
      Alin[i][j] = 0.0;
    }
  }
  // insert values
  for (i = 0; i < (steps - 1); i++)
  {
    if (i == 0)
    {
      Alin[0][0] = a[0];
      Alin[0][1] = b[1];
      Alin[0][steps - 1] = d[1];
    }
    else
    {
      Alin[i][i - 1] = b[i];
      Alin[i][i] = a[i];
      Alin[i][i + 1] = b[i + 1];
      Alin[i][steps - 1] = d[i + 1];
    }
  }

  // solve linear equation
  boost::numeric::ublas::matrix<double> ublas_A(steps - 1, steps - 1);
  boost::numeric::ublas::matrix<double> ublas_b(steps - 1, 1);
  for (i = 0; i < (steps - 1); i++)
  {
    for (j = 0; j < (steps - 1); j++)
    {
      ublas_A(i, j) = Alin[i][j];
    }
    ublas_b(i, 0) = Alin[i][steps - 1];
  }
  boost::numeric::ublas::permutation_matrix<unsigned int> piv(steps - 1);
  lu_factorize(ublas_A, piv);
  lu_substitute(ublas_A, piv, ublas_b);

  // save result in derivatives array
  double derivatives[steps + 1];
  derivatives[0] = 0;
  for (i = 0; i < (steps - 1); i++)
  {
    derivatives[i + 1] = ublas_b(i, 0);
  }
  derivatives[steps] = 0;
  // build the hermite polynom with difference scheme
  // Q(t) = a0 + (b0 + (c0 + d0 * t) * (t - 1)) * t = a0 + (b0 - c0) * t +
  //   (c0 - d0) * t^2 + d0 * t^3 = p0 + p1 * t + p2 * t^2 + p3 * t^3
  double a0, b0, c0, d0;
  for (i = 0; i < steps; i++)
  {
    a0 = encoderarray[i];
    b0 = encoderarray[i + 1] - a0;
    c0 = b0 - deltatime[i] * derivatives[i];
    d0 = deltatime[i] * (derivatives[i + 1] + derivatives[i]) - 2 * b0;
    arr_p1[i] = a0;
    arr_p2[i] = b0 - c0;
    arr_p3[i] = c0 - d0;
    arr_p4[i] = d0;

    // added MG: normalize to segment duration (of course we could do some simplifications here)
    arr_p2[i] = arr_p2[i] / deltatime[i];
    arr_p3[i] = arr_p3[i] / pow(deltatime[i], 2);
    arr_p4[i] = arr_p4[i] / pow(deltatime[i], 3);
  }
}

void sampleSplineWithTimeBounds(const std::vector<double>& coefficients, double duration, double time,
                                double& position, double& velocity, double& acceleration)
{
  if (time < 0)
  {
    double _;
    sampleCubicSpline(coefficients, 0.0, position, _, _);
    velocity = 0;
    acceleration = 0;
  }
  else if (time > duration)
  {
    double _;
    sampleCubicSpline(coefficients, duration, position, _, _);
    velocity = 0;
    acceleration = 0;
  }
  else
  {
    sampleCubicSpline(coefficients, time, position, velocity, acceleration);
  }
}

} // namespace katana
