; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude BioRobElectricalState.msg.html

(cl:defclass <BioRobElectricalState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (motor_current
    :reader motor_current
    :initarg :motor_current
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (motor_voltage
    :reader motor_voltage
    :initarg :motor_voltage
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (system_current
    :reader system_current
    :initarg :system_current
    :type cl:float
    :initform 0.0)
   (system_voltage
    :reader system_voltage
    :initarg :system_voltage
    :type cl:float
    :initform 0.0))
)

(cl:defclass BioRobElectricalState (<BioRobElectricalState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BioRobElectricalState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BioRobElectricalState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<BioRobElectricalState> is deprecated: use core_communication_msgs-msg:BioRobElectricalState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BioRobElectricalState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:header-val is deprecated.  Use core_communication_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'motor_current-val :lambda-list '(m))
(cl:defmethod motor_current-val ((m <BioRobElectricalState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:motor_current-val is deprecated.  Use core_communication_msgs-msg:motor_current instead.")
  (motor_current m))

(cl:ensure-generic-function 'motor_voltage-val :lambda-list '(m))
(cl:defmethod motor_voltage-val ((m <BioRobElectricalState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:motor_voltage-val is deprecated.  Use core_communication_msgs-msg:motor_voltage instead.")
  (motor_voltage m))

(cl:ensure-generic-function 'system_current-val :lambda-list '(m))
(cl:defmethod system_current-val ((m <BioRobElectricalState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:system_current-val is deprecated.  Use core_communication_msgs-msg:system_current instead.")
  (system_current m))

(cl:ensure-generic-function 'system_voltage-val :lambda-list '(m))
(cl:defmethod system_voltage-val ((m <BioRobElectricalState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:system_voltage-val is deprecated.  Use core_communication_msgs-msg:system_voltage instead.")
  (system_voltage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BioRobElectricalState>) ostream)
  "Serializes a message object of type '<BioRobElectricalState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'motor_current))))
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
   (cl:slot-value msg 'motor_current))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'motor_voltage))))
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
   (cl:slot-value msg 'motor_voltage))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'system_current))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'system_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BioRobElectricalState>) istream)
  "Deserializes a message object of type '<BioRobElectricalState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'motor_current) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'motor_current)))
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'motor_voltage) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'motor_voltage)))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'system_current) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'system_voltage) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BioRobElectricalState>)))
  "Returns string type for a message object of type '<BioRobElectricalState>"
  "core_communication_msgs/BioRobElectricalState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BioRobElectricalState)))
  "Returns string type for a message object of type 'BioRobElectricalState"
  "core_communication_msgs/BioRobElectricalState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BioRobElectricalState>)))
  "Returns md5sum for a message object of type '<BioRobElectricalState>"
  "038244ccc107f157bdb3173935332698")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BioRobElectricalState)))
  "Returns md5sum for a message object of type 'BioRobElectricalState"
  "038244ccc107f157bdb3173935332698")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BioRobElectricalState>)))
  "Returns full string definition for message of type '<BioRobElectricalState>"
  (cl:format cl:nil "std_msgs/Header header~%float64[] motor_current~%float64[] motor_voltage~%float64 system_current~%float64 system_voltage~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BioRobElectricalState)))
  "Returns full string definition for message of type 'BioRobElectricalState"
  (cl:format cl:nil "std_msgs/Header header~%float64[] motor_current~%float64[] motor_voltage~%float64 system_current~%float64 system_voltage~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BioRobElectricalState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'motor_current) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'motor_voltage) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BioRobElectricalState>))
  "Converts a ROS message object to a list"
  (cl:list 'BioRobElectricalState
    (cl:cons ':header (header msg))
    (cl:cons ':motor_current (motor_current msg))
    (cl:cons ':motor_voltage (motor_voltage msg))
    (cl:cons ':system_current (system_current msg))
    (cl:cons ':system_voltage (system_voltage msg))
))
