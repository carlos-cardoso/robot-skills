; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude BioRobJointTrajectory.msg.html

(cl:defclass <BioRobJointTrajectory> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (joint_names
    :reader joint_names
    :initarg :joint_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (points
    :reader points
    :initarg :points
    :type (cl:vector core_communication_msgs-msg:BioRobJointTrajectoryPoint)
   :initform (cl:make-array 0 :element-type 'core_communication_msgs-msg:BioRobJointTrajectoryPoint :initial-element (cl:make-instance 'core_communication_msgs-msg:BioRobJointTrajectoryPoint))))
)

(cl:defclass BioRobJointTrajectory (<BioRobJointTrajectory>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BioRobJointTrajectory>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BioRobJointTrajectory)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<BioRobJointTrajectory> is deprecated: use core_communication_msgs-msg:BioRobJointTrajectory instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BioRobJointTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:header-val is deprecated.  Use core_communication_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'joint_names-val :lambda-list '(m))
(cl:defmethod joint_names-val ((m <BioRobJointTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:joint_names-val is deprecated.  Use core_communication_msgs-msg:joint_names instead.")
  (joint_names m))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <BioRobJointTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:points-val is deprecated.  Use core_communication_msgs-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BioRobJointTrajectory>) ostream)
  "Serializes a message object of type '<BioRobJointTrajectory>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'joint_names))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BioRobJointTrajectory>) istream)
  "Deserializes a message object of type '<BioRobJointTrajectory>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'core_communication_msgs-msg:BioRobJointTrajectoryPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BioRobJointTrajectory>)))
  "Returns string type for a message object of type '<BioRobJointTrajectory>"
  "core_communication_msgs/BioRobJointTrajectory")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BioRobJointTrajectory)))
  "Returns string type for a message object of type 'BioRobJointTrajectory"
  "core_communication_msgs/BioRobJointTrajectory")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BioRobJointTrajectory>)))
  "Returns md5sum for a message object of type '<BioRobJointTrajectory>"
  "8a25a3b29d56336bc432c7aafe44b914")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BioRobJointTrajectory)))
  "Returns md5sum for a message object of type 'BioRobJointTrajectory"
  "8a25a3b29d56336bc432c7aafe44b914")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BioRobJointTrajectory>)))
  "Returns full string definition for message of type '<BioRobJointTrajectory>"
  (cl:format cl:nil "Header header~%string[] joint_names~%core_communication_msgs/BioRobJointTrajectoryPoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: core_communication_msgs/BioRobJointTrajectoryPoint~%trajectory_msgs/JointTrajectoryPoint trajectoryPoint~%GripperAction gripperAction~%float64 reachingAccuracyCart~%float64 reachingAccuracyOrient~%float64 reachingAccuracyJoint~%float64 controlLoopRatio~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%float64[] positions~%float64[] velocities~%float64[] accelerations~%duration time_from_start~%================================================================================~%MSG: core_communication_msgs/GripperAction~%float64 absolutePosition~%bool absPosIsSet~%bool closeGripper~%float64 noMovementTimeout~%bool openGripper~%bool useCustomNoMovementTimeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BioRobJointTrajectory)))
  "Returns full string definition for message of type 'BioRobJointTrajectory"
  (cl:format cl:nil "Header header~%string[] joint_names~%core_communication_msgs/BioRobJointTrajectoryPoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: core_communication_msgs/BioRobJointTrajectoryPoint~%trajectory_msgs/JointTrajectoryPoint trajectoryPoint~%GripperAction gripperAction~%float64 reachingAccuracyCart~%float64 reachingAccuracyOrient~%float64 reachingAccuracyJoint~%float64 controlLoopRatio~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%float64[] positions~%float64[] velocities~%float64[] accelerations~%duration time_from_start~%================================================================================~%MSG: core_communication_msgs/GripperAction~%float64 absolutePosition~%bool absPosIsSet~%bool closeGripper~%float64 noMovementTimeout~%bool openGripper~%bool useCustomNoMovementTimeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BioRobJointTrajectory>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BioRobJointTrajectory>))
  "Converts a ROS message object to a list"
  (cl:list 'BioRobJointTrajectory
    (cl:cons ':header (header msg))
    (cl:cons ':joint_names (joint_names msg))
    (cl:cons ':points (points msg))
))
