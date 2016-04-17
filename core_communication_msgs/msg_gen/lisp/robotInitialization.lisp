; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude robotInitialization.msg.html

(cl:defclass <robotInitialization> (roslisp-msg-protocol:ros-message)
  ((connectDisconnectRobot
    :reader connectDisconnectRobot
    :initarg :connectDisconnectRobot
    :type cl:boolean
    :initform cl:nil)
   (enableDisableRobot
    :reader enableDisableRobot
    :initarg :enableDisableRobot
    :type cl:boolean
    :initform cl:nil)
   (resetMotorEncoder
    :reader resetMotorEncoder
    :initarg :resetMotorEncoder
    :type cl:boolean
    :initform cl:nil)
   (value
    :reader value
    :initarg :value
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass robotInitialization (<robotInitialization>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robotInitialization>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robotInitialization)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<robotInitialization> is deprecated: use core_communication_msgs-msg:robotInitialization instead.")))

(cl:ensure-generic-function 'connectDisconnectRobot-val :lambda-list '(m))
(cl:defmethod connectDisconnectRobot-val ((m <robotInitialization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:connectDisconnectRobot-val is deprecated.  Use core_communication_msgs-msg:connectDisconnectRobot instead.")
  (connectDisconnectRobot m))

(cl:ensure-generic-function 'enableDisableRobot-val :lambda-list '(m))
(cl:defmethod enableDisableRobot-val ((m <robotInitialization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:enableDisableRobot-val is deprecated.  Use core_communication_msgs-msg:enableDisableRobot instead.")
  (enableDisableRobot m))

(cl:ensure-generic-function 'resetMotorEncoder-val :lambda-list '(m))
(cl:defmethod resetMotorEncoder-val ((m <robotInitialization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:resetMotorEncoder-val is deprecated.  Use core_communication_msgs-msg:resetMotorEncoder instead.")
  (resetMotorEncoder m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <robotInitialization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:value-val is deprecated.  Use core_communication_msgs-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robotInitialization>) ostream)
  "Serializes a message object of type '<robotInitialization>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'connectDisconnectRobot) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enableDisableRobot) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'resetMotorEncoder) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'value) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robotInitialization>) istream)
  "Deserializes a message object of type '<robotInitialization>"
    (cl:setf (cl:slot-value msg 'connectDisconnectRobot) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'enableDisableRobot) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'resetMotorEncoder) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'value) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robotInitialization>)))
  "Returns string type for a message object of type '<robotInitialization>"
  "core_communication_msgs/robotInitialization")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robotInitialization)))
  "Returns string type for a message object of type 'robotInitialization"
  "core_communication_msgs/robotInitialization")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robotInitialization>)))
  "Returns md5sum for a message object of type '<robotInitialization>"
  "4d3ae86cafc174b346dfc3efe19b7eb6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robotInitialization)))
  "Returns md5sum for a message object of type 'robotInitialization"
  "4d3ae86cafc174b346dfc3efe19b7eb6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robotInitialization>)))
  "Returns full string definition for message of type '<robotInitialization>"
  (cl:format cl:nil "bool connectDisconnectRobot~%bool enableDisableRobot~%bool resetMotorEncoder~%bool value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robotInitialization)))
  "Returns full string definition for message of type 'robotInitialization"
  (cl:format cl:nil "bool connectDisconnectRobot~%bool enableDisableRobot~%bool resetMotorEncoder~%bool value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robotInitialization>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robotInitialization>))
  "Converts a ROS message object to a list"
  (cl:list 'robotInitialization
    (cl:cons ':connectDisconnectRobot (connectDisconnectRobot msg))
    (cl:cons ':enableDisableRobot (enableDisableRobot msg))
    (cl:cons ':resetMotorEncoder (resetMotorEncoder msg))
    (cl:cons ':value (value msg))
))
