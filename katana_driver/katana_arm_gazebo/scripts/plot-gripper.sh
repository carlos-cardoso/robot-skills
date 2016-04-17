#!/bin/sh
rxplot \
  /katana/gripper_controller_state/desired[0] \
  /katana/gripper_controller_state/actual[0] \
  /katana/gripper_controller_state/error[0] \
  /katana/gripper_controller_state/desired[1] \
  /katana/gripper_controller_state/actual[1] \
  /katana/gripper_controller_state/error[1]
