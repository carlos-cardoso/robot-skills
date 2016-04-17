; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude GripperAction.msg.html

(cl:defclass <GripperAction> (roslisp-msg-protocol:ros-message)
  ((absolutePosition
    :reader absolutePosition
    :initarg :absolutePosition
    :type cl:float
    :initform 0.0)
   (absPosIsSet
    :reader absPosIsSet
    :initarg :absPosIsSet
    :type cl:boolean
    :initform cl:nil)
   (closeGripper
    :reader closeGripper
    :initarg :closeGripper
    :type cl:boolean
    :initform cl:nil)
   (noMovementTimeout
    :reader noMovementTimeout
    :initarg :noMovementTimeout
    :type cl:float
    :initform 0.0)
   (openGripper
    :reader openGripper
    :initarg :openGripper
    :type cl:boolean
    :initform cl:nil)
   (useCustomNoMovementTimeout
    :reader useCustomNoMovementTimeout
    :initarg :useCustomNoMovementTimeout
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GripperAction (<GripperAction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperAction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperAction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<GripperAction> is deprecated: use core_communication_msgs-msg:GripperAction instead.")))

(cl:ensure-generic-function 'absolutePosition-val :lambda-list '(m))
(cl:defmethod absolutePosition-val ((m <GripperAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:absolutePosition-val is deprecated.  Use core_communication_msgs-msg:absolutePosition instead.")
  (absolutePosition m))

(cl:ensure-generic-function 'absPosIsSet-val :lambda-list '(m))
(cl:defmethod absPosIsSet-val ((m <GripperAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:absPosIsSet-val is deprecated.  Use core_communication_msgs-msg:absPosIsSet instead.")
  (absPosIsSet m))

(cl:ensure-generic-function 'closeGripper-val :lambda-list '(m))
(cl:defmethod closeGripper-val ((m <GripperAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:closeGripper-val is deprecated.  Use core_communication_msgs-msg:closeGripper instead.")
  (closeGripper m))

(cl:ensure-generic-function 'noMovementTimeout-val :lambda-list '(m))
(cl:defmethod noMovementTimeout-val ((m <GripperAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:noMovementTimeout-val is deprecated.  Use core_communication_msgs-msg:noMovementTimeout instead.")
  (noMovementTimeout m))

(cl:ensure-generic-function 'openGripper-val :lambda-list '(m))
(cl:defmethod openGripper-val ((m <GripperAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:openGripper-val is deprecated.  Use core_communication_msgs-msg:openGripper instead.")
  (openGripper m))

(cl:ensure-generic-function 'useCustomNoMovementTimeout-val :lambda-list '(m))
(cl:defmethod useCustomNoMovementTimeout-val ((m <GripperAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:useCustomNoMovementTimeout-val is deprecated.  Use core_communication_msgs-msg:useCustomNoMovementTimeout instead.")
  (useCustomNoMovementTimeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperAction>) ostream)
  "Serializes a message object of type '<GripperAction>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'absolutePosition))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'absPosIsSet) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'closeGripper) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'noMovementTimeout))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'openGripper) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'useCustomNoMovementTimeout) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperAction>) istream)
  "Deserializes a message object of type '<GripperAction>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'absolutePosition) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'absPosIsSet) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'closeGripper) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'noMovementTimeout) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'openGripper) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'useCustomNoMovementTimeout) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperAction>)))
  "Returns string type for a message object of type '<GripperAction>"
  "core_communication_msgs/GripperAction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperAction)))
  "Returns string type for a message object of type 'GripperAction"
  "core_communication_msgs/GripperAction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperAction>)))
  "Returns md5sum for a message object of type '<GripperAction>"
  "67688fdf428828504144a527b96201ec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperAction)))
  "Returns md5sum for a message object of type 'GripperAction"
  "67688fdf428828504144a527b96201ec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperAction>)))
  "Returns full string definition for message of type '<GripperAction>"
  (cl:format cl:nil "float64 absolutePosition~%bool absPosIsSet~%bool closeGripper~%float64 noMovementTimeout~%bool openGripper~%bool useCustomNoMovementTimeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperAction)))
  "Returns full string definition for message of type 'GripperAction"
  (cl:format cl:nil "float64 absolutePosition~%bool absPosIsSet~%bool closeGripper~%float64 noMovementTimeout~%bool openGripper~%bool useCustomNoMovementTimeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperAction>))
  (cl:+ 0
     8
     1
     1
     8
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperAction>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperAction
    (cl:cons ':absolutePosition (absolutePosition msg))
    (cl:cons ':absPosIsSet (absPosIsSet msg))
    (cl:cons ':closeGripper (closeGripper msg))
    (cl:cons ':noMovementTimeout (noMovementTimeout msg))
    (cl:cons ':openGripper (openGripper msg))
    (cl:cons ':useCustomNoMovementTimeout (useCustomNoMovementTimeout msg))
))
