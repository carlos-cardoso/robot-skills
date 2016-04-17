; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude BeckhoffDigitalSignal.msg.html

(cl:defclass <BeckhoffDigitalSignal> (roslisp-msg-protocol:ros-message)
  ((terminal
    :reader terminal
    :initarg :terminal
    :type cl:string
    :initform "")
   (position
    :reader position
    :initarg :position
    :type cl:fixnum
    :initform 0)
   (port
    :reader port
    :initarg :port
    :type cl:fixnum
    :initform 0)
   (state
    :reader state
    :initarg :state
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BeckhoffDigitalSignal (<BeckhoffDigitalSignal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BeckhoffDigitalSignal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BeckhoffDigitalSignal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<BeckhoffDigitalSignal> is deprecated: use core_communication_msgs-msg:BeckhoffDigitalSignal instead.")))

(cl:ensure-generic-function 'terminal-val :lambda-list '(m))
(cl:defmethod terminal-val ((m <BeckhoffDigitalSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:terminal-val is deprecated.  Use core_communication_msgs-msg:terminal instead.")
  (terminal m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <BeckhoffDigitalSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:position-val is deprecated.  Use core_communication_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'port-val :lambda-list '(m))
(cl:defmethod port-val ((m <BeckhoffDigitalSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:port-val is deprecated.  Use core_communication_msgs-msg:port instead.")
  (port m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <BeckhoffDigitalSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:state-val is deprecated.  Use core_communication_msgs-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BeckhoffDigitalSignal>) ostream)
  "Serializes a message object of type '<BeckhoffDigitalSignal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'terminal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'terminal))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'port)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BeckhoffDigitalSignal>) istream)
  "Deserializes a message object of type '<BeckhoffDigitalSignal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'terminal) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'terminal) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'port)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'state) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BeckhoffDigitalSignal>)))
  "Returns string type for a message object of type '<BeckhoffDigitalSignal>"
  "core_communication_msgs/BeckhoffDigitalSignal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BeckhoffDigitalSignal)))
  "Returns string type for a message object of type 'BeckhoffDigitalSignal"
  "core_communication_msgs/BeckhoffDigitalSignal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BeckhoffDigitalSignal>)))
  "Returns md5sum for a message object of type '<BeckhoffDigitalSignal>"
  "86287f079e27c31f59c610d87337e525")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BeckhoffDigitalSignal)))
  "Returns md5sum for a message object of type 'BeckhoffDigitalSignal"
  "86287f079e27c31f59c610d87337e525")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BeckhoffDigitalSignal>)))
  "Returns full string definition for message of type '<BeckhoffDigitalSignal>"
  (cl:format cl:nil "# This message contains the state of a specific out or input on a Beckhoff terminal.~%string terminal # terminal type (e.g. EL1014)~%uint8 position # relative position of the terminal in the ethercat bus (0-n)~%uint8 port # specifies the port on the selected terminal (0-n)~%bool state # the state of the port~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BeckhoffDigitalSignal)))
  "Returns full string definition for message of type 'BeckhoffDigitalSignal"
  (cl:format cl:nil "# This message contains the state of a specific out or input on a Beckhoff terminal.~%string terminal # terminal type (e.g. EL1014)~%uint8 position # relative position of the terminal in the ethercat bus (0-n)~%uint8 port # specifies the port on the selected terminal (0-n)~%bool state # the state of the port~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BeckhoffDigitalSignal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'terminal))
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BeckhoffDigitalSignal>))
  "Converts a ROS message object to a list"
  (cl:list 'BeckhoffDigitalSignal
    (cl:cons ':terminal (terminal msg))
    (cl:cons ':position (position msg))
    (cl:cons ':port (port msg))
    (cl:cons ':state (state msg))
))
