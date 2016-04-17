; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude ControlError.msg.html

(cl:defclass <ControlError> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (description
    :reader description
    :initarg :description
    :type cl:string
    :initform "")
   (values
    :reader values
    :initarg :values
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ControlError (<ControlError>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlError>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlError)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<ControlError> is deprecated: use core_communication_msgs-msg:ControlError instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <ControlError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:name-val is deprecated.  Use core_communication_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'description-val :lambda-list '(m))
(cl:defmethod description-val ((m <ControlError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:description-val is deprecated.  Use core_communication_msgs-msg:description instead.")
  (description m))

(cl:ensure-generic-function 'values-val :lambda-list '(m))
(cl:defmethod values-val ((m <ControlError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:values-val is deprecated.  Use core_communication_msgs-msg:values instead.")
  (values m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlError>) ostream)
  "Serializes a message object of type '<ControlError>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'description))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'description))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'values))))
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
   (cl:slot-value msg 'values))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlError>) istream)
  "Deserializes a message object of type '<ControlError>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'description) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'description) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'values) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'values)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlError>)))
  "Returns string type for a message object of type '<ControlError>"
  "core_communication_msgs/ControlError")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlError)))
  "Returns string type for a message object of type 'ControlError"
  "core_communication_msgs/ControlError")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlError>)))
  "Returns md5sum for a message object of type '<ControlError>"
  "d5ba5881345546b546251ee2cbcf494f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlError)))
  "Returns md5sum for a message object of type 'ControlError"
  "d5ba5881345546b546251ee2cbcf494f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlError>)))
  "Returns full string definition for message of type '<ControlError>"
  (cl:format cl:nil "string name~%string description~%float64[] values~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlError)))
  "Returns full string definition for message of type 'ControlError"
  (cl:format cl:nil "string name~%string description~%float64[] values~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlError>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'description))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'values) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlError>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlError
    (cl:cons ':name (name msg))
    (cl:cons ':description (description msg))
    (cl:cons ':values (values msg))
))
