; Auto-generated. Do not edit!


(cl:in-package core_communication_srvs-srv)


;//! \htmlinclude IODevices-request.msg.html

(cl:defclass <IODevices-request> (roslisp-msg-protocol:ros-message)
  ((getInfos
    :reader getInfos
    :initarg :getInfos
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass IODevices-request (<IODevices-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IODevices-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IODevices-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<IODevices-request> is deprecated: use core_communication_srvs-srv:IODevices-request instead.")))

(cl:ensure-generic-function 'getInfos-val :lambda-list '(m))
(cl:defmethod getInfos-val ((m <IODevices-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:getInfos-val is deprecated.  Use core_communication_srvs-srv:getInfos instead.")
  (getInfos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IODevices-request>) ostream)
  "Serializes a message object of type '<IODevices-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'getInfos) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IODevices-request>) istream)
  "Deserializes a message object of type '<IODevices-request>"
    (cl:setf (cl:slot-value msg 'getInfos) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IODevices-request>)))
  "Returns string type for a service object of type '<IODevices-request>"
  "core_communication_srvs/IODevicesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IODevices-request)))
  "Returns string type for a service object of type 'IODevices-request"
  "core_communication_srvs/IODevicesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IODevices-request>)))
  "Returns md5sum for a message object of type '<IODevices-request>"
  "bc0d0bd77b3bfaa30313c0556944e01b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IODevices-request)))
  "Returns md5sum for a message object of type 'IODevices-request"
  "bc0d0bd77b3bfaa30313c0556944e01b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IODevices-request>)))
  "Returns full string definition for message of type '<IODevices-request>"
  (cl:format cl:nil "~%bool getInfos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IODevices-request)))
  "Returns full string definition for message of type 'IODevices-request"
  (cl:format cl:nil "~%bool getInfos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IODevices-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IODevices-request>))
  "Converts a ROS message object to a list"
  (cl:list 'IODevices-request
    (cl:cons ':getInfos (getInfos msg))
))
;//! \htmlinclude IODevices-response.msg.html

(cl:defclass <IODevices-response> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (name
    :reader name
    :initarg :name
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (value
    :reader value
    :initarg :value
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass IODevices-response (<IODevices-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IODevices-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IODevices-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<IODevices-response> is deprecated: use core_communication_srvs-srv:IODevices-response instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <IODevices-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:id-val is deprecated.  Use core_communication_srvs-srv:id instead.")
  (id m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <IODevices-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:name-val is deprecated.  Use core_communication_srvs-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <IODevices-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:value-val is deprecated.  Use core_communication_srvs-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IODevices-response>) ostream)
  "Serializes a message object of type '<IODevices-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'id))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'value))))
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
   (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IODevices-response>) istream)
  "Deserializes a message object of type '<IODevices-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'id) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'id)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'name) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'name)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'value) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'value)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IODevices-response>)))
  "Returns string type for a service object of type '<IODevices-response>"
  "core_communication_srvs/IODevicesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IODevices-response)))
  "Returns string type for a service object of type 'IODevices-response"
  "core_communication_srvs/IODevicesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IODevices-response>)))
  "Returns md5sum for a message object of type '<IODevices-response>"
  "bc0d0bd77b3bfaa30313c0556944e01b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IODevices-response)))
  "Returns md5sum for a message object of type 'IODevices-response"
  "bc0d0bd77b3bfaa30313c0556944e01b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IODevices-response>)))
  "Returns full string definition for message of type '<IODevices-response>"
  (cl:format cl:nil "~%int32[] id~%string[] name~%float64[] value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IODevices-response)))
  "Returns full string definition for message of type 'IODevices-response"
  (cl:format cl:nil "~%int32[] id~%string[] name~%float64[] value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IODevices-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'id) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'name) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'value) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IODevices-response>))
  "Converts a ROS message object to a list"
  (cl:list 'IODevices-response
    (cl:cons ':id (id msg))
    (cl:cons ':name (name msg))
    (cl:cons ':value (value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'IODevices)))
  'IODevices-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'IODevices)))
  'IODevices-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IODevices)))
  "Returns string type for a service object of type '<IODevices>"
  "core_communication_srvs/IODevices")