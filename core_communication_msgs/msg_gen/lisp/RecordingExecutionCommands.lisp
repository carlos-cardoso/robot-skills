; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude RecordingExecutionCommands.msg.html

(cl:defclass <RecordingExecutionCommands> (roslisp-msg-protocol:ros-message)
  ((startRecording
    :reader startRecording
    :initarg :startRecording
    :type cl:boolean
    :initform cl:nil)
   (stopRecording
    :reader stopRecording
    :initarg :stopRecording
    :type cl:boolean
    :initform cl:nil)
   (saveRecording
    :reader saveRecording
    :initarg :saveRecording
    :type cl:boolean
    :initform cl:nil)
   (clearRecording
    :reader clearRecording
    :initarg :clearRecording
    :type cl:boolean
    :initform cl:nil)
   (successful
    :reader successful
    :initarg :successful
    :type cl:boolean
    :initform cl:nil)
   (savePath
    :reader savePath
    :initarg :savePath
    :type cl:string
    :initform ""))
)

(cl:defclass RecordingExecutionCommands (<RecordingExecutionCommands>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RecordingExecutionCommands>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RecordingExecutionCommands)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<RecordingExecutionCommands> is deprecated: use core_communication_msgs-msg:RecordingExecutionCommands instead.")))

(cl:ensure-generic-function 'startRecording-val :lambda-list '(m))
(cl:defmethod startRecording-val ((m <RecordingExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:startRecording-val is deprecated.  Use core_communication_msgs-msg:startRecording instead.")
  (startRecording m))

(cl:ensure-generic-function 'stopRecording-val :lambda-list '(m))
(cl:defmethod stopRecording-val ((m <RecordingExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:stopRecording-val is deprecated.  Use core_communication_msgs-msg:stopRecording instead.")
  (stopRecording m))

(cl:ensure-generic-function 'saveRecording-val :lambda-list '(m))
(cl:defmethod saveRecording-val ((m <RecordingExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:saveRecording-val is deprecated.  Use core_communication_msgs-msg:saveRecording instead.")
  (saveRecording m))

(cl:ensure-generic-function 'clearRecording-val :lambda-list '(m))
(cl:defmethod clearRecording-val ((m <RecordingExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:clearRecording-val is deprecated.  Use core_communication_msgs-msg:clearRecording instead.")
  (clearRecording m))

(cl:ensure-generic-function 'successful-val :lambda-list '(m))
(cl:defmethod successful-val ((m <RecordingExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:successful-val is deprecated.  Use core_communication_msgs-msg:successful instead.")
  (successful m))

(cl:ensure-generic-function 'savePath-val :lambda-list '(m))
(cl:defmethod savePath-val ((m <RecordingExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:savePath-val is deprecated.  Use core_communication_msgs-msg:savePath instead.")
  (savePath m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RecordingExecutionCommands>) ostream)
  "Serializes a message object of type '<RecordingExecutionCommands>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'startRecording) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'stopRecording) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'saveRecording) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'clearRecording) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'successful) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'savePath))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'savePath))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RecordingExecutionCommands>) istream)
  "Deserializes a message object of type '<RecordingExecutionCommands>"
    (cl:setf (cl:slot-value msg 'startRecording) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'stopRecording) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'saveRecording) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'clearRecording) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'successful) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'savePath) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'savePath) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RecordingExecutionCommands>)))
  "Returns string type for a message object of type '<RecordingExecutionCommands>"
  "core_communication_msgs/RecordingExecutionCommands")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RecordingExecutionCommands)))
  "Returns string type for a message object of type 'RecordingExecutionCommands"
  "core_communication_msgs/RecordingExecutionCommands")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RecordingExecutionCommands>)))
  "Returns md5sum for a message object of type '<RecordingExecutionCommands>"
  "454a1b04aa982338dd07615b88fe3c3a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RecordingExecutionCommands)))
  "Returns md5sum for a message object of type 'RecordingExecutionCommands"
  "454a1b04aa982338dd07615b88fe3c3a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RecordingExecutionCommands>)))
  "Returns full string definition for message of type '<RecordingExecutionCommands>"
  (cl:format cl:nil "bool startRecording~%bool stopRecording~%bool saveRecording~%bool clearRecording~%bool successful~%string savePath~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RecordingExecutionCommands)))
  "Returns full string definition for message of type 'RecordingExecutionCommands"
  (cl:format cl:nil "bool startRecording~%bool stopRecording~%bool saveRecording~%bool clearRecording~%bool successful~%string savePath~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RecordingExecutionCommands>))
  (cl:+ 0
     1
     1
     1
     1
     1
     4 (cl:length (cl:slot-value msg 'savePath))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RecordingExecutionCommands>))
  "Converts a ROS message object to a list"
  (cl:list 'RecordingExecutionCommands
    (cl:cons ':startRecording (startRecording msg))
    (cl:cons ':stopRecording (stopRecording msg))
    (cl:cons ':saveRecording (saveRecording msg))
    (cl:cons ':clearRecording (clearRecording msg))
    (cl:cons ':successful (successful msg))
    (cl:cons ':savePath (savePath msg))
))
