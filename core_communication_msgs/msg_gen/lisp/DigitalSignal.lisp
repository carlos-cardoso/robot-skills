; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude DigitalSignal.msg.html

(cl:defclass <DigitalSignal> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (state
    :reader state
    :initarg :state
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DigitalSignal (<DigitalSignal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DigitalSignal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DigitalSignal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<DigitalSignal> is deprecated: use core_communication_msgs-msg:DigitalSignal instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <DigitalSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:name-val is deprecated.  Use core_communication_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <DigitalSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:state-val is deprecated.  Use core_communication_msgs-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DigitalSignal>) ostream)
  "Serializes a message object of type '<DigitalSignal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DigitalSignal>) istream)
  "Deserializes a message object of type '<DigitalSignal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'state) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DigitalSignal>)))
  "Returns string type for a message object of type '<DigitalSignal>"
  "core_communication_msgs/DigitalSignal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DigitalSignal)))
  "Returns string type for a message object of type 'DigitalSignal"
  "core_communication_msgs/DigitalSignal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DigitalSignal>)))
  "Returns md5sum for a message object of type '<DigitalSignal>"
  "a02bbd4704518df654c6d45037dfc59f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DigitalSignal)))
  "Returns md5sum for a message object of type 'DigitalSignal"
  "a02bbd4704518df654c6d45037dfc59f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DigitalSignal>)))
  "Returns full string definition for message of type '<DigitalSignal>"
  (cl:format cl:nil "string name~%bool state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DigitalSignal)))
  "Returns full string definition for message of type 'DigitalSignal"
  (cl:format cl:nil "string name~%bool state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DigitalSignal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DigitalSignal>))
  "Converts a ROS message object to a list"
  (cl:list 'DigitalSignal
    (cl:cons ':name (name msg))
    (cl:cons ':state (state msg))
))
