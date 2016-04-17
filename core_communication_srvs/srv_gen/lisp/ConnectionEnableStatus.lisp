; Auto-generated. Do not edit!


(cl:in-package core_communication_srvs-srv)


;//! \htmlinclude ConnectionEnableStatus-request.msg.html

(cl:defclass <ConnectionEnableStatus-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ConnectionEnableStatus-request (<ConnectionEnableStatus-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConnectionEnableStatus-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConnectionEnableStatus-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<ConnectionEnableStatus-request> is deprecated: use core_communication_srvs-srv:ConnectionEnableStatus-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConnectionEnableStatus-request>) ostream)
  "Serializes a message object of type '<ConnectionEnableStatus-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConnectionEnableStatus-request>) istream)
  "Deserializes a message object of type '<ConnectionEnableStatus-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConnectionEnableStatus-request>)))
  "Returns string type for a service object of type '<ConnectionEnableStatus-request>"
  "core_communication_srvs/ConnectionEnableStatusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConnectionEnableStatus-request)))
  "Returns string type for a service object of type 'ConnectionEnableStatus-request"
  "core_communication_srvs/ConnectionEnableStatusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConnectionEnableStatus-request>)))
  "Returns md5sum for a message object of type '<ConnectionEnableStatus-request>"
  "6dd3f44c2a7a09b518da55fa09ff3c5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConnectionEnableStatus-request)))
  "Returns md5sum for a message object of type 'ConnectionEnableStatus-request"
  "6dd3f44c2a7a09b518da55fa09ff3c5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConnectionEnableStatus-request>)))
  "Returns full string definition for message of type '<ConnectionEnableStatus-request>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConnectionEnableStatus-request)))
  "Returns full string definition for message of type 'ConnectionEnableStatus-request"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConnectionEnableStatus-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConnectionEnableStatus-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ConnectionEnableStatus-request
))
;//! \htmlinclude ConnectionEnableStatus-response.msg.html

(cl:defclass <ConnectionEnableStatus-response> (roslisp-msg-protocol:ros-message)
  ((isConnectionEstablished
    :reader isConnectionEstablished
    :initarg :isConnectionEstablished
    :type cl:boolean
    :initform cl:nil)
   (isRobotEnabled
    :reader isRobotEnabled
    :initarg :isRobotEnabled
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ConnectionEnableStatus-response (<ConnectionEnableStatus-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConnectionEnableStatus-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConnectionEnableStatus-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<ConnectionEnableStatus-response> is deprecated: use core_communication_srvs-srv:ConnectionEnableStatus-response instead.")))

(cl:ensure-generic-function 'isConnectionEstablished-val :lambda-list '(m))
(cl:defmethod isConnectionEstablished-val ((m <ConnectionEnableStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:isConnectionEstablished-val is deprecated.  Use core_communication_srvs-srv:isConnectionEstablished instead.")
  (isConnectionEstablished m))

(cl:ensure-generic-function 'isRobotEnabled-val :lambda-list '(m))
(cl:defmethod isRobotEnabled-val ((m <ConnectionEnableStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:isRobotEnabled-val is deprecated.  Use core_communication_srvs-srv:isRobotEnabled instead.")
  (isRobotEnabled m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConnectionEnableStatus-response>) ostream)
  "Serializes a message object of type '<ConnectionEnableStatus-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isConnectionEstablished) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isRobotEnabled) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConnectionEnableStatus-response>) istream)
  "Deserializes a message object of type '<ConnectionEnableStatus-response>"
    (cl:setf (cl:slot-value msg 'isConnectionEstablished) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'isRobotEnabled) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConnectionEnableStatus-response>)))
  "Returns string type for a service object of type '<ConnectionEnableStatus-response>"
  "core_communication_srvs/ConnectionEnableStatusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConnectionEnableStatus-response)))
  "Returns string type for a service object of type 'ConnectionEnableStatus-response"
  "core_communication_srvs/ConnectionEnableStatusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConnectionEnableStatus-response>)))
  "Returns md5sum for a message object of type '<ConnectionEnableStatus-response>"
  "6dd3f44c2a7a09b518da55fa09ff3c5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConnectionEnableStatus-response)))
  "Returns md5sum for a message object of type 'ConnectionEnableStatus-response"
  "6dd3f44c2a7a09b518da55fa09ff3c5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConnectionEnableStatus-response>)))
  "Returns full string definition for message of type '<ConnectionEnableStatus-response>"
  (cl:format cl:nil "~%bool isConnectionEstablished~%bool isRobotEnabled~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConnectionEnableStatus-response)))
  "Returns full string definition for message of type 'ConnectionEnableStatus-response"
  (cl:format cl:nil "~%bool isConnectionEstablished~%bool isRobotEnabled~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConnectionEnableStatus-response>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConnectionEnableStatus-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ConnectionEnableStatus-response
    (cl:cons ':isConnectionEstablished (isConnectionEstablished msg))
    (cl:cons ':isRobotEnabled (isRobotEnabled msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ConnectionEnableStatus)))
  'ConnectionEnableStatus-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ConnectionEnableStatus)))
  'ConnectionEnableStatus-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConnectionEnableStatus)))
  "Returns string type for a service object of type '<ConnectionEnableStatus>"
  "core_communication_srvs/ConnectionEnableStatus")