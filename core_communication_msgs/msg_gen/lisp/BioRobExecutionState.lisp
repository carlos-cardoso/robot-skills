; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude BioRobExecutionState.msg.html

(cl:defclass <BioRobExecutionState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (connected
    :reader connected
    :initarg :connected
    :type cl:boolean
    :initform cl:nil)
   (enabled
    :reader enabled
    :initarg :enabled
    :type cl:boolean
    :initform cl:nil)
   (executionState
    :reader executionState
    :initarg :executionState
    :type cl:integer
    :initform 0)
   (executionStateString
    :reader executionStateString
    :initarg :executionStateString
    :type cl:string
    :initform "")
   (initialized
    :reader initialized
    :initarg :initialized
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BioRobExecutionState (<BioRobExecutionState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BioRobExecutionState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BioRobExecutionState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<BioRobExecutionState> is deprecated: use core_communication_msgs-msg:BioRobExecutionState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BioRobExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:header-val is deprecated.  Use core_communication_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'connected-val :lambda-list '(m))
(cl:defmethod connected-val ((m <BioRobExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:connected-val is deprecated.  Use core_communication_msgs-msg:connected instead.")
  (connected m))

(cl:ensure-generic-function 'enabled-val :lambda-list '(m))
(cl:defmethod enabled-val ((m <BioRobExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:enabled-val is deprecated.  Use core_communication_msgs-msg:enabled instead.")
  (enabled m))

(cl:ensure-generic-function 'executionState-val :lambda-list '(m))
(cl:defmethod executionState-val ((m <BioRobExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:executionState-val is deprecated.  Use core_communication_msgs-msg:executionState instead.")
  (executionState m))

(cl:ensure-generic-function 'executionStateString-val :lambda-list '(m))
(cl:defmethod executionStateString-val ((m <BioRobExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:executionStateString-val is deprecated.  Use core_communication_msgs-msg:executionStateString instead.")
  (executionStateString m))

(cl:ensure-generic-function 'initialized-val :lambda-list '(m))
(cl:defmethod initialized-val ((m <BioRobExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:initialized-val is deprecated.  Use core_communication_msgs-msg:initialized instead.")
  (initialized m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BioRobExecutionState>) ostream)
  "Serializes a message object of type '<BioRobExecutionState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'connected) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enabled) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'executionState)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'executionState)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'executionState)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'executionState)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'executionStateString))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'executionStateString))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'initialized) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BioRobExecutionState>) istream)
  "Deserializes a message object of type '<BioRobExecutionState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'connected) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'enabled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'executionState)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'executionState)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'executionState)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'executionState)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'executionStateString) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'executionStateString) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'initialized) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BioRobExecutionState>)))
  "Returns string type for a message object of type '<BioRobExecutionState>"
  "core_communication_msgs/BioRobExecutionState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BioRobExecutionState)))
  "Returns string type for a message object of type 'BioRobExecutionState"
  "core_communication_msgs/BioRobExecutionState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BioRobExecutionState>)))
  "Returns md5sum for a message object of type '<BioRobExecutionState>"
  "5ec225b9018e1847deb260c173b02645")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BioRobExecutionState)))
  "Returns md5sum for a message object of type 'BioRobExecutionState"
  "5ec225b9018e1847deb260c173b02645")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BioRobExecutionState>)))
  "Returns full string definition for message of type '<BioRobExecutionState>"
  (cl:format cl:nil "Header header~%bool connected~%bool enabled~%uint32 executionState~%string executionStateString~%bool initialized~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BioRobExecutionState)))
  "Returns full string definition for message of type 'BioRobExecutionState"
  (cl:format cl:nil "Header header~%bool connected~%bool enabled~%uint32 executionState~%string executionStateString~%bool initialized~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BioRobExecutionState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4
     4 (cl:length (cl:slot-value msg 'executionStateString))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BioRobExecutionState>))
  "Converts a ROS message object to a list"
  (cl:list 'BioRobExecutionState
    (cl:cons ':header (header msg))
    (cl:cons ':connected (connected msg))
    (cl:cons ':enabled (enabled msg))
    (cl:cons ':executionState (executionState msg))
    (cl:cons ':executionStateString (executionStateString msg))
    (cl:cons ':initialized (initialized msg))
))
