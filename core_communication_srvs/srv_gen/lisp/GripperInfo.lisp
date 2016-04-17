; Auto-generated. Do not edit!


(cl:in-package core_communication_srvs-srv)


;//! \htmlinclude GripperInfo-request.msg.html

(cl:defclass <GripperInfo-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GripperInfo-request (<GripperInfo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperInfo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperInfo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<GripperInfo-request> is deprecated: use core_communication_srvs-srv:GripperInfo-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperInfo-request>) ostream)
  "Serializes a message object of type '<GripperInfo-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperInfo-request>) istream)
  "Deserializes a message object of type '<GripperInfo-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperInfo-request>)))
  "Returns string type for a service object of type '<GripperInfo-request>"
  "core_communication_srvs/GripperInfoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperInfo-request)))
  "Returns string type for a service object of type 'GripperInfo-request"
  "core_communication_srvs/GripperInfoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperInfo-request>)))
  "Returns md5sum for a message object of type '<GripperInfo-request>"
  "4483535ab2994ff7413bfbaa2fc66115")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperInfo-request)))
  "Returns md5sum for a message object of type 'GripperInfo-request"
  "4483535ab2994ff7413bfbaa2fc66115")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperInfo-request>)))
  "Returns full string definition for message of type '<GripperInfo-request>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperInfo-request)))
  "Returns full string definition for message of type 'GripperInfo-request"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperInfo-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperInfo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperInfo-request
))
;//! \htmlinclude GripperInfo-response.msg.html

(cl:defclass <GripperInfo-response> (roslisp-msg-protocol:ros-message)
  ((isGripperInstalled
    :reader isGripperInstalled
    :initarg :isGripperInstalled
    :type cl:boolean
    :initform cl:nil)
   (minimumOpening
    :reader minimumOpening
    :initarg :minimumOpening
    :type cl:float
    :initform 0.0)
   (maximumOpening
    :reader maximumOpening
    :initarg :maximumOpening
    :type cl:float
    :initform 0.0)
   (noMovementTimeout
    :reader noMovementTimeout
    :initarg :noMovementTimeout
    :type cl:float
    :initform 0.0))
)

(cl:defclass GripperInfo-response (<GripperInfo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperInfo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperInfo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<GripperInfo-response> is deprecated: use core_communication_srvs-srv:GripperInfo-response instead.")))

(cl:ensure-generic-function 'isGripperInstalled-val :lambda-list '(m))
(cl:defmethod isGripperInstalled-val ((m <GripperInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:isGripperInstalled-val is deprecated.  Use core_communication_srvs-srv:isGripperInstalled instead.")
  (isGripperInstalled m))

(cl:ensure-generic-function 'minimumOpening-val :lambda-list '(m))
(cl:defmethod minimumOpening-val ((m <GripperInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:minimumOpening-val is deprecated.  Use core_communication_srvs-srv:minimumOpening instead.")
  (minimumOpening m))

(cl:ensure-generic-function 'maximumOpening-val :lambda-list '(m))
(cl:defmethod maximumOpening-val ((m <GripperInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:maximumOpening-val is deprecated.  Use core_communication_srvs-srv:maximumOpening instead.")
  (maximumOpening m))

(cl:ensure-generic-function 'noMovementTimeout-val :lambda-list '(m))
(cl:defmethod noMovementTimeout-val ((m <GripperInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:noMovementTimeout-val is deprecated.  Use core_communication_srvs-srv:noMovementTimeout instead.")
  (noMovementTimeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperInfo-response>) ostream)
  "Serializes a message object of type '<GripperInfo-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isGripperInstalled) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'minimumOpening))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'maximumOpening))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'noMovementTimeout))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperInfo-response>) istream)
  "Deserializes a message object of type '<GripperInfo-response>"
    (cl:setf (cl:slot-value msg 'isGripperInstalled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'minimumOpening) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maximumOpening) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'noMovementTimeout) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperInfo-response>)))
  "Returns string type for a service object of type '<GripperInfo-response>"
  "core_communication_srvs/GripperInfoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperInfo-response)))
  "Returns string type for a service object of type 'GripperInfo-response"
  "core_communication_srvs/GripperInfoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperInfo-response>)))
  "Returns md5sum for a message object of type '<GripperInfo-response>"
  "4483535ab2994ff7413bfbaa2fc66115")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperInfo-response)))
  "Returns md5sum for a message object of type 'GripperInfo-response"
  "4483535ab2994ff7413bfbaa2fc66115")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperInfo-response>)))
  "Returns full string definition for message of type '<GripperInfo-response>"
  (cl:format cl:nil "~%bool isGripperInstalled~%float64 minimumOpening~%float64 maximumOpening~%float64 noMovementTimeout~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperInfo-response)))
  "Returns full string definition for message of type 'GripperInfo-response"
  (cl:format cl:nil "~%bool isGripperInstalled~%float64 minimumOpening~%float64 maximumOpening~%float64 noMovementTimeout~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperInfo-response>))
  (cl:+ 0
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperInfo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperInfo-response
    (cl:cons ':isGripperInstalled (isGripperInstalled msg))
    (cl:cons ':minimumOpening (minimumOpening msg))
    (cl:cons ':maximumOpening (maximumOpening msg))
    (cl:cons ':noMovementTimeout (noMovementTimeout msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GripperInfo)))
  'GripperInfo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GripperInfo)))
  'GripperInfo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperInfo)))
  "Returns string type for a service object of type '<GripperInfo>"
  "core_communication_srvs/GripperInfo")