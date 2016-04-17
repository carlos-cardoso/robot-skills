; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude BioRobTrajectoryExecutionState.msg.html

(cl:defclass <BioRobTrajectoryExecutionState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (trajectoryExecutionState
    :reader trajectoryExecutionState
    :initarg :trajectoryExecutionState
    :type cl:integer
    :initform 0)
   (trajectoryExecutionStateString
    :reader trajectoryExecutionStateString
    :initarg :trajectoryExecutionStateString
    :type cl:string
    :initform "")
   (executed_trajectory_point_index
    :reader executed_trajectory_point_index
    :initarg :executed_trajectory_point_index
    :type cl:integer
    :initform 0)
   (trajectory_execution_time
    :reader trajectory_execution_time
    :initarg :trajectory_execution_time
    :type cl:float
    :initform 0.0)
   (is_trajectory_to_start_point
    :reader is_trajectory_to_start_point
    :initarg :is_trajectory_to_start_point
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BioRobTrajectoryExecutionState (<BioRobTrajectoryExecutionState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BioRobTrajectoryExecutionState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BioRobTrajectoryExecutionState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<BioRobTrajectoryExecutionState> is deprecated: use core_communication_msgs-msg:BioRobTrajectoryExecutionState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BioRobTrajectoryExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:header-val is deprecated.  Use core_communication_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'trajectoryExecutionState-val :lambda-list '(m))
(cl:defmethod trajectoryExecutionState-val ((m <BioRobTrajectoryExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:trajectoryExecutionState-val is deprecated.  Use core_communication_msgs-msg:trajectoryExecutionState instead.")
  (trajectoryExecutionState m))

(cl:ensure-generic-function 'trajectoryExecutionStateString-val :lambda-list '(m))
(cl:defmethod trajectoryExecutionStateString-val ((m <BioRobTrajectoryExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:trajectoryExecutionStateString-val is deprecated.  Use core_communication_msgs-msg:trajectoryExecutionStateString instead.")
  (trajectoryExecutionStateString m))

(cl:ensure-generic-function 'executed_trajectory_point_index-val :lambda-list '(m))
(cl:defmethod executed_trajectory_point_index-val ((m <BioRobTrajectoryExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:executed_trajectory_point_index-val is deprecated.  Use core_communication_msgs-msg:executed_trajectory_point_index instead.")
  (executed_trajectory_point_index m))

(cl:ensure-generic-function 'trajectory_execution_time-val :lambda-list '(m))
(cl:defmethod trajectory_execution_time-val ((m <BioRobTrajectoryExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:trajectory_execution_time-val is deprecated.  Use core_communication_msgs-msg:trajectory_execution_time instead.")
  (trajectory_execution_time m))

(cl:ensure-generic-function 'is_trajectory_to_start_point-val :lambda-list '(m))
(cl:defmethod is_trajectory_to_start_point-val ((m <BioRobTrajectoryExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:is_trajectory_to_start_point-val is deprecated.  Use core_communication_msgs-msg:is_trajectory_to_start_point instead.")
  (is_trajectory_to_start_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BioRobTrajectoryExecutionState>) ostream)
  "Serializes a message object of type '<BioRobTrajectoryExecutionState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectoryExecutionState)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'trajectoryExecutionState)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'trajectoryExecutionState)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'trajectoryExecutionState)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'trajectoryExecutionStateString))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'trajectoryExecutionStateString))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'executed_trajectory_point_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'executed_trajectory_point_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'executed_trajectory_point_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'executed_trajectory_point_index)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'trajectory_execution_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_trajectory_to_start_point) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BioRobTrajectoryExecutionState>) istream)
  "Deserializes a message object of type '<BioRobTrajectoryExecutionState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectoryExecutionState)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'trajectoryExecutionState)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'trajectoryExecutionState)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'trajectoryExecutionState)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'trajectoryExecutionStateString) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'trajectoryExecutionStateString) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'executed_trajectory_point_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'executed_trajectory_point_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'executed_trajectory_point_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'executed_trajectory_point_index)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'trajectory_execution_time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'is_trajectory_to_start_point) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BioRobTrajectoryExecutionState>)))
  "Returns string type for a message object of type '<BioRobTrajectoryExecutionState>"
  "core_communication_msgs/BioRobTrajectoryExecutionState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BioRobTrajectoryExecutionState)))
  "Returns string type for a message object of type 'BioRobTrajectoryExecutionState"
  "core_communication_msgs/BioRobTrajectoryExecutionState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BioRobTrajectoryExecutionState>)))
  "Returns md5sum for a message object of type '<BioRobTrajectoryExecutionState>"
  "63d24642823c1f3b74ad7b1e16a105fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BioRobTrajectoryExecutionState)))
  "Returns md5sum for a message object of type 'BioRobTrajectoryExecutionState"
  "63d24642823c1f3b74ad7b1e16a105fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BioRobTrajectoryExecutionState>)))
  "Returns full string definition for message of type '<BioRobTrajectoryExecutionState>"
  (cl:format cl:nil "Header header~%uint32 trajectoryExecutionState~%string trajectoryExecutionStateString~%uint32 executed_trajectory_point_index~%float64 trajectory_execution_time~%bool is_trajectory_to_start_point~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BioRobTrajectoryExecutionState)))
  "Returns full string definition for message of type 'BioRobTrajectoryExecutionState"
  (cl:format cl:nil "Header header~%uint32 trajectoryExecutionState~%string trajectoryExecutionStateString~%uint32 executed_trajectory_point_index~%float64 trajectory_execution_time~%bool is_trajectory_to_start_point~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BioRobTrajectoryExecutionState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4 (cl:length (cl:slot-value msg 'trajectoryExecutionStateString))
     4
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BioRobTrajectoryExecutionState>))
  "Converts a ROS message object to a list"
  (cl:list 'BioRobTrajectoryExecutionState
    (cl:cons ':header (header msg))
    (cl:cons ':trajectoryExecutionState (trajectoryExecutionState msg))
    (cl:cons ':trajectoryExecutionStateString (trajectoryExecutionStateString msg))
    (cl:cons ':executed_trajectory_point_index (executed_trajectory_point_index msg))
    (cl:cons ':trajectory_execution_time (trajectory_execution_time msg))
    (cl:cons ':is_trajectory_to_start_point (is_trajectory_to_start_point msg))
))
