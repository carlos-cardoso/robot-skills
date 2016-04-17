; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude BeckhoffTerminalDescription.msg.html

(cl:defclass <BeckhoffTerminalDescription> (roslisp-msg-protocol:ros-message)
  ((terminal
    :reader terminal
    :initarg :terminal
    :type cl:string
    :initform "")
   (position
    :reader position
    :initarg :position
    :type cl:integer
    :initform 0)
   (num_ports
    :reader num_ports
    :initarg :num_ports
    :type cl:fixnum
    :initform 0)
   (ports
    :reader ports
    :initarg :ports
    :type (cl:vector core_communication_msgs-msg:BeckhoffPortDescription)
   :initform (cl:make-array 0 :element-type 'core_communication_msgs-msg:BeckhoffPortDescription :initial-element (cl:make-instance 'core_communication_msgs-msg:BeckhoffPortDescription))))
)

(cl:defclass BeckhoffTerminalDescription (<BeckhoffTerminalDescription>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BeckhoffTerminalDescription>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BeckhoffTerminalDescription)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<BeckhoffTerminalDescription> is deprecated: use core_communication_msgs-msg:BeckhoffTerminalDescription instead.")))

(cl:ensure-generic-function 'terminal-val :lambda-list '(m))
(cl:defmethod terminal-val ((m <BeckhoffTerminalDescription>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:terminal-val is deprecated.  Use core_communication_msgs-msg:terminal instead.")
  (terminal m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <BeckhoffTerminalDescription>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:position-val is deprecated.  Use core_communication_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'num_ports-val :lambda-list '(m))
(cl:defmethod num_ports-val ((m <BeckhoffTerminalDescription>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:num_ports-val is deprecated.  Use core_communication_msgs-msg:num_ports instead.")
  (num_ports m))

(cl:ensure-generic-function 'ports-val :lambda-list '(m))
(cl:defmethod ports-val ((m <BeckhoffTerminalDescription>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:ports-val is deprecated.  Use core_communication_msgs-msg:ports instead.")
  (ports m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BeckhoffTerminalDescription>) ostream)
  "Serializes a message object of type '<BeckhoffTerminalDescription>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'terminal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'terminal))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_ports)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ports))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ports))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BeckhoffTerminalDescription>) istream)
  "Deserializes a message object of type '<BeckhoffTerminalDescription>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'terminal) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'terminal) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_ports)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ports) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ports)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'core_communication_msgs-msg:BeckhoffPortDescription))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BeckhoffTerminalDescription>)))
  "Returns string type for a message object of type '<BeckhoffTerminalDescription>"
  "core_communication_msgs/BeckhoffTerminalDescription")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BeckhoffTerminalDescription)))
  "Returns string type for a message object of type 'BeckhoffTerminalDescription"
  "core_communication_msgs/BeckhoffTerminalDescription")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BeckhoffTerminalDescription>)))
  "Returns md5sum for a message object of type '<BeckhoffTerminalDescription>"
  "59e7de013f74774a93c0a1dafb1d6c9b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BeckhoffTerminalDescription)))
  "Returns md5sum for a message object of type 'BeckhoffTerminalDescription"
  "59e7de013f74774a93c0a1dafb1d6c9b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BeckhoffTerminalDescription>)))
  "Returns full string definition for message of type '<BeckhoffTerminalDescription>"
  (cl:format cl:nil "string terminal # terminal type~%uint32 position # relative position of the terminal in the EtherCAT bus (0-n)~%uint8 num_ports # number of ports on the terminal (0-n)~%BeckhoffPortDescription[] ports # port descriptions~%~%================================================================================~%MSG: core_communication_msgs/BeckhoffPortDescription~%uint8 index~%string direction # 'in','out'~%string type # 'digital';'analog'~%string data_type # 'uint8' 'uint16' 'uint32' 'uint64'~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BeckhoffTerminalDescription)))
  "Returns full string definition for message of type 'BeckhoffTerminalDescription"
  (cl:format cl:nil "string terminal # terminal type~%uint32 position # relative position of the terminal in the EtherCAT bus (0-n)~%uint8 num_ports # number of ports on the terminal (0-n)~%BeckhoffPortDescription[] ports # port descriptions~%~%================================================================================~%MSG: core_communication_msgs/BeckhoffPortDescription~%uint8 index~%string direction # 'in','out'~%string type # 'digital';'analog'~%string data_type # 'uint8' 'uint16' 'uint32' 'uint64'~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BeckhoffTerminalDescription>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'terminal))
     4
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ports) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BeckhoffTerminalDescription>))
  "Converts a ROS message object to a list"
  (cl:list 'BeckhoffTerminalDescription
    (cl:cons ':terminal (terminal msg))
    (cl:cons ':position (position msg))
    (cl:cons ':num_ports (num_ports msg))
    (cl:cons ':ports (ports msg))
))
