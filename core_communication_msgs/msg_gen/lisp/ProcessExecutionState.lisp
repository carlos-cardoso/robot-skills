; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude ProcessExecutionState.msg.html

(cl:defclass <ProcessExecutionState> (roslisp-msg-protocol:ros-message)
  ((process_paused
    :reader process_paused
    :initarg :process_paused
    :type cl:boolean
    :initform cl:nil)
   (process_running
    :reader process_running
    :initarg :process_running
    :type cl:boolean
    :initform cl:nil)
   (process_finished
    :reader process_finished
    :initarg :process_finished
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ProcessExecutionState (<ProcessExecutionState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ProcessExecutionState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ProcessExecutionState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<ProcessExecutionState> is deprecated: use core_communication_msgs-msg:ProcessExecutionState instead.")))

(cl:ensure-generic-function 'process_paused-val :lambda-list '(m))
(cl:defmethod process_paused-val ((m <ProcessExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:process_paused-val is deprecated.  Use core_communication_msgs-msg:process_paused instead.")
  (process_paused m))

(cl:ensure-generic-function 'process_running-val :lambda-list '(m))
(cl:defmethod process_running-val ((m <ProcessExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:process_running-val is deprecated.  Use core_communication_msgs-msg:process_running instead.")
  (process_running m))

(cl:ensure-generic-function 'process_finished-val :lambda-list '(m))
(cl:defmethod process_finished-val ((m <ProcessExecutionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:process_finished-val is deprecated.  Use core_communication_msgs-msg:process_finished instead.")
  (process_finished m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ProcessExecutionState>) ostream)
  "Serializes a message object of type '<ProcessExecutionState>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'process_paused) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'process_running) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'process_finished) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ProcessExecutionState>) istream)
  "Deserializes a message object of type '<ProcessExecutionState>"
    (cl:setf (cl:slot-value msg 'process_paused) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'process_running) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'process_finished) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ProcessExecutionState>)))
  "Returns string type for a message object of type '<ProcessExecutionState>"
  "core_communication_msgs/ProcessExecutionState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessExecutionState)))
  "Returns string type for a message object of type 'ProcessExecutionState"
  "core_communication_msgs/ProcessExecutionState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ProcessExecutionState>)))
  "Returns md5sum for a message object of type '<ProcessExecutionState>"
  "062eedcbddf675783ad1802e7ee31590")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ProcessExecutionState)))
  "Returns md5sum for a message object of type 'ProcessExecutionState"
  "062eedcbddf675783ad1802e7ee31590")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ProcessExecutionState>)))
  "Returns full string definition for message of type '<ProcessExecutionState>"
  (cl:format cl:nil "bool process_paused~%bool process_running~%bool process_finished~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ProcessExecutionState)))
  "Returns full string definition for message of type 'ProcessExecutionState"
  (cl:format cl:nil "bool process_paused~%bool process_running~%bool process_finished~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ProcessExecutionState>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ProcessExecutionState>))
  "Converts a ROS message object to a list"
  (cl:list 'ProcessExecutionState
    (cl:cons ':process_paused (process_paused msg))
    (cl:cons ':process_running (process_running msg))
    (cl:cons ':process_finished (process_finished msg))
))
