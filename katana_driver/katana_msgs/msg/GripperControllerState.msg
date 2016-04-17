# The actual and desired angles (in radian) of the gripper joints, 
# and the error between actual and desired.
#
# Each joint is uniquely identified by its name.
#
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
#
# All arrays in this message should have the same size.
# This is the only way to uniquely associate the joint name with the correct
# states.
Header header

string[] name
float64[] actual
float64[] desired
float64[] error
