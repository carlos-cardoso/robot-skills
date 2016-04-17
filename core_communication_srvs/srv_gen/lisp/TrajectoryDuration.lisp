; Auto-generated. Do not edit!


(cl:in-package core_communication_srvs-srv)


;//! \htmlinclude TrajectoryDuration-request.msg.html

(cl:defclass <TrajectoryDuration-request> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type (cl:vector core_communication_msgs-msg:BioRobJointTrajectoryPoint)
   :initform (cl:make-array 0 :element-type 'core_communication_msgs-msg:BioRobJointTrajectoryPoint :initial-element (cl:make-instance 'core_communication_msgs-msg:BioRobJointTrajectoryPoint))))
)

(cl:defclass TrajectoryDuration-request (<TrajectoryDuration-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectoryDuration-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectoryDuration-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<TrajectoryDuration-request> is deprecated: use core_communication_srvs-srv:TrajectoryDuration-request instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <TrajectoryDuration-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:points-val is deprecated.  Use core_communication_srvs-srv:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectoryDuration-request>) ostream)
  "Serializes a message object of type '<TrajectoryDuration-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectoryDuration-request>) istream)
  "Deserializes a message object of type '<TrajectoryDuration-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectoryDuration-request>)))
  "Returns string type for a service object of type '<TrajectoryDuration-request>"
  "core_communication_srvs/TrajectoryDurationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryDuration-request)))
  "Returns string type for a service object of type 'TrajectoryDuration-request"
  "core_communication_srvs/TrajectoryDurationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectoryDuration-request>)))
  "Returns md5sum for a message object of type '<TrajectoryDuration-request>"
  "46af7238262708a25319e58c709f4839")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryDuration-request)))
  "Returns md5sum for a message object of type 'TrajectoryDuration-request"
  "46af7238262708a25319e58c709f4839")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryDuration-request>)))
  "Returns full string definition for message of type '<TrajectoryDuration-request>"
  (cl:format cl:nil "~%core_communication_msgs/BioRobJointTrajectoryPoint[] points~%~%================================================================================~%MSG: core_communication_msgs/BioRobJointTrajectoryPoint~%trajectory_msgs/JointTrajectoryPoint trajectoryPoint~%GripperAction gripperAction~%float64 reachingAccuracyCart~%float64 reachingAccuracyOrient~%float64 reachingAccuracyJoint~%float64 controlLoopRatio~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%float64[] positions~%float64[] velocities~%float64[] accelerations~%duration time_from_start~%================================================================================~%MSG: core_communication_msgs/GripperAction~%float64 absolutePosition~%bool absPosIsSet~%bool closeGripper~%float64 noMovementTimeout~%bool openGripper~%bool useCustomNoMovementTimeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryDuration-request)))
  "Returns full string definition for message of type 'TrajectoryDuration-request"
  (cl:format cl:nil "~%core_communication_msgs/BioRobJointTrajectoryPoint[] points~%~%================================================================================~%MSG: core_communication_msgs/BioRobJointTrajectoryPoint~%trajectory_msgs/JointTrajectoryPoint trajectoryPoint~%GripperAction gripperAction~%float64 reachingAccuracyCart~%float64 reachingAccuracyOrient~%float64 reachingAccuracyJoint~%float64 controlLoopRatio~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%float64[] positions~%float64[] velocities~%float64[] accelerations~%duration time_from_start~%================================================================================~%MSG: core_communication_msgs/GripperAction~%float64 absolutePosition~%bool absPosIsSet~%bool closeGripper~%float64 noMovementTimeout~%bool openGripper~%bool useCustomNoMovementTimeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryDuration-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryDuration-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryDuration-request
    (cl:cons ':points (points msg))
))
;//! \htmlinclude TrajectoryDuration-response.msg.html

(cl:defclass <TrajectoryDuration-response> (roslisp-msg-protocol:ros-message)
  ((duration
    :reader duration
    :initarg :duration
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass TrajectoryDuration-response (<TrajectoryDuration-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectoryDuration-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectoryDuration-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<TrajectoryDuration-response> is deprecated: use core_communication_srvs-srv:TrajectoryDuration-response instead.")))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <TrajectoryDuration-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:duration-val is deprecated.  Use core_communication_srvs-srv:duration instead.")
  (duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectoryDuration-response>) ostream)
  "Serializes a message object of type '<TrajectoryDuration-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'duration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'duration))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectoryDuration-response>) istream)
  "Deserializes a message object of type '<TrajectoryDuration-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'duration) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'duration)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectoryDuration-response>)))
  "Returns string type for a service object of type '<TrajectoryDuration-response>"
  "core_communication_srvs/TrajectoryDurationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryDuration-response)))
  "Returns string type for a service object of type 'TrajectoryDuration-response"
  "core_communication_srvs/TrajectoryDurationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectoryDuration-response>)))
  "Returns md5sum for a message object of type '<TrajectoryDuration-response>"
  "46af7238262708a25319e58c709f4839")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryDuration-response)))
  "Returns md5sum for a message object of type 'TrajectoryDuration-response"
  "46af7238262708a25319e58c709f4839")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryDuration-response>)))
  "Returns full string definition for message of type '<TrajectoryDuration-response>"
  (cl:format cl:nil "~%float64[] duration~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryDuration-response)))
  "Returns full string definition for message of type 'TrajectoryDuration-response"
  (cl:format cl:nil "~%float64[] duration~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryDuration-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'duration) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryDuration-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryDuration-response
    (cl:cons ':duration (duration msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TrajectoryDuration)))
  'TrajectoryDuration-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TrajectoryDuration)))
  'TrajectoryDuration-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryDuration)))
  "Returns string type for a service object of type '<TrajectoryDuration>"
  "core_communication_srvs/TrajectoryDuration")