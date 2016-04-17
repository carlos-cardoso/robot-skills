#!/bin/sh
rxplot \
  /katana_arm_controller/state/actual/positions[0] \
  /katana_arm_controller/state/actual/positions[1] \
  /katana_arm_controller/state/actual/positions[2] \
  /katana_arm_controller/state/actual/positions[3] \
  /katana_arm_controller/state/actual/positions[4] &

rxplot \
  /katana_arm_controller/state/desired/positions[0] \
  /katana_arm_controller/state/desired/positions[1] \
  /katana_arm_controller/state/desired/positions[2] \
  /katana_arm_controller/state/desired/positions[3] \
  /katana_arm_controller/state/desired/positions[4] &

rxplot \
  /katana_arm_controller/state/error/positions[0] \
  /katana_arm_controller/state/error/positions[1] \
  /katana_arm_controller/state/error/positions[2] \
  /katana_arm_controller/state/error/positions[3] \
  /katana_arm_controller/state/error/positions[4] &

