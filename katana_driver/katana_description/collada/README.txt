# HOW TO BUILD THE .DAE/.ZAE FILES AND GET OPENRAVE IK RUNNING
# 
# also see: http://answers.ros.org/question/858/how-to-run-ik_openravepy-with-my-urdf-file
#
# most important step: In order to do successful collada export, you need to use 
# the robot_model trunk, the robot_model in diamondback has an old exporter. 

svn co https://code.ros.org/svn/ros-pkg/stacks/robot_model/trunk robot_model

# Then rebuild the relevant projects.

rosmake robot_model katana_description openrave_planning

# now you have time for a coffee or two...
#
# next create the .urdf: 

rosrun xacro xacro.py $(rospack find katana_description)/urdf/$KATANA_TYPE.urdf.xacro > $KATANA_TYPE.urdf

# now the .dae can be generated:

rosrun collada_urdf urdf_to_collada $KATANA_TYPE.urdf $KATANA_TYPE.dae

# if you want, you can zip the .dae together with a manifest.xml file to get the .zae.
# the manifest.xml should look like this:
#
# <?xml version="1.0" encoding="utf-8"?>
# <dae_root>./$KATANA_TYPE.dae</dae_root>
#
# optionally, check the links:

export PYTHONPATH=$(rospack find openrave)/lib/python2.?/site-packages:$PYTHONPATH
rosrun openrave openrave0.4-robot.py $KATANA_TYPE.dae --list links

# optionally, visualize the model:

rosrun openrave openrave0.4 -f $KATANA_TYPE.dae

# and now start the IK service:

rosrun orrosplanning ik_openrave.py --scene="$(rospack find katana_description)/collada/$KATANA_TYPE.robot.xml" --viewer=''

# in a separate terminal, run:

rosrun katana_openrave_test testarmik5d.py

