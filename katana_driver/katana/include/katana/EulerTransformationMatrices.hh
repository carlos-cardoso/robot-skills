//------------------------------------------------------------------------
//
//  Copyright (C) 2010 Manuel Wopfner
//
//        wopfner@hs-ulm.de
//
//        Christian Schlegel (schlegel@hs-ulm.de)
//        University of Applied Sciences
//        Prittwitzstr. 10
//        89075 Ulm (Germany)
//
//  This file contains functions which creates the corresponding
//  rotation matrixes for different euler angles
//
//  This library is free software; you can redistribute it and/or
//  modify it under the terms of the GNU Lesser General Public
//  License as published by the Free Software Foundation; either
//  version 2.1 of the License, or (at your option) any later version.
//
//  This library is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//  Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public
//  License along with this library; if not, write to the Free Software
//  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//--------------------------------------------------------------------------


#ifndef EULER_TANSFORMATION_MATRICES
#define EULER_TANSFORMATION_MATRICES

#include <armadillo>

class EulerTransformationMatrices {
public:

	/**
	 * This method creates an rotation matrix for the zxz euler angle.
	 * The matrix size should be set at least to 3x3, otherwise the matrix will be
	 * automatically set to 3x3.
	 */
	static void create_zxz_matrix(double phi, double theta, double psi, arma::mat& matrix) {
		double c_phi = cos(phi);
		double s_phi = sin(phi);
		double c_theta = cos(theta);
		double s_theta = sin(theta);
		double c_psi = cos(psi);
		double s_psi = sin(psi);

		// If matrix is to small resize it
		if (matrix.n_cols < 3 || matrix.n_rows < 3)
			matrix.set_size(3, 3);

		matrix(0, 0) = c_phi * c_psi - s_phi * c_theta * s_psi;
		matrix(0, 1) = -c_phi * s_psi - s_phi * c_theta * c_psi;
		matrix(0, 2) = s_phi * s_theta;

		matrix(1, 0) = s_phi * c_psi + c_phi * c_theta * s_psi;
		matrix(1, 1) = -s_phi * s_psi + c_phi * c_theta * c_psi;
		matrix(1, 2) = -c_phi * s_theta;

		matrix(2, 0) = s_theta * s_psi;
		matrix(2, 1) = s_theta * c_psi;
		matrix(2, 2) = c_theta;

	}

	/**
	 * This method creates an homogenous matrix for the zxz euler angle and a translation.
	 * The matrix size should be set at least to 4x4, otherwise the matrix will be
	 * automatically set to 4x4.
	 */
	static void create_zxz_matrix(double x, double y, double z, double phi, double theta, double psi, arma::mat& matrix) {
		double c_phi = cos(phi);
		double s_phi = sin(phi);
		double c_theta = cos(theta);
		double s_theta = sin(theta);
		double c_psi = cos(psi);
		double s_psi = sin(psi);

		// If matrix is to small resize it
		if (matrix.n_cols < 4 || matrix.n_rows < 4) {
			matrix.set_size(4, 4);
			matrix.zeros();
		}

		matrix(0, 0) = c_phi * c_psi - s_phi * c_theta * s_psi;
		matrix(0, 1) = -c_phi * s_psi - s_phi * c_theta * c_psi;
		matrix(0, 2) = s_phi * s_theta;
		matrix(0, 3) = x;

		matrix(1, 0) = s_phi * c_psi + c_phi * c_theta * s_psi;
		matrix(1, 1) = -s_phi * s_psi + c_phi * c_theta * c_psi;
		matrix(1, 2) = -c_phi * s_theta;
		matrix(1, 3) = y;

		matrix(2, 0) = s_theta * s_psi;
		matrix(2, 1) = s_theta * c_psi;
		matrix(2, 2) = c_theta;
		matrix(2, 3) = z;

		matrix(3, 3) = 1;

	}

	/**
	 * This method creates an rotation matrix for the zyx euler angle.
	 * The matrix size should be set at least to 3x3, otherwise the matrix will be
	 * automatically set to 3x3.
	 */
	static void create_zyx_matrix(double phi, double theta, double psi, arma::mat& matrix) {
		double c_phi = cos(phi);
		double s_phi = sin(phi);
		double c_theta = cos(theta);
		double s_theta = sin(theta);
		double c_psi = cos(psi);
		double s_psi = sin(psi);

		// If matrix is to small resize it
		if (matrix.n_cols < 3 || matrix.n_rows < 3)
			matrix.set_size(3, 3);

		matrix(0, 0) = c_theta * c_phi;
		matrix(0, 1) = -c_psi * s_phi + s_psi * s_theta * c_phi;
		matrix(0, 2) = s_psi * s_phi + c_psi * s_theta * c_phi;

		matrix(1, 0) = c_theta * s_phi;
		matrix(1, 1) = c_psi * c_phi + s_psi * s_theta * s_phi;
		matrix(1, 2) = -s_psi * c_phi + c_psi * s_theta * s_phi;

		matrix(2, 0) = -s_theta;
		matrix(2, 1) = s_psi * c_theta;
		matrix(2, 2) = c_psi * c_theta;
	}

