; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude SystemInitialization.msg.html

(cl:defclass <SystemInitialization> (roslisp-msg-protocol:ros-message)
  ((connect_disconnect_robot
    :reader connect_disconnect_robot
    :initarg :connect_disconnect_robot
    :type cl:boolean
    :initform cl:nil)
   (shutdown_system
    :reader shutdown_system
    :initarg :shutdown_system
    :type cl:boolean
    :initform cl:nil)
   (connect_over_ethercat
    :reader connect_over_ethercat
    :initarg :connect_over_ethercat
    :type cl:boolean
    :initform cl:nil)
   (value
    :reader value
    :initarg :value
    :type cl:boolean
    :initform cl:nil)
   (comment
    :reader comment
    :initarg :comment
    :type cl:string
    :initform ""))
)

(cl:defclass SystemInitialization (<SystemInitialization>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SystemInitialization>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SystemInitialization)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<SystemInitialization> is deprecated: use core_communication_msgs-msg:SystemInitialization instead.")))

(cl:ensure-generic-function 'connect_disconnect_robot-val :lambda-list '(m))
(cl:defmethod connect_disconnect_robot-val ((m <SystemInitialization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:connect_disconnect_robot-val is deprecated.  Use core_communication_msgs-msg:connect_disconnect_robot instead.")
  (connect_disconnect_robot m))

(cl:ensure-generic-function 'shutdown_system-val :lambda-list '(m))
(cl:defmethod shutdown_system-val ((m <SystemInitialization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:shutdown_system-val is deprecated.  Use core_communication_msgs-msg:shutdown_system instead.")
  (shutdown_system m))

(cl:ensure-generic-function 'connect_over_ethercat-val :lambda-list '(m))
(cl:defmethod connect_over_ethercat-val ((m <SystemInitialization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:connect_over_ethercat-val is deprecated.  Use core_communication_msgs-msg:connect_over_ethercat instead.")
  (connect_over_ethercat m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <SystemInitialization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:value-val is deprecated.  Use core_communication_msgs-msg:value instead.")
  (value m))

(cl:ensure-generic-function 'comment-val :lambda-list '(m))
(cl:defmethod comment-val ((m <SystemInitialization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:comment-val is deprecated.  Use core_communication_msgs-msg:comment instead.")
  (comment m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SystemInitialization>) ostream)
  "Serializes a message object of type '<SystemInitialization>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'connect_disconnect_robot) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'shutdown_system) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'connect_over_ethercat) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'value) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'comment))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'comment))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SystemInitialization>) istream)
  "Deserializes a message object of type '<SystemInitialization>"
    (cl:setf (cl:slot-value msg 'connect_disconnect_robot) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'shutdown_system) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'connect_over_ethercat) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'value) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'comment) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'comment) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SystemInitialization>)))
  "Returns string type for a message object of type '<SystemInitialization>"
  "core_communication_msgs/SystemInitialization")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SystemInitialization)))
  "Returns string type for a message object of type 'SystemInitialization"
  "core_communication_msgs/SystemInitialization")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SystemInitialization>)))
  "Returns md5sum for a message object of type '<SystemInitialization>"
  "a3c6a470858a3bb79e22a56d01662182")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SystemInitialization)))
  "Returns md5sum for a message object of type 'SystemInitialization"
  "a3c6a470858a3bb79e22a56d01662182")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SystemInitialization>)))
  "Returns full string definition for message of type '<SystemInitialization>"
  (cl:format cl:nil "bool connect_disconnect_robot~%bool shutdown_system~%bool connect_over_ethercat~%bool value~%string comment~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SystemInitialization)))
  "Returns full string definition for message of type 'SystemInitialization"
  (cl:format cl:nil "bool connect_disconnect_robot~%bool shutdown_system~%bool connect_over_ethercat~%bool value~%string comment~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SystemInitialization>))
  (cl:+ 0
     1
     1
     1
     1
     4 (cl:length (cl:slot-value msg 'comment))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SystemInitialization>))
  "Converts a ROS message object to a list"
  (cl:list 'SystemInitialization
    (cl:cons ':connect_disconnect_robot (connect_disconnect_robot msg))
    (cl:cons ':shutdown_system (shutdown_system msg))
    (cl:cons ':connect_over_ethercat (connect_over_ethercat msg))
    (cl:cons ':value (value msg))
    (cl:cons ':comment (comment msg))
))
