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
 * Katana300.cpp
 *
 *  Created on: Dec 13, 2011
 *  Authors:
 *    Hannes Raudies <h.raudies@hs-mannheim.de>
 *    Martin Günther <mguenthe@uos.de>
 *    Benjamin Reiner <reinerbe@hs-weingarten.de>
 */

#include <katana/Katana300.h>

namespace katana
{

Katana300::Katana300() :
    Katana()
{
  desired_angles_ = getMotorAngles();
  setLimits();
}

Katana300::~Katana300()
{
}

void Katana300::setLimits()
{
  // TODO: constants

  // TODO: setting the limits this low shouldn't be necessary; the limits should
  //       be set to 2 (acc.) and 180 (vel.) and tested on real Katana 300
  //fast: acc. 2 and vel. 150 (tested on real Katana 300)
  //slow: acc. 1 and vel. 30


  kni->setMotorAccelerationLimit(0, 2);
  kni->setMotorVelocityLimit(0, 60);	// set to 90 to protect our old Katana

  for (size_t i = 1; i < NUM_MOTORS; i++)
  {
    // These two settings probably only influence KNI functions like moveRobotToEnc(),
    // openGripper() and so on, and not the spline trajectories. We still set them
    // just to be sure.
    kni->setMotorAccelerationLimit(i, 2);
    kni->setMotorVelocityLimit(i, 60);
  }

}

/**
 * The Katana 300 moves to a weird configuration whenever flushMoveBuffers() is called.
 * That's why we override freezeRobot() and skip this call.
 */
void Katana300::freezeRobot()
{
  boost::recursive_mutex::scoped_lock lock(kni_mutex);
  kni->freezeRobot();
}

/**
 * Override to store desired_angles_.
 */
bool Katana300::moveJoint(int jointIndex, double turningAngle)
{

  desired_angles_[jointIndex] = turningAngle;

  return Katana::moveJoint(jointIndex, turningAngle);
}

/**
 * We have to call refreshEncoders() because we're using the destination position
 * instead of the motor status flags in allJointsReady/allMotorsReady.
 */
void Katana300::refreshMotorStatus()
{
  Katana::refreshEncoders();
  Katana::refreshMotorStatus();
}

/**
 * The Katana 300 never returns MSF_DESPOS or MSF_NLINMOV, so we have to check
 * manually whether the arm stopped at the target position.
 */
bool Katana300::allJointsReady()
{
  std::vector<double> motor_angles = getMotorAngles();

  for (size_t i = 0; i < NUM_JOINTS; i++)
  {
    if (motor_status_[i] == MSF_MOTCRASHED)
      return false;
    if (fabs(desired_angles_[i] - motor_angles[i]) > JOINTS_STOPPED_POS_TOLERANCE)
      return false;
    if (fabs(motor_velocities_[i]) > JOINTS_STOPPED_VEL_TOLERANCE)
      return false;
  }

  return true;
}

/**
 * The Katana 300 never returns MSF_DESPOS or MSF_NLINMOV, so we have to check
 * manually whether the arm stopped at the target position.
 */
bool Katana300::allMotorsReady()
{
  std::vector<double> motor_angles = getMotorAngles();

  for (size_t i = 0; i < NUM_MOTORS; i++)
  {
    if (motor_status_[i] == MSF_MOTCRASHED)
      return false;

    if (fabs(motor_velocities_[i]) > JOINTS_STOPPED_VEL_TOLERANCE)
      return false;
  }

  return true;
}

void Katana300::testSpeed()
{
  ros::Rate idleWait(5);
  std::vector<double> pos1_angles(NUM_MOTORS);
  std::vector<double> pos2_angles(NUM_MOTORS);

  // these are safe values, i.e., no self-collision is possible
  // values on robot Kate
  pos1_angles[0] = 2.75;
  pos2_angles[0] = -1.5;

  pos1_angles[1] = 0.5;
  pos2_angles[1] = 2.1;

  pos1_angles[2] = 1.40;
  pos2_angles[2] = 0.3;

  pos1_angles[3] = 0.50;
  pos2_angles[3] = -2.00;

  pos1_angles[4] = 2.8;
  pos2_angles[4] = -2.75;

  pos1_angles[5] = -0.44;
  pos2_angles[5] = 0.30;

  for (size_t i = 0; i < NUM_MOTORS; i++)
  {
    int pos1_encoders = (int)converter->angle_rad2enc(i, pos1_angles[i]);
    int pos2_encoders = (int)converter->angle_rad2enc(i, pos2_angles[i]);

    int accel = kni->getMotorAccelerationLimit(i);
    int max_vel = kni->getMotorVelocityLimit(i);

    ROS_INFO("Motor %zu - acceleration: %d (= %f), max speed: %d (=%f)", i, accel, 2.0 * converter->acc_enc2rad(i, accel), max_vel, converter->vel_enc2rad(i, max_vel));
    ROS_INFO("KNI encoders: %d, %d", kni->GetBase()->GetMOT()->arr[i].GetEncoderMinPos(), kni->GetBase()->GetMOT()->arr[i].GetEncoderMaxPos());
    ROS_INFO("moving to encoders: %d, %d", pos1_encoders, pos2_encoders);
    ROS_INFO("current encoders: %d", kni->getMotorEncoders(i, true));

    ROS_INFO("Moving to min");
    {
      boost::recursive_mutex::scoped_lock lock(kni_mutex);
      kni->moveMotorToEnc(i, pos1_encoders, true, 50, 60000);
    }

//      do
//      {
//        idleWait.sleep();
//        refreshMotorStatus();
//
//      } while (!allMotorsReady());

    ROS_INFO("Moving to max");
    {
      boost::recursive_mutex::scoped_lock lock(kni_mutex);
      kni->moveMotorToEnc(i, pos2_encoders, true, 50, 60000);
    }

//      do
//      {
//        idleWait.sleep();
//        refreshMotorStatus();
//      } while (!allMotorsReady());
  }

  // Result:
  //  Motor 0 - acceleration: 2 (= -4.908739), max speed: 180 (=-2.208932)
  //  Motor 1 - acceleration: 2 (= -2.646220), max speed: 180 (=-1.190799)
  //  Motor 2 - acceleration: 2 (= 5.292440), max speed: 180 (=2.381598)
  //     --> wrong! the measured values are more like 2.6, 1.2
  //
  //  Motor 3 - acceleration: 2 (= -4.908739), max speed: 180 (=-2.208932)
  //  Motor 4 - acceleration: 2 (= -4.908739), max speed: 180 (=-2.208932)
  //  Motor 5 - acceleration: 2 (= 1.597410), max speed: 180 (=0.718834)
  //     (TODO: the gripper duration can be calculated from this)
}

/**
 * The Katana 300 is not able to perform a trajectory the same the newer Katana versions do.
 * Every point of the trajectory has to be send individually.
 *
 * @author Benjamin Reiner
 */
bool Katana300::executeTrajectory(boost::shared_ptr<SpecifiedTrajectory> traj,
                                  boost::function<bool()> isPreemptRequested)
{
  ROS_DEBUG("Entered executeTrajectory. Spline size: %d, trajectory size: %d, number of motors: %d",
            (int )traj->at(0).splines.size(), (int )traj->size(), kni->getNumberOfMotors());
  try
  {
    // ------- wait until all motors idle
    ros::Rate idleWait(10);
    while (!allMotorsReady())
    {
      refreshMotorStatus();
      ROS_DEBUG("Motor status: %d, %d, %d, %d, %d, %d", motor_status_[0], motor_status_[1], motor_status_[2],
                motor_status_[3], motor_status_[4], motor_status_[5]);

      // ------- check if motors are blocked
      // it is important to do this inside the allMotorsReady() loop, otherwise we
      // could get stuck in a deadlock if the motors crash while we wait for them to
      // become ready
      if (someMotorCrashed())
      {
        ROS_WARN("Motors are crashed before executing trajectory! Unblocking...");

        boost::recursive_mutex::scoped_lock lock(kni_mutex);
        kni->unBlock();
      }

      idleWait.sleep();
    }

    // ------- wait until start time
    ros::Time start_time = ros::Time(traj->at(0).start_time);
    double time_until_start = (start_time - ros::Time::now()).toSec();

    if (time_until_start < -0.01)
    {
      ROS_WARN("Trajectory started %f s too late! Scheduled: %f, started: %f", -time_until_start, start_time.toSec(),
               ros::Time::now().toSec());
    }
    else if (time_until_start > 0.0)
    {
      ROS_DEBUG("Sleeping %f seconds until scheduled start of trajectory", time_until_start);
      ros::Time::sleepUntil(start_time);
    }

    // ------- start trajectory
    boost::recursive_mutex::scoped_lock lock(kni_mutex);

    // fix start times: set the trajectory start time to now(); since traj is a shared pointer,
    // this fixes the current_trajectory_ in joint_trajectory_action_controller, which synchronizes
    // the "state" publishing to the actual start time (more or less)
    double delay = ros::Time::now().toSec() - traj->at(0).start_time;
    for (size_t i = 0; i < traj->size(); i++)
    {
      traj->at(i).start_time += delay;
    }

    // enable splines with gripper
    bool isPresent;
    int openEncoder, closeEncoder;
    kni->getGripperParameters(isPresent, openEncoder, closeEncoder);
    kni->setGripperParameters(false, openEncoder, closeEncoder);

    // iterate over all trajectory steps
    for (size_t step = 0; step < traj->size(); step++)
    {
      ROS_DEBUG("Executing step %d", (int )step);

      if (isPreemptRequested())
      {
        ROS_INFO("Preempt requested. Aborting the trajectory!");
        return true;
      }

      Segment seg = traj->at(step);

      // + 1 to be flexible enough to perform trajectories that include the gripper
      if (seg.splines.size() != joint_names_.size() && seg.splines.size() != (joint_names_.size() + 1))
      {
        ROS_ERROR("Wrong number of joints in specified trajectory (was: %zu, expected: %zu)!", seg.splines.size(),
                  joint_names_.size());
      }

      refreshMotorStatus();
      if (someMotorCrashed())
      {
        ROS_ERROR("A motor crashed! Aborting to not destroy anything.");
        return false;
      }

      if (!ros::ok())
      {
        ROS_INFO("Stop trajectory because ROS node is stopped.");
        return true;
      }

      // time in 10 ms units, seg.duration is in seconds
      short duration = static_cast<short>(seg.duration * 100);
      // copy joint values and calculate to encoder values
      for (size_t jointNo = 0; jointNo < seg.splines.size(); jointNo++)
      {
        short encoder = static_cast<short>(converter->angle_rad2enc(jointNo, seg.splines[jointNo].target_position));
        desired_angles_[jointNo] = seg.splines[jointNo].target_position;
        // the actual position
        short p1 = round(converter->angle_rad2enc(jointNo, seg.splines[jointNo].coef[0]));
        short p2 = round(64 * converter->vel_rad2enc(jointNo, seg.splines[jointNo].coef[1]));
        short p3 = round(1024 * converter->acc_rad2enc(jointNo, seg.splines[jointNo].coef[2]));
        short p4 = round(32768 * converter->jerk_rad2enc(jointNo, seg.splines[jointNo].coef[3]));

        kni->sendSplineToMotor(jointNo, encoder, duration, p1, p2, p3, p4);
      }

      lock.unlock();
      ros::spinOnce();
      ros::Time::sleepUntil(ros::Time(seg.start_time));

      while (seg.start_time > ros::Time::now().toSec())
      {
        if (isPreemptRequested())
        {
          ROS_INFO("Preempt requested. Aborting the trajectory!");
          lock.lock();
          kni->freezeRobot();
          return true;
        }
        ros::spinOnce();
        ros::Duration(0.001).sleep();
      }
      lock.lock();
      kni->startSplineMovement(false);
    }

    //kni->moveRobotToEnc(encoders, true);	// to ensure that the goal position is reached
    return true;
  }
  catch (const WrongCRCException &e)
  {
    ROS_ERROR(
        "WrongCRCException: Two threads tried to access the KNI at once. This means that the locking in the Katana node is broken. (exception in executeTrajectory(): %s)",
        e.message().c_str());
  }
  catch (const ReadNotCompleteException &e)
  {
    ROS_ERROR(
        "ReadNotCompleteException: Another program accessed the KNI. Please stop it and restart the Katana node. (exception in executeTrajectory(): %s)",
        e.message().c_str());
  }
  catch (const FirmwareException &e)
  {
    // TODO: find out what the real cause of this is when it happens again
    // the message returned by the Katana is:
    // FirmwareException : 'StopperThread: collision on axis: 1 (axis N)'
    ROS_ERROR(
        "FirmwareException: Motor collision? Perhaps we tried to send a trajectory that the arm couldn't follow. (exception in executeTrajectory(): %s)",
        e.message().c_str());
  }
  catch (const MotorTimeoutException &e)
  {
    ROS_ERROR("MotorTimeoutException (exception in executeTrajectory(): %s)", e.what());
  }
  catch (const Exception &e)
  {
    ROS_ERROR("Unhandled exception in executeTrajectory(): %s", e.message().c_str());
  }
  catch (...)
  {
    ROS_ERROR("Unhandled exception in executeTrajectory()");
  }

  return false;
}

}
