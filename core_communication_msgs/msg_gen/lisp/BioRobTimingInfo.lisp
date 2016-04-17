; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude BioRobTimingInfo.msg.html

(cl:defclass <BioRobTimingInfo> (roslisp-msg-protocol:ros-message)
  ((timestamp_nsec
    :reader timestamp_nsec
    :initarg :timestamp_nsec
    :type cl:integer
    :initform 0)
   (timestamp_delta_nsec
    :reader timestamp_delta_nsec
    :initarg :timestamp_delta_nsec
    :type cl:integer
    :initform 0)
   (timestamp_second
    :reader timestamp_second
    :initarg :timestamp_second
    :type cl:float
    :initform 0.0)
   (timestamp_delta_second
    :reader timestamp_delta_second
    :initarg :timestamp_delta_second
    :type cl:float
    :initform 0.0))
)

(cl:defclass BioRobTimingInfo (<BioRobTimingInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BioRobTimingInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BioRobTimingInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<BioRobTimingInfo> is deprecated: use core_communication_msgs-msg:BioRobTimingInfo instead.")))

(cl:ensure-generic-function 'timestamp_nsec-val :lambda-list '(m))
(cl:defmethod timestamp_nsec-val ((m <BioRobTimingInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:timestamp_nsec-val is deprecated.  Use core_communication_msgs-msg:timestamp_nsec instead.")
  (timestamp_nsec m))

(cl:ensure-generic-function 'timestamp_delta_nsec-val :lambda-list '(m))
(cl:defmethod timestamp_delta_nsec-val ((m <BioRobTimingInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:timestamp_delta_nsec-val is deprecated.  Use core_communication_msgs-msg:timestamp_delta_nsec instead.")
  (timestamp_delta_nsec m))

(cl:ensure-generic-function 'timestamp_second-val :lambda-list '(m))
(cl:defmethod timestamp_second-val ((m <BioRobTimingInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:timestamp_second-val is deprecated.  Use core_communication_msgs-msg:timestamp_second instead.")
  (timestamp_second m))

(cl:ensure-generic-function 'timestamp_delta_second-val :lambda-list '(m))
(cl:defmethod timestamp_delta_second-val ((m <BioRobTimingInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:timestamp_delta_second-val is deprecated.  Use core_communication_msgs-msg:timestamp_delta_second instead.")
  (timestamp_delta_second m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BioRobTimingInfo>) ostream)
  "Serializes a message object of type '<BioRobTimingInfo>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'timestamp_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'timestamp_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'timestamp_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'timestamp_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_delta_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_delta_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_delta_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_delta_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'timestamp_delta_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'timestamp_delta_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'timestamp_delta_nsec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'timestamp_delta_nsec)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'timestamp_second))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'timestamp_delta_second))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BioRobTimingInfo>) istream)
  "Deserializes a message object of type '<BioRobTimingInfo>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'timestamp_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'timestamp_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'timestamp_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'timestamp_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_delta_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_delta_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_delta_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_delta_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'timestamp_delta_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'timestamp_delta_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'timestamp_delta_nsec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'timestamp_delta_nsec)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timestamp_second) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timestamp_delta_second) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BioRobTimingInfo>)))
  "Returns string type for a message object of type '<BioRobTimingInfo>"
  "core_communication_msgs/BioRobTimingInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BioRobTimingInfo)))
  "Returns string type for a message object of type 'BioRobTimingInfo"
  "core_communication_msgs/BioRobTimingInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BioRobTimingInfo>)))
  "Returns md5sum for a message object of type '<BioRobTimingInfo>"
  "084b989d61a3c81043143a886f388f82")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BioRobTimingInfo)))
  "Returns md5sum for a message object of type 'BioRobTimingInfo"
  "084b989d61a3c81043143a886f388f82")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BioRobTimingInfo>)))
  "Returns full string definition for message of type '<BioRobTimingInfo>"
  (cl:format cl:nil "uint64 timestamp_nsec~%uint64 timestamp_delta_nsec~%float64 timestamp_second~%float64 timestamp_delta_second~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BioRobTimingInfo)))
  "Returns full string definition for message of type 'BioRobTimingInfo"
  (cl:format cl:nil "uint64 timestamp_nsec~%uint64 timestamp_delta_nsec~%float64 timestamp_second~%float64 timestamp_delta_second~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BioRobTimingInfo>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BioRobTimingInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'BioRobTimingInfo
    (cl:cons ':timestamp_nsec (timestamp_nsec msg))
    (cl:cons ':timestamp_delta_nsec (timestamp_delta_nsec msg))
    (cl:cons ':timestamp_second (timestamp_second msg))
    (cl:cons ':timestamp_delta_second (timestamp_delta_second msg))
))
