; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude ControlLoop.msg.html

(cl:defclass <ControlLoop> (roslisp-msg-protocol:ros-message)
  ((className
    :reader className
    :initarg :className
    :type cl:string
    :initform "")
   (baseClassName
    :reader baseClassName
    :initarg :baseClassName
    :type cl:string
    :initform "")
   (description
    :reader description
    :initarg :description
    :type cl:string
    :initform "")
   (referenceId
    :reader referenceId
    :initarg :referenceId
    :type cl:integer
    :initform 0))
)

(cl:defclass ControlLoop (<ControlLoop>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlLoop>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlLoop)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<ControlLoop> is deprecated: use core_communication_msgs-msg:ControlLoop instead.")))

(cl:ensure-generic-function 'className-val :lambda-list '(m))
(cl:defmethod className-val ((m <ControlLoop>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:className-val is deprecated.  Use core_communication_msgs-msg:className instead.")
  (className m))

(cl:ensure-generic-function 'baseClassName-val :lambda-list '(m))
(cl:defmethod baseClassName-val ((m <ControlLoop>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:baseClassName-val is deprecated.  Use core_communication_msgs-msg:baseClassName instead.")
  (baseClassName m))

(cl:ensure-generic-function 'description-val :lambda-list '(m))
(cl:defmethod description-val ((m <ControlLoop>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:description-val is deprecated.  Use core_communication_msgs-msg:description instead.")
  (description m))

(cl:ensure-generic-function 'referenceId-val :lambda-list '(m))
(cl:defmethod referenceId-val ((m <ControlLoop>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:referenceId-val is deprecated.  Use core_communication_msgs-msg:referenceId instead.")
  (referenceId m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlLoop>) ostream)
  "Serializes a message object of type '<ControlLoop>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'className))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'className))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'baseClassName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'baseClassName))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'description))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'description))
  (cl:let* ((signed (cl:slot-value msg 'referenceId)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlLoop>) istream)
  "Deserializes a message object of type '<ControlLoop>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'className) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'className) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'baseClassName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'baseClassName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'description) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'description) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'referenceId) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlLoop>)))
  "Returns string type for a message object of type '<ControlLoop>"
  "core_communication_msgs/ControlLoop")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlLoop)))
  "Returns string type for a message object of type 'ControlLoop"
  "core_communication_msgs/ControlLoop")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlLoop>)))
  "Returns md5sum for a message object of type '<ControlLoop>"
  "e338bc92ea3cf84439cefaa9f34d464e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlLoop)))
  "Returns md5sum for a message object of type 'ControlLoop"
  "e338bc92ea3cf84439cefaa9f34d464e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlLoop>)))
  "Returns full string definition for message of type '<ControlLoop>"
  (cl:format cl:nil "string className~%string baseClassName~%string description~%int64 referenceId~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlLoop)))
  "Returns full string definition for message of type 'ControlLoop"
  (cl:format cl:nil "string className~%string baseClassName~%string description~%int64 referenceId~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlLoop>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'className))
     4 (cl:length (cl:slot-value msg 'baseClassName))
     4 (cl:length (cl:slot-value msg 'description))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlLoop>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlLoop
    (cl:cons ':className (className msg))
    (cl:cons ':baseClassName (baseClassName msg))
    (cl:cons ':description (description msg))
    (cl:cons ':referenceId (referenceId msg))
))
