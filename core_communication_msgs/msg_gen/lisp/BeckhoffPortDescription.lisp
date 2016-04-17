; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude BeckhoffPortDescription.msg.html

(cl:defclass <BeckhoffPortDescription> (roslisp-msg-protocol:ros-message)
  ((index
    :reader index
    :initarg :index
    :type cl:fixnum
    :initform 0)
   (direction
    :reader direction
    :initarg :direction
    :type cl:string
    :initform "")
   (type
    :reader type
    :initarg :type
    :type cl:string
    :initform "")
   (data_type
    :reader data_type
    :initarg :data_type
    :type cl:string
    :initform ""))
)

(cl:defclass BeckhoffPortDescription (<BeckhoffPortDescription>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BeckhoffPortDescription>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BeckhoffPortDescription)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<BeckhoffPortDescription> is deprecated: use core_communication_msgs-msg:BeckhoffPortDescription instead.")))

(cl:ensure-generic-function 'index-val :lambda-list '(m))
(cl:defmethod index-val ((m <BeckhoffPortDescription>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:index-val is deprecated.  Use core_communication_msgs-msg:index instead.")
  (index m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <BeckhoffPortDescription>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:direction-val is deprecated.  Use core_communication_msgs-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <BeckhoffPortDescription>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:type-val is deprecated.  Use core_communication_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'data_type-val :lambda-list '(m))
(cl:defmethod data_type-val ((m <BeckhoffPortDescription>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:data_type-val is deprecated.  Use core_communication_msgs-msg:data_type instead.")
  (data_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BeckhoffPortDescription>) ostream)
  "Serializes a message object of type '<BeckhoffPortDescription>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'index)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'direction))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data_type))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BeckhoffPortDescription>) istream)
  "Deserializes a message object of type '<BeckhoffPortDescription>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'index)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BeckhoffPortDescription>)))
  "Returns string type for a message object of type '<BeckhoffPortDescription>"
  "core_communication_msgs/BeckhoffPortDescription")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BeckhoffPortDescription)))
  "Returns string type for a message object of type 'BeckhoffPortDescription"
  "core_communication_msgs/BeckhoffPortDescription")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BeckhoffPortDescription>)))
  "Returns md5sum for a message object of type '<BeckhoffPortDescription>"
  "1cc2270438c99dd3bb000cdad7cb2748")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BeckhoffPortDescription)))
  "Returns md5sum for a message object of type 'BeckhoffPortDescription"
  "1cc2270438c99dd3bb000cdad7cb2748")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BeckhoffPortDescription>)))
  "Returns full string definition for message of type '<BeckhoffPortDescription>"
  (cl:format cl:nil "uint8 index~%string direction # 'in','out'~%string type # 'digital';'analog'~%string data_type # 'uint8' 'uint16' 'uint32' 'uint64'~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BeckhoffPortDescription)))
  "Returns full string definition for message of type 'BeckhoffPortDescription"
  (cl:format cl:nil "uint8 index~%string direction # 'in','out'~%string type # 'digital';'analog'~%string data_type # 'uint8' 'uint16' 'uint32' 'uint64'~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BeckhoffPortDescription>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'direction))
     4 (cl:length (cl:slot-value msg 'type))
     4 (cl:length (cl:slot-value msg 'data_type))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BeckhoffPortDescription>))
  "Converts a ROS message object to a list"
  (cl:list 'BeckhoffPortDescription
    (cl:cons ':index (index msg))
    (cl:cons ':direction (direction msg))
    (cl:cons ':type (type msg))
    (cl:cons ':data_type (data_type msg))
))
