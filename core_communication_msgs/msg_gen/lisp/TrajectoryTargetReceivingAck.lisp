; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude TrajectoryTargetReceivingAck.msg.html

(cl:defclass <TrajectoryTargetReceivingAck> (roslisp-msg-protocol:ros-message)
  ((received
    :reader received
    :initarg :received
    :type cl:boolean
    :initform cl:nil)
   (errorCode
    :reader errorCode
    :initarg :errorCode
    :type cl:integer
    :initform 0)
   (description
    :reader description
    :initarg :description
    :type cl:string
    :initform ""))
)

(cl:defclass TrajectoryTargetReceivingAck (<TrajectoryTargetReceivingAck>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectoryTargetReceivingAck>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectoryTargetReceivingAck)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<TrajectoryTargetReceivingAck> is deprecated: use core_communication_msgs-msg:TrajectoryTargetReceivingAck instead.")))

(cl:ensure-generic-function 'received-val :lambda-list '(m))
(cl:defmethod received-val ((m <TrajectoryTargetReceivingAck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:received-val is deprecated.  Use core_communication_msgs-msg:received instead.")
  (received m))

(cl:ensure-generic-function 'errorCode-val :lambda-list '(m))
(cl:defmethod errorCode-val ((m <TrajectoryTargetReceivingAck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:errorCode-val is deprecated.  Use core_communication_msgs-msg:errorCode instead.")
  (errorCode m))

(cl:ensure-generic-function 'description-val :lambda-list '(m))
(cl:defmethod description-val ((m <TrajectoryTargetReceivingAck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:description-val is deprecated.  Use core_communication_msgs-msg:description instead.")
  (description m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectoryTargetReceivingAck>) ostream)
  "Serializes a message object of type '<TrajectoryTargetReceivingAck>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'received) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'errorCode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'errorCode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'errorCode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'errorCode)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'description))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'description))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectoryTargetReceivingAck>) istream)
  "Deserializes a message object of type '<TrajectoryTargetReceivingAck>"
    (cl:setf (cl:slot-value msg 'received) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'errorCode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'errorCode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'errorCode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'errorCode)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'description) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'description) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectoryTargetReceivingAck>)))
  "Returns string type for a message object of type '<TrajectoryTargetReceivingAck>"
  "core_communication_msgs/TrajectoryTargetReceivingAck")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryTargetReceivingAck)))
  "Returns string type for a message object of type 'TrajectoryTargetReceivingAck"
  "core_communication_msgs/TrajectoryTargetReceivingAck")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectoryTargetReceivingAck>)))
  "Returns md5sum for a message object of type '<TrajectoryTargetReceivingAck>"
  "d2e809347de3b1ad80491fdae482c5f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryTargetReceivingAck)))
  "Returns md5sum for a message object of type 'TrajectoryTargetReceivingAck"
  "d2e809347de3b1ad80491fdae482c5f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryTargetReceivingAck>)))
  "Returns full string definition for message of type '<TrajectoryTargetReceivingAck>"
  (cl:format cl:nil "bool received~%uint32 errorCode~%string description~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryTargetReceivingAck)))
  "Returns full string definition for message of type 'TrajectoryTargetReceivingAck"
  (cl:format cl:nil "bool received~%uint32 errorCode~%string description~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryTargetReceivingAck>))
  (cl:+ 0
     1
     4
     4 (cl:length (cl:slot-value msg 'description))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryTargetReceivingAck>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryTargetReceivingAck
    (cl:cons ':received (received msg))
    (cl:cons ':errorCode (errorCode msg))
    (cl:cons ':description (description msg))
))
