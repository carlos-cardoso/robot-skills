; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude TrajectorySpeedControl.msg.html

(cl:defclass <TrajectorySpeedControl> (roslisp-msg-protocol:ros-message)
  ((scaleFactor
    :reader scaleFactor
    :initarg :scaleFactor
    :type cl:float
    :initform 0.0))
)

(cl:defclass TrajectorySpeedControl (<TrajectorySpeedControl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectorySpeedControl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectorySpeedControl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<TrajectorySpeedControl> is deprecated: use core_communication_msgs-msg:TrajectorySpeedControl instead.")))

(cl:ensure-generic-function 'scaleFactor-val :lambda-list '(m))
(cl:defmethod scaleFactor-val ((m <TrajectorySpeedControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:scaleFactor-val is deprecated.  Use core_communication_msgs-msg:scaleFactor instead.")
  (scaleFactor m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectorySpeedControl>) ostream)
  "Serializes a message object of type '<TrajectorySpeedControl>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'scaleFactor))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectorySpeedControl>) istream)
  "Deserializes a message object of type '<TrajectorySpeedControl>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'scaleFactor) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectorySpeedControl>)))
  "Returns string type for a message object of type '<TrajectorySpeedControl>"
  "core_communication_msgs/TrajectorySpeedControl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectorySpeedControl)))
  "Returns string type for a message object of type 'TrajectorySpeedControl"
  "core_communication_msgs/TrajectorySpeedControl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectorySpeedControl>)))
  "Returns md5sum for a message object of type '<TrajectorySpeedControl>"
  "8dd1b5d936925911458ab4b5dfaf2d5c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectorySpeedControl)))
  "Returns md5sum for a message object of type 'TrajectorySpeedControl"
  "8dd1b5d936925911458ab4b5dfaf2d5c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectorySpeedControl>)))
  "Returns full string definition for message of type '<TrajectorySpeedControl>"
  (cl:format cl:nil "float64 scaleFactor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectorySpeedControl)))
  "Returns full string definition for message of type 'TrajectorySpeedControl"
  (cl:format cl:nil "float64 scaleFactor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectorySpeedControl>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectorySpeedControl>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectorySpeedControl
    (cl:cons ':scaleFactor (scaleFactor msg))
))
