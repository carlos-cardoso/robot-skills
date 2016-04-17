; Auto-generated. Do not edit!


(cl:in-package core_communication_srvs-srv)


;//! \htmlinclude BasicTrajInfos-request.msg.html

(cl:defclass <BasicTrajInfos-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass BasicTrajInfos-request (<BasicTrajInfos-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BasicTrajInfos-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BasicTrajInfos-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<BasicTrajInfos-request> is deprecated: use core_communication_srvs-srv:BasicTrajInfos-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BasicTrajInfos-request>) ostream)
  "Serializes a message object of type '<BasicTrajInfos-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BasicTrajInfos-request>) istream)
  "Deserializes a message object of type '<BasicTrajInfos-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BasicTrajInfos-request>)))
  "Returns string type for a service object of type '<BasicTrajInfos-request>"
  "core_communication_srvs/BasicTrajInfosRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicTrajInfos-request)))
  "Returns string type for a service object of type 'BasicTrajInfos-request"
  "core_communication_srvs/BasicTrajInfosRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BasicTrajInfos-request>)))
  "Returns md5sum for a message object of type '<BasicTrajInfos-request>"
  "4135fcce14a6de812c59d2a8b8b566a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BasicTrajInfos-request)))
  "Returns md5sum for a message object of type 'BasicTrajInfos-request"
  "4135fcce14a6de812c59d2a8b8b566a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BasicTrajInfos-request>)))
  "Returns full string definition for message of type '<BasicTrajInfos-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BasicTrajInfos-request)))
  "Returns full string definition for message of type 'BasicTrajInfos-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BasicTrajInfos-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BasicTrajInfos-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BasicTrajInfos-request
))
;//! \htmlinclude BasicTrajInfos-response.msg.html

(cl:defclass <BasicTrajInfos-response> (roslisp-msg-protocol:ros-message)
  ((cartReachingAccuracyFlyByPoint
    :reader cartReachingAccuracyFlyByPoint
    :initarg :cartReachingAccuracyFlyByPoint
    :type cl:float
    :initform 0.0)
   (orientReachingAccuracyFlyByPoint
    :reader orientReachingAccuracyFlyByPoint
    :initarg :orientReachingAccuracyFlyByPoint
    :type cl:float
    :initform 0.0)
   (cartReachingAccuracyStopPoint
    :reader cartReachingAccuracyStopPoint
    :initarg :cartReachingAccuracyStopPoint
    :type cl:float
    :initform 0.0)
   (orientReachingAccuracyStopPoint
    :reader orientReachingAccuracyStopPoint
    :initarg :orientReachingAccuracyStopPoint
    :type cl:float
    :initform 0.0)
   (jointReachingAccuracyStopPoint
    :reader jointReachingAccuracyStopPoint
    :initarg :jointReachingAccuracyStopPoint
    :type cl:float
    :initform 0.0)
   (defaultEndeffectorVel
    :reader defaultEndeffectorVel
    :initarg :defaultEndeffectorVel
    :type cl:float
    :initform 0.0)
   (defaultJointVel
    :reader defaultJointVel
    :initarg :defaultJointVel
    :type cl:float
    :initform 0.0))
)

