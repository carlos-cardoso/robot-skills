; Auto-generated. Do not edit!


(cl:in-package core_communication_srvs-srv)


;//! \htmlinclude Parameter-request.msg.html

(cl:defclass <Parameter-request> (roslisp-msg-protocol:ros-message)
  ((setParameter
    :reader setParameter
    :initarg :setParameter
    :type cl:boolean
    :initform cl:nil)
   (parameters
    :reader parameters
    :initarg :parameters
    :type (cl:vector core_communication_msgs-msg:Parameter)
   :initform (cl:make-array 0 :element-type 'core_communication_msgs-msg:Parameter :initial-element (cl:make-instance 'core_communication_msgs-msg:Parameter))))
)

(cl:defclass Parameter-request (<Parameter-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Parameter-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Parameter-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<Parameter-request> is deprecated: use core_communication_srvs-srv:Parameter-request instead.")))

(cl:ensure-generic-function 'setParameter-val :lambda-list '(m))
(cl:defmethod setParameter-val ((m <Parameter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:setParameter-val is deprecated.  Use core_communication_srvs-srv:setParameter instead.")
  (setParameter m))

(cl:ensure-generic-function 'parameters-val :lambda-list '(m))
(cl:defmethod parameters-val ((m <Parameter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:parameters-val is deprecated.  Use core_communication_srvs-srv:parameters instead.")
  (parameters m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Parameter-request>) ostream)
  "Serializes a message object of type '<Parameter-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'setParameter) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'parameters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'parameters))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Parameter-request>) istream)
  "Deserializes a message object of type '<Parameter-request>"
    (cl:setf (cl:slot-value msg 'setParameter) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'parameters) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'parameters)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'core_communication_msgs-msg:Parameter))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Parameter-request>)))
  "Returns string type for a service object of type '<Parameter-request>"
  "core_communication_srvs/ParameterRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Parameter-request)))
  "Returns string type for a service object of type 'Parameter-request"
  "core_communication_srvs/ParameterRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Parameter-request>)))
  "Returns md5sum for a message object of type '<Parameter-request>"
  "1b63760e10a11c083c8e6fc882a2639d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Parameter-request)))
  "Returns md5sum for a message object of type 'Parameter-request"
  "1b63760e10a11c083c8e6fc882a2639d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Parameter-request>)))
  "Returns full string definition for message of type '<Parameter-request>"
  (cl:format cl:nil "~%bool setParameter~%core_communication_msgs/Parameter[] parameters~%~%================================================================================~%MSG: core_communication_msgs/Parameter~%int32 parameterId~%int32 collectionId~%string parameterDescription~%string collectionDescription~%string parentClass~%bool editable~%string type~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Parameter-request)))
  "Returns full string definition for message of type 'Parameter-request"
  (cl:format cl:nil "~%bool setParameter~%core_communication_msgs/Parameter[] parameters~%~%================================================================================~%MSG: core_communication_msgs/Parameter~%int32 parameterId~%int32 collectionId~%string parameterDescription~%string collectionDescription~%string parentClass~%bool editable~%string type~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Parameter-request>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'parameters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Parameter-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Parameter-request
    (cl:cons ':setParameter (setParameter msg))
    (cl:cons ':parameters (parameters msg))
))
;//! \htmlinclude Parameter-response.msg.html

(cl:defclass <Parameter-response> (roslisp-msg-protocol:ros-message)
  ((parameters
    :reader parameters
    :initarg :parameters
    :type (cl:vector core_communication_msgs-msg:Parameter)
   :initform (cl:make-array 0 :element-type 'core_communication_msgs-msg:Parameter :initial-element (cl:make-instance 'core_communication_msgs-msg:Parameter))))
)

(cl:defclass Parameter-response (<Parameter-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Parameter-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Parameter-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<Parameter-response> is deprecated: use core_communication_srvs-srv:Parameter-response instead.")))

(cl:ensure-generic-function 'parameters-val :lambda-list '(m))
(cl:defmethod parameters-val ((m <Parameter-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:parameters-val is deprecated.  Use core_communication_srvs-srv:parameters instead.")
  (parameters m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Parameter-response>) ostream)
  "Serializes a message object of type '<Parameter-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'parameters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'parameters))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Parameter-response>) istream)
  "Deserializes a message object of type '<Parameter-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'parameters) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'parameters)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'core_communication_msgs-msg:Parameter))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Parameter-response>)))
  "Returns string type for a service object of type '<Parameter-response>"
  "core_communication_srvs/ParameterResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Parameter-response)))
  "Returns string type for a service object of type 'Parameter-response"
  "core_communication_srvs/ParameterResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Parameter-response>)))
  "Returns md5sum for a message object of type '<Parameter-response>"
  "1b63760e10a11c083c8e6fc882a2639d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Parameter-response)))
  "Returns md5sum for a message object of type 'Parameter-response"
  "1b63760e10a11c083c8e6fc882a2639d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Parameter-response>)))
  "Returns full string definition for message of type '<Parameter-response>"
  (cl:format cl:nil "~%core_communication_msgs/Parameter[] parameters~%~%~%================================================================================~%MSG: core_communication_msgs/Parameter~%int32 parameterId~%int32 collectionId~%string parameterDescription~%string collectionDescription~%string parentClass~%bool editable~%string type~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Parameter-response)))
  "Returns full string definition for message of type 'Parameter-response"
  (cl:format cl:nil "~%core_communication_msgs/Parameter[] parameters~%~%~%================================================================================~%MSG: core_communication_msgs/Parameter~%int32 parameterId~%int32 collectionId~%string parameterDescription~%string collectionDescription~%string parentClass~%bool editable~%string type~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Parameter-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'parameters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Parameter-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Parameter-response
    (cl:cons ':parameters (parameters msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Parameter)))
  'Parameter-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Parameter)))
  'Parameter-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Parameter)))
  "Returns string type for a service object of type '<Parameter>"
  "core_communication_srvs/Parameter")