; Auto-generated. Do not edit!


(cl:in-package core_communication_srvs-srv)


;//! \htmlinclude ControlLoop-request.msg.html

(cl:defclass <ControlLoop-request> (roslisp-msg-protocol:ros-message)
  ((setControlLoop
    :reader setControlLoop
    :initarg :setControlLoop
    :type cl:boolean
    :initform cl:nil)
   (newControlLoop
    :reader newControlLoop
    :initarg :newControlLoop
    :type core_communication_msgs-msg:ControlLoop
    :initform (cl:make-instance 'core_communication_msgs-msg:ControlLoop)))
)

(cl:defclass ControlLoop-request (<ControlLoop-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlLoop-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlLoop-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<ControlLoop-request> is deprecated: use core_communication_srvs-srv:ControlLoop-request instead.")))

(cl:ensure-generic-function 'setControlLoop-val :lambda-list '(m))
(cl:defmethod setControlLoop-val ((m <ControlLoop-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:setControlLoop-val is deprecated.  Use core_communication_srvs-srv:setControlLoop instead.")
  (setControlLoop m))

(cl:ensure-generic-function 'newControlLoop-val :lambda-list '(m))
(cl:defmethod newControlLoop-val ((m <ControlLoop-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:newControlLoop-val is deprecated.  Use core_communication_srvs-srv:newControlLoop instead.")
  (newControlLoop m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlLoop-request>) ostream)
  "Serializes a message object of type '<ControlLoop-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'setControlLoop) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'newControlLoop) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlLoop-request>) istream)
  "Deserializes a message object of type '<ControlLoop-request>"
    (cl:setf (cl:slot-value msg 'setControlLoop) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'newControlLoop) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlLoop-request>)))
  "Returns string type for a service object of type '<ControlLoop-request>"
  "core_communication_srvs/ControlLoopRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlLoop-request)))
  "Returns string type for a service object of type 'ControlLoop-request"
  "core_communication_srvs/ControlLoopRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlLoop-request>)))
  "Returns md5sum for a message object of type '<ControlLoop-request>"
  "07980c17b05613bcf2464741e7a30038")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlLoop-request)))
  "Returns md5sum for a message object of type 'ControlLoop-request"
  "07980c17b05613bcf2464741e7a30038")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlLoop-request>)))
  "Returns full string definition for message of type '<ControlLoop-request>"
  (cl:format cl:nil "~%bool setControlLoop~%core_communication_msgs/ControlLoop newControlLoop~%~%================================================================================~%MSG: core_communication_msgs/ControlLoop~%string className~%string baseClassName~%string description~%int64 referenceId~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlLoop-request)))
  "Returns full string definition for message of type 'ControlLoop-request"
  (cl:format cl:nil "~%bool setControlLoop~%core_communication_msgs/ControlLoop newControlLoop~%~%================================================================================~%MSG: core_communication_msgs/ControlLoop~%string className~%string baseClassName~%string description~%int64 referenceId~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlLoop-request>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'newControlLoop))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlLoop-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlLoop-request
    (cl:cons ':setControlLoop (setControlLoop msg))
    (cl:cons ':newControlLoop (newControlLoop msg))
))
;//! \htmlinclude ControlLoop-response.msg.html

(cl:defclass <ControlLoop-response> (roslisp-msg-protocol:ros-message)
  ((controlLoops
    :reader controlLoops
    :initarg :controlLoops
    :type (cl:vector core_communication_msgs-msg:ControlLoop)
   :initform (cl:make-array 0 :element-type 'core_communication_msgs-msg:ControlLoop :initial-element (cl:make-instance 'core_communication_msgs-msg:ControlLoop)))
   (activeControlLoop
    :reader activeControlLoop
    :initarg :activeControlLoop
    :type core_communication_msgs-msg:ControlLoop
    :initform (cl:make-instance 'core_communication_msgs-msg:ControlLoop)))
)

(cl:defclass ControlLoop-response (<ControlLoop-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlLoop-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlLoop-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<ControlLoop-response> is deprecated: use core_communication_srvs-srv:ControlLoop-response instead.")))

(cl:ensure-generic-function 'controlLoops-val :lambda-list '(m))
(cl:defmethod controlLoops-val ((m <ControlLoop-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:controlLoops-val is deprecated.  Use core_communication_srvs-srv:controlLoops instead.")
  (controlLoops m))

(cl:ensure-generic-function 'activeControlLoop-val :lambda-list '(m))
(cl:defmethod activeControlLoop-val ((m <ControlLoop-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:activeControlLoop-val is deprecated.  Use core_communication_srvs-srv:activeControlLoop instead.")
  (activeControlLoop m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlLoop-response>) ostream)
  "Serializes a message object of type '<ControlLoop-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'controlLoops))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'controlLoops))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'activeControlLoop) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlLoop-response>) istream)
  "Deserializes a message object of type '<ControlLoop-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'controlLoops) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'controlLoops)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'core_communication_msgs-msg:ControlLoop))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'activeControlLoop) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlLoop-response>)))
  "Returns string type for a service object of type '<ControlLoop-response>"
  "core_communication_srvs/ControlLoopResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlLoop-response)))
  "Returns string type for a service object of type 'ControlLoop-response"
  "core_communication_srvs/ControlLoopResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlLoop-response>)))
  "Returns md5sum for a message object of type '<ControlLoop-response>"
  "07980c17b05613bcf2464741e7a30038")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlLoop-response)))
  "Returns md5sum for a message object of type 'ControlLoop-response"
  "07980c17b05613bcf2464741e7a30038")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlLoop-response>)))
  "Returns full string definition for message of type '<ControlLoop-response>"
  (cl:format cl:nil "~%core_communication_msgs/ControlLoop[] controlLoops~%core_communication_msgs/ControlLoop activeControlLoop~%~%~%================================================================================~%MSG: core_communication_msgs/ControlLoop~%string className~%string baseClassName~%string description~%int64 referenceId~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlLoop-response)))
  "Returns full string definition for message of type 'ControlLoop-response"
  (cl:format cl:nil "~%core_communication_msgs/ControlLoop[] controlLoops~%core_communication_msgs/ControlLoop activeControlLoop~%~%~%================================================================================~%MSG: core_communication_msgs/ControlLoop~%string className~%string baseClassName~%string description~%int64 referenceId~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlLoop-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'controlLoops) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'activeControlLoop))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlLoop-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlLoop-response
    (cl:cons ':controlLoops (controlLoops msg))
    (cl:cons ':activeControlLoop (activeControlLoop msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ControlLoop)))
  'ControlLoop-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ControlLoop)))
  'ControlLoop-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlLoop)))
  "Returns string type for a service object of type '<ControlLoop>"
  "core_communication_srvs/ControlLoop")