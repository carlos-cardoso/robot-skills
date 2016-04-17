#!/bin/sh
rosrun pr2_controller_manager pr2_controller_manager stop katana_arm_controller
rosrun pr2_controller_manager pr2_controller_manager unload katana_arm_controller
rosparam load $(rospack find katana_arm_gazebo)/config/katana_arm_controller.yaml
rosrun pr2_controller_manager pr2_controller_manager load katana_arm_controller
rosrun pr2_controller_manager pr2_controller_manager start katana_arm_controller
