; Auto-generated. Do not edit!


(cl:in-package core_communication_srvs-srv)


;//! \htmlinclude BasicRobotInfos-request.msg.html

(cl:defclass <BasicRobotInfos-request> (roslisp-msg-protocol:ros-message)
  ((getInfos
    :reader getInfos
    :initarg :getInfos
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BasicRobotInfos-request (<BasicRobotInfos-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BasicRobotInfos-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BasicRobotInfos-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<BasicRobotInfos-request> is deprecated: use core_communication_srvs-srv:BasicRobotInfos-request instead.")))

(cl:ensure-generic-function 'getInfos-val :lambda-list '(m))
(cl:defmethod getInfos-val ((m <BasicRobotInfos-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:getInfos-val is deprecated.  Use core_communication_srvs-srv:getInfos instead.")
  (getInfos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BasicRobotInfos-request>) ostream)
  "Serializes a message object of type '<BasicRobotInfos-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'getInfos) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BasicRobotInfos-request>) istream)
  "Deserializes a message object of type '<BasicRobotInfos-request>"
    (cl:setf (cl:slot-value msg 'getInfos) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BasicRobotInfos-request>)))
  "Returns string type for a service object of type '<BasicRobotInfos-request>"
  "core_communication_srvs/BasicRobotInfosRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicRobotInfos-request)))
  "Returns string type for a service object of type 'BasicRobotInfos-request"
  "core_communication_srvs/BasicRobotInfosRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BasicRobotInfos-request>)))
  "Returns md5sum for a message object of type '<BasicRobotInfos-request>"
  "a60e479376a3eea574c9047f2b72168d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BasicRobotInfos-request)))
  "Returns md5sum for a message object of type 'BasicRobotInfos-request"
  "a60e479376a3eea574c9047f2b72168d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BasicRobotInfos-request>)))
  "Returns full string definition for message of type '<BasicRobotInfos-request>"
  (cl:format cl:nil "~%bool getInfos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BasicRobotInfos-request)))
  "Returns full string definition for message of type 'BasicRobotInfos-request"
  (cl:format cl:nil "~%bool getInfos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BasicRobotInfos-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BasicRobotInfos-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BasicRobotInfos-request
    (cl:cons ':getInfos (getInfos msg))
))
;//! \htmlinclude BasicRobotInfos-response.msg.html

(cl:defclass <BasicRobotInfos-response> (roslisp-msg-protocol:ros-message)
  ((numberActuatedJoints
    :reader numberActuatedJoints
    :initarg :numberActuatedJoints
    :type cl:integer
    :initform 0)
   (robotName
    :reader robotName
    :initarg :robotName
    :type cl:string
    :initform "")
   (robotType
    :reader robotType
    :initarg :robotType
    :type cl:string
    :initform "")
   (connectedSlaves
    :reader connectedSlaves
    :initarg :connectedSlaves
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass BasicRobotInfos-response (<BasicRobotInfos-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BasicRobotInfos-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BasicRobotInfos-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<BasicRobotInfos-response> is deprecated: use core_communication_srvs-srv:BasicRobotInfos-response instead.")))

(cl:ensure-generic-function 'numberActuatedJoints-val :lambda-list '(m))
(cl:defmethod numberActuatedJoints-val ((m <BasicRobotInfos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:numberActuatedJoints-val is deprecated.  Use core_communication_srvs-srv:numberActuatedJoints instead.")
  (numberActuatedJoints m))

(cl:ensure-generic-function 'robotName-val :lambda-list '(m))
(cl:defmethod robotName-val ((m <BasicRobotInfos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:robotName-val is deprecated.  Use core_communication_srvs-srv:robotName instead.")
  (robotName m))

(cl:ensure-generic-function 'robotType-val :lambda-list '(m))
(cl:defmethod robotType-val ((m <BasicRobotInfos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:robotType-val is deprecated.  Use core_communication_srvs-srv:robotType instead.")
  (robotType m))

(cl:ensure-generic-function 'connectedSlaves-val :lambda-list '(m))
(cl:defmethod connectedSlaves-val ((m <BasicRobotInfos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:connectedSlaves-val is deprecated.  Use core_communication_srvs-srv:connectedSlaves instead.")
  (connectedSlaves m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BasicRobotInfos-response>) ostream)
  "Serializes a message object of type '<BasicRobotInfos-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'numberActuatedJoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'numberActuatedJoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'numberActuatedJoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'numberActuatedJoints)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robotName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robotName))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robotType))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robotType))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'connectedSlaves))))
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
   (cl:slot-value msg 'connectedSlaves))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BasicRobotInfos-response>) istream)
  "Deserializes a message object of type '<BasicRobotInfos-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'numberActuatedJoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'numberActuatedJoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'numberActuatedJoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'numberActuatedJoints)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robotName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotType) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robotType) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'connectedSlaves) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'connectedSlaves)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BasicRobotInfos-response>)))
  "Returns string type for a service object of type '<BasicRobotInfos-response>"
  "core_communication_srvs/BasicRobotInfosResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicRobotInfos-response)))
  "Returns string type for a service object of type 'BasicRobotInfos-response"
  "core_communication_srvs/BasicRobotInfosResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BasicRobotInfos-response>)))
  "Returns md5sum for a message object of type '<BasicRobotInfos-response>"
  "a60e479376a3eea574c9047f2b72168d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BasicRobotInfos-response)))
  "Returns md5sum for a message object of type 'BasicRobotInfos-response"
  "a60e479376a3eea574c9047f2b72168d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BasicRobotInfos-response>)))
  "Returns full string definition for message of type '<BasicRobotInfos-response>"
  (cl:format cl:nil "~%uint32 numberActuatedJoints~%string robotName~%string robotType~%string[] connectedSlaves~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BasicRobotInfos-response)))
  "Returns full string definition for message of type 'BasicRobotInfos-response"
  (cl:format cl:nil "~%uint32 numberActuatedJoints~%string robotName~%string robotType~%string[] connectedSlaves~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BasicRobotInfos-response>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'robotName))
     4 (cl:length (cl:slot-value msg 'robotType))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'connectedSlaves) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BasicRobotInfos-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BasicRobotInfos-response
    (cl:cons ':numberActuatedJoints (numberActuatedJoints msg))
    (cl:cons ':robotName (robotName msg))
    (cl:cons ':robotType (robotType msg))
    (cl:cons ':connectedSlaves (connectedSlaves msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BasicRobotInfos)))
  'BasicRobotInfos-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BasicRobotInfos)))
  'BasicRobotInfos-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicRobotInfos)))
  "Returns string type for a service object of type '<BasicRobotInfos>"
  "core_communication_srvs/BasicRobotInfos")