	/**
	 * This method creates an homogenous matrix for the zyx euler angle and a translation.
	 * The matrix size should be set at least to 4x4, otherwise the matrix will be
	 * automatically set to 4x4.
	 */
	static void create_zyx_matrix(double x, double y, double z, double phi, double theta, double psi, arma::mat& matrix) {
		double c_phi = cos(phi);
		double s_phi = sin(phi);
		double c_theta = cos(theta);
		double s_theta = sin(theta);
		double c_psi = cos(psi);
		double s_psi = sin(psi);

		// If matrix is to small resize it
		if (matrix.n_cols < 4 || matrix.n_rows < 4) {
			matrix.set_size(4, 4);
			matrix.zeros();
		}
		matrix(0, 0) = c_theta * c_phi;
		matrix(0, 1) = -c_psi * s_phi + s_psi * s_theta * c_phi;
		matrix(0, 2) = s_psi * s_phi + c_psi * s_theta * c_phi;
		matrix(0, 3) = x;

		matrix(1, 0) = c_theta * s_phi;
		matrix(1, 1) = c_psi * c_phi + s_psi * s_theta * s_phi;
		matrix(1, 2) = -s_psi * c_phi + c_psi * s_theta * s_phi;
		matrix(1, 3) = y;

		matrix(2, 0) = -s_theta;
		matrix(2, 1) = s_psi * c_theta;
		matrix(2, 2) = c_psi * c_theta;
		matrix(2, 3) = z;

		matrix(3, 3) = 1;
	}

    static void zxz_to_zyx_angles(const double in_a, const double in_e, const double in_r, double& out_a, double& out_e, double& out_r) {
        // ZXZ rotation matrix
		arma::mat r(3, 3);
		EulerTransformationMatrices::create_zxz_matrix(in_a, in_e, in_r, r);

		// elevation is in the range [-pi/2, pi/2 ], so it is enough to calculate:
		out_e = atan2(-r(2, 0), hypot(r(0, 0), r(1, 0)));

		// roll:
		if (fabs(r(2, 1)) + fabs(r(2, 2)) < 10 * std::numeric_limits<double>::epsilon()) {
			out_r = 0.0;
			if (out_e > 0)
				out_a = -atan2(-r(1, 2), r(0, 2));
			else
				out_a = atan2(-r(1, 2), -r(0, 2));
		} else {
			out_r = atan2(r(2, 1), r(2, 2));
			out_a = atan2(r(1, 0), r(0, 0));
		}
    }

    static void zyx_to_zxz_angles(const double in_a, const double in_e, const double in_r, double& out_a, double& out_e, double& out_r) {
        // ZYX rotation matrix
		arma::mat r(3, 3);
		EulerTransformationMatrices::create_zyx_matrix(in_a, in_e, in_r, r);

		out_e = acos(r(2, 2));

		if (fabs(sin(out_e)) > 1E-8) {
			out_r = atan2(r(2, 0) / sin(out_e), r(2, 1) / sin(out_e));
			out_a = -atan2(r(0, 2) / sin(out_e), r(1, 2) / sin(out_e)) + M_PI;
		} else {
			out_a = 0;
			out_r = atan2(r(1, 0), r(1, 1)) + M_PI;
		}
    }

    static void zyx_from_matrix(const arma::mat& matrix, double& out_x, double& out_y, double& out_z, double& out_azimuth, double& out_elevation, double& out_roll) {
        double azimuth, elevation, roll;

		// elevation is in the range [-pi/2, pi/2 ], so it is enough to calculate:
		elevation = atan2(-matrix(2, 0), hypot(matrix(0, 0), matrix(1, 0)));

		// roll:
		if ((fabs(matrix(2, 1)) + fabs(matrix(2, 2))) < 10 * std::numeric_limits<double>::epsilon()) {
			roll = 0.0;
			if (elevation > 0)
				azimuth = -atan2(-matrix(1, 2), matrix(0, 2));
			else
				azimuth = atan2(-matrix(1, 2), -matrix(0, 2));
		} else {
			roll = atan2(matrix(2, 1), matrix(2, 2));
			azimuth = atan2(matrix(1, 0), matrix(0, 0));
		}

		out_x = matrix(0, 3);
		out_y = matrix(1, 3);
		out_z = matrix(2, 3);
		out_azimuth = azimuth;
		out_elevation = elevation;
		out_roll = roll;
    }
};

#endif
