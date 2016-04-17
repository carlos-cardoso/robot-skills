; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude SystemState.msg.html

(cl:defclass <SystemState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (is_running
    :reader is_running
    :initarg :is_running
    :type cl:boolean
    :initform cl:nil)
   (is_connected
    :reader is_connected
    :initarg :is_connected
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SystemState (<SystemState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SystemState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SystemState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<SystemState> is deprecated: use core_communication_msgs-msg:SystemState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SystemState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:header-val is deprecated.  Use core_communication_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'is_running-val :lambda-list '(m))
(cl:defmethod is_running-val ((m <SystemState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:is_running-val is deprecated.  Use core_communication_msgs-msg:is_running instead.")
  (is_running m))

(cl:ensure-generic-function 'is_connected-val :lambda-list '(m))
(cl:defmethod is_connected-val ((m <SystemState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:is_connected-val is deprecated.  Use core_communication_msgs-msg:is_connected instead.")
  (is_connected m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SystemState>) ostream)
  "Serializes a message object of type '<SystemState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_running) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_connected) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SystemState>) istream)
  "Deserializes a message object of type '<SystemState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'is_running) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_connected) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SystemState>)))
  "Returns string type for a message object of type '<SystemState>"
  "core_communication_msgs/SystemState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SystemState)))
  "Returns string type for a message object of type 'SystemState"
  "core_communication_msgs/SystemState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SystemState>)))
  "Returns md5sum for a message object of type '<SystemState>"
  "b2b9f939dc14b55a6d0d6bf86d7510a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SystemState)))
  "Returns md5sum for a message object of type 'SystemState"
  "b2b9f939dc14b55a6d0d6bf86d7510a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SystemState>)))
  "Returns full string definition for message of type '<SystemState>"
  (cl:format cl:nil "Header header~%bool is_running~%bool is_connected~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SystemState)))
  "Returns full string definition for message of type 'SystemState"
  (cl:format cl:nil "Header header~%bool is_running~%bool is_connected~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SystemState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SystemState>))
  "Converts a ROS message object to a list"
  (cl:list 'SystemState
    (cl:cons ':header (header msg))
    (cl:cons ':is_running (is_running msg))
    (cl:cons ':is_connected (is_connected msg))
))
