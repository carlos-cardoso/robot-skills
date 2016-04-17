#include <ros/ros.h>
#include <pr2_controllers_msgs/JointTrajectoryAction.h>
#include <actionlib/client/simple_action_client.h>

typedef actionlib::SimpleActionClient<pr2_controllers_msgs::JointTrajectoryAction> TrajClient;

static const double MIN_POSITIONS [5] = {-3.025528, -0.135228, -1.0, -2.033309, -2.993240};
static const double MAX_POSITIONS [5] = {2.891097, 2.168572, 2.054223, 1.876133, 2.870985};

static const size_t NUM_TRAJ_POINTS = 7;
static const size_t NUM_JOINTS = 5;

class RobotArm
{
private:

  // Action client for the joint trajectory action
  // used to trigger the arm movement action
  TrajClient* traj_client_;

public:
  //! Initialize the action client and wait for action server to come up
  RobotArm()
  {
    // tell the action client that we want to spin a thread by default
    traj_client_ = new TrajClient("katana_arm_controller/joint_trajectory_action", true);

    // wait for action server to come up
    while (!traj_client_->waitForServer(ros::Duration(5.0)) && ros::ok())
    {
      ROS_INFO("Waiting for the joint_trajectory_action server");
    }
  }

  //! Clean up the action client
  ~RobotArm()
  {
    delete traj_client_;
  }

  //! Sends the command to start a given trajectory
  void startTrajectory(pr2_controllers_msgs::JointTrajectoryGoal goal)
  {
    // When to start the trajectory: 1s from now
    goal.trajectory.header.stamp = ros::Time::now() + ros::Duration(1.0);
    traj_client_->sendGoal(goal);
  }

  pr2_controllers_msgs::JointTrajectoryGoal armExtensionTrajectory(size_t moving_joint)
  {
    //our goal variable
    pr2_controllers_msgs::JointTrajectoryGoal goal;

    // First, the joint names, which apply to all waypoints
    goal.trajectory.joint_names.push_back("katana_motor1_pan_joint");
    goal.trajectory.joint_names.push_back("katana_motor2_lift_joint");
    goal.trajectory.joint_names.push_back("katana_motor3_lift_joint");
    goal.trajectory.joint_names.push_back("katana_motor4_lift_joint");
    goal.trajectory.joint_names.push_back("katana_motor5_wrist_roll_joint");

    goal.trajectory.points.resize(NUM_TRAJ_POINTS);

    // First trajectory point (should be equal to current position of joints)
    size_t seg = 0;
    goal.trajectory.points[seg].positions.resize(NUM_JOINTS);
    goal.trajectory.points[seg].velocities.resize(NUM_JOINTS);
    for (size_t j = 0; j < NUM_JOINTS; ++j)
    {
      goal.trajectory.points[seg].positions[j] = 0.0;
      goal.trajectory.points[seg].velocities[j] = 0.0;
    }

    // Remaining trajectory points
    for (size_t seg = 1; seg < NUM_TRAJ_POINTS; seg++)
    {
      goal.trajectory.points[seg].positions.resize(NUM_JOINTS);
      goal.trajectory.points[seg].velocities.resize(NUM_JOINTS);
      for (size_t j = 0; j < NUM_JOINTS; ++j)
      {
        goal.trajectory.points[seg].positions[j] = goal.trajectory.points[seg - 1].positions[j];
        goal.trajectory.points[seg].velocities[j] = 0.0;
      }
    }

    // overwrite with the positions for the moving joint
    // move to min, hold it there, move to max, hold it there, move to 0, hold it there
    assert(NUM_TRAJ_POINTS == 7);
    goal.trajectory.points[0].positions[moving_joint] = 0.0;
    goal.trajectory.points[0].time_from_start = ros::Duration(0.0);

    goal.trajectory.points[1].positions[moving_joint] = MIN_POSITIONS[moving_joint];
    goal.trajectory.points[1].time_from_start = ros::Duration(2.5);

    goal.trajectory.points[2].positions[moving_joint] = MIN_POSITIONS[moving_joint];
    goal.trajectory.points[2].time_from_start = ros::Duration(5.5);

    goal.trajectory.points[3].positions[moving_joint] = MAX_POSITIONS[moving_joint];
    goal.trajectory.points[3].time_from_start = ros::Duration(10.5);

    goal.trajectory.points[4].positions[moving_joint] = MAX_POSITIONS[moving_joint];
    goal.trajectory.points[4].time_from_start = ros::Duration(13.5);

    goal.trajectory.points[5].positions[moving_joint] = 0.0;
    goal.trajectory.points[5].time_from_start = ros::Duration(16.0);

    goal.trajectory.points[6].positions[moving_joint] = 0.0;
    goal.trajectory.points[6].time_from_start = ros::Duration(19.0);

    //we are done; return the goal
    return goal;
  }

  //! Returns the current state of the action
  actionlib::SimpleClientGoalState getState()
  {
    return traj_client_->getState();
  }

};

int main(int argc, char** argv)
{
  // Init the ROS node
  ros::init(argc, argv, "robot_driver");

  RobotArm arm;
  while (ros::ok())
  {
    for (size_t joint = 0; joint < NUM_JOINTS; joint++)
    {
      // Start the trajectory
      arm.startTrajectory(arm.armExtensionTrajectory(joint));
      // Wait for trajectory completion
      while (!arm.getState().isDone() && ros::ok())
      {
        usleep(50000);
      }
    }
  }

}

