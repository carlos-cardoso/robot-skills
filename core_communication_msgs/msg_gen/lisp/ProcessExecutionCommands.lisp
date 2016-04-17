; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude ProcessExecutionCommands.msg.html

(cl:defclass <ProcessExecutionCommands> (roslisp-msg-protocol:ros-message)
  ((repeat
    :reader repeat
    :initarg :repeat
    :type cl:boolean
    :initform cl:nil)
   (process
    :reader process
    :initarg :process
    :type cl:string
    :initform "")
   (proceed_when_gui_inactive
    :reader proceed_when_gui_inactive
    :initarg :proceed_when_gui_inactive
    :type cl:boolean
    :initform cl:nil)
   (pause_process
    :reader pause_process
    :initarg :pause_process
    :type cl:boolean
    :initform cl:nil)
   (resume_process
    :reader resume_process
    :initarg :resume_process
    :type cl:boolean
    :initform cl:nil)
   (start_process
    :reader start_process
    :initarg :start_process
    :type cl:boolean
    :initform cl:nil)
   (stop_process
    :reader stop_process
    :initarg :stop_process
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ProcessExecutionCommands (<ProcessExecutionCommands>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ProcessExecutionCommands>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ProcessExecutionCommands)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<ProcessExecutionCommands> is deprecated: use core_communication_msgs-msg:ProcessExecutionCommands instead.")))

(cl:ensure-generic-function 'repeat-val :lambda-list '(m))
(cl:defmethod repeat-val ((m <ProcessExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:repeat-val is deprecated.  Use core_communication_msgs-msg:repeat instead.")
  (repeat m))

(cl:ensure-generic-function 'process-val :lambda-list '(m))
(cl:defmethod process-val ((m <ProcessExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:process-val is deprecated.  Use core_communication_msgs-msg:process instead.")
  (process m))

(cl:ensure-generic-function 'proceed_when_gui_inactive-val :lambda-list '(m))
(cl:defmethod proceed_when_gui_inactive-val ((m <ProcessExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:proceed_when_gui_inactive-val is deprecated.  Use core_communication_msgs-msg:proceed_when_gui_inactive instead.")
  (proceed_when_gui_inactive m))

(cl:ensure-generic-function 'pause_process-val :lambda-list '(m))
(cl:defmethod pause_process-val ((m <ProcessExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:pause_process-val is deprecated.  Use core_communication_msgs-msg:pause_process instead.")
  (pause_process m))

(cl:ensure-generic-function 'resume_process-val :lambda-list '(m))
(cl:defmethod resume_process-val ((m <ProcessExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:resume_process-val is deprecated.  Use core_communication_msgs-msg:resume_process instead.")
  (resume_process m))

(cl:ensure-generic-function 'start_process-val :lambda-list '(m))
(cl:defmethod start_process-val ((m <ProcessExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:start_process-val is deprecated.  Use core_communication_msgs-msg:start_process instead.")
  (start_process m))

(cl:ensure-generic-function 'stop_process-val :lambda-list '(m))
(cl:defmethod stop_process-val ((m <ProcessExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:stop_process-val is deprecated.  Use core_communication_msgs-msg:stop_process instead.")
  (stop_process m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ProcessExecutionCommands>) ostream)
  "Serializes a message object of type '<ProcessExecutionCommands>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'repeat) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'process))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'process))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'proceed_when_gui_inactive) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pause_process) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'resume_process) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start_process) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'stop_process) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ProcessExecutionCommands>) istream)
  "Deserializes a message object of type '<ProcessExecutionCommands>"
    (cl:setf (cl:slot-value msg 'repeat) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'process) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'process) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'proceed_when_gui_inactive) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'pause_process) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'resume_process) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'start_process) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'stop_process) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ProcessExecutionCommands>)))
  "Returns string type for a message object of type '<ProcessExecutionCommands>"
  "core_communication_msgs/ProcessExecutionCommands")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessExecutionCommands)))
  "Returns string type for a message object of type 'ProcessExecutionCommands"
  "core_communication_msgs/ProcessExecutionCommands")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ProcessExecutionCommands>)))
  "Returns md5sum for a message object of type '<ProcessExecutionCommands>"
  "366f8279ab1970f7c58efde097543c71")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ProcessExecutionCommands)))
  "Returns md5sum for a message object of type 'ProcessExecutionCommands"
  "366f8279ab1970f7c58efde097543c71")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ProcessExecutionCommands>)))
  "Returns full string definition for message of type '<ProcessExecutionCommands>"
  (cl:format cl:nil "bool repeat~%string process~%bool proceed_when_gui_inactive~%bool pause_process~%bool resume_process~%bool start_process~%bool stop_process~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ProcessExecutionCommands)))
  "Returns full string definition for message of type 'ProcessExecutionCommands"
  (cl:format cl:nil "bool repeat~%string process~%bool proceed_when_gui_inactive~%bool pause_process~%bool resume_process~%bool start_process~%bool stop_process~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ProcessExecutionCommands>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'process))
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ProcessExecutionCommands>))
  "Converts a ROS message object to a list"
  (cl:list 'ProcessExecutionCommands
    (cl:cons ':repeat (repeat msg))
    (cl:cons ':process (process msg))
    (cl:cons ':proceed_when_gui_inactive (proceed_when_gui_inactive msg))
    (cl:cons ':pause_process (pause_process msg))
    (cl:cons ':resume_process (resume_process msg))
    (cl:cons ':start_process (start_process msg))
    (cl:cons ':stop_process (stop_process msg))
))