(cl:defclass BasicTrajInfos-response (<BasicTrajInfos-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BasicTrajInfos-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BasicTrajInfos-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<BasicTrajInfos-response> is deprecated: use core_communication_srvs-srv:BasicTrajInfos-response instead.")))

(cl:ensure-generic-function 'cartReachingAccuracyFlyByPoint-val :lambda-list '(m))
(cl:defmethod cartReachingAccuracyFlyByPoint-val ((m <BasicTrajInfos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:cartReachingAccuracyFlyByPoint-val is deprecated.  Use core_communication_srvs-srv:cartReachingAccuracyFlyByPoint instead.")
  (cartReachingAccuracyFlyByPoint m))

(cl:ensure-generic-function 'orientReachingAccuracyFlyByPoint-val :lambda-list '(m))
(cl:defmethod orientReachingAccuracyFlyByPoint-val ((m <BasicTrajInfos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:orientReachingAccuracyFlyByPoint-val is deprecated.  Use core_communication_srvs-srv:orientReachingAccuracyFlyByPoint instead.")
  (orientReachingAccuracyFlyByPoint m))

(cl:ensure-generic-function 'cartReachingAccuracyStopPoint-val :lambda-list '(m))
(cl:defmethod cartReachingAccuracyStopPoint-val ((m <BasicTrajInfos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:cartReachingAccuracyStopPoint-val is deprecated.  Use core_communication_srvs-srv:cartReachingAccuracyStopPoint instead.")
  (cartReachingAccuracyStopPoint m))

(cl:ensure-generic-function 'orientReachingAccuracyStopPoint-val :lambda-list '(m))
(cl:defmethod orientReachingAccuracyStopPoint-val ((m <BasicTrajInfos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:orientReachingAccuracyStopPoint-val is deprecated.  Use core_communication_srvs-srv:orientReachingAccuracyStopPoint instead.")
  (orientReachingAccuracyStopPoint m))

(cl:ensure-generic-function 'jointReachingAccuracyStopPoint-val :lambda-list '(m))
(cl:defmethod jointReachingAccuracyStopPoint-val ((m <BasicTrajInfos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:jointReachingAccuracyStopPoint-val is deprecated.  Use core_communication_srvs-srv:jointReachingAccuracyStopPoint instead.")
  (jointReachingAccuracyStopPoint m))

(cl:ensure-generic-function 'defaultEndeffectorVel-val :lambda-list '(m))
(cl:defmethod defaultEndeffectorVel-val ((m <BasicTrajInfos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:defaultEndeffectorVel-val is deprecated.  Use core_communication_srvs-srv:defaultEndeffectorVel instead.")
  (defaultEndeffectorVel m))

(cl:ensure-generic-function 'defaultJointVel-val :lambda-list '(m))
(cl:defmethod defaultJointVel-val ((m <BasicTrajInfos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:defaultJointVel-val is deprecated.  Use core_communication_srvs-srv:defaultJointVel instead.")
  (defaultJointVel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BasicTrajInfos-response>) ostream)
  "Serializes a message object of type '<BasicTrajInfos-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'cartReachingAccuracyFlyByPoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'orientReachingAccuracyFlyByPoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'cartReachingAccuracyStopPoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'orientReachingAccuracyStopPoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'jointReachingAccuracyStopPoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'defaultEndeffectorVel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'defaultJointVel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BasicTrajInfos-response>) istream)
  "Deserializes a message object of type '<BasicTrajInfos-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cartReachingAccuracyFlyByPoint) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'orientReachingAccuracyFlyByPoint) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cartReachingAccuracyStopPoint) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'orientReachingAccuracyStopPoint) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'jointReachingAccuracyStopPoint) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'defaultEndeffectorVel) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'defaultJointVel) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BasicTrajInfos-response>)))
  "Returns string type for a service object of type '<BasicTrajInfos-response>"
  "core_communication_srvs/BasicTrajInfosResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicTrajInfos-response)))
  "Returns string type for a service object of type 'BasicTrajInfos-response"
  "core_communication_srvs/BasicTrajInfosResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BasicTrajInfos-response>)))
  "Returns md5sum for a message object of type '<BasicTrajInfos-response>"
  "4135fcce14a6de812c59d2a8b8b566a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BasicTrajInfos-response)))
  "Returns md5sum for a message object of type 'BasicTrajInfos-response"
  "4135fcce14a6de812c59d2a8b8b566a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BasicTrajInfos-response>)))
  "Returns full string definition for message of type '<BasicTrajInfos-response>"
  (cl:format cl:nil "~%float64 cartReachingAccuracyFlyByPoint~%float64 orientReachingAccuracyFlyByPoint~%float64 cartReachingAccuracyStopPoint~%float64 orientReachingAccuracyStopPoint~%float64 jointReachingAccuracyStopPoint~%float64 defaultEndeffectorVel~%float64 defaultJointVel~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BasicTrajInfos-response)))
  "Returns full string definition for message of type 'BasicTrajInfos-response"
  (cl:format cl:nil "~%float64 cartReachingAccuracyFlyByPoint~%float64 orientReachingAccuracyFlyByPoint~%float64 cartReachingAccuracyStopPoint~%float64 orientReachingAccuracyStopPoint~%float64 jointReachingAccuracyStopPoint~%float64 defaultEndeffectorVel~%float64 defaultJointVel~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BasicTrajInfos-response>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BasicTrajInfos-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BasicTrajInfos-response
    (cl:cons ':cartReachingAccuracyFlyByPoint (cartReachingAccuracyFlyByPoint msg))
    (cl:cons ':orientReachingAccuracyFlyByPoint (orientReachingAccuracyFlyByPoint msg))
    (cl:cons ':cartReachingAccuracyStopPoint (cartReachingAccuracyStopPoint msg))
    (cl:cons ':orientReachingAccuracyStopPoint (orientReachingAccuracyStopPoint msg))
    (cl:cons ':jointReachingAccuracyStopPoint (jointReachingAccuracyStopPoint msg))
    (cl:cons ':defaultEndeffectorVel (defaultEndeffectorVel msg))
    (cl:cons ':defaultJointVel (defaultJointVel msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BasicTrajInfos)))
  'BasicTrajInfos-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BasicTrajInfos)))
  'BasicTrajInfos-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicTrajInfos)))
  "Returns string type for a service object of type '<BasicTrajInfos>"
  "core_communication_srvs/BasicTrajInfos")