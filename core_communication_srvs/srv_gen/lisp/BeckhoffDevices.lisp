; Auto-generated. Do not edit!


(cl:in-package core_communication_srvs-srv)


;//! \htmlinclude BeckhoffDevices-request.msg.html

(cl:defclass <BeckhoffDevices-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass BeckhoffDevices-request (<BeckhoffDevices-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BeckhoffDevices-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BeckhoffDevices-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<BeckhoffDevices-request> is deprecated: use core_communication_srvs-srv:BeckhoffDevices-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BeckhoffDevices-request>) ostream)
  "Serializes a message object of type '<BeckhoffDevices-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BeckhoffDevices-request>) istream)
  "Deserializes a message object of type '<BeckhoffDevices-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BeckhoffDevices-request>)))
  "Returns string type for a service object of type '<BeckhoffDevices-request>"
  "core_communication_srvs/BeckhoffDevicesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BeckhoffDevices-request)))
  "Returns string type for a service object of type 'BeckhoffDevices-request"
  "core_communication_srvs/BeckhoffDevicesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BeckhoffDevices-request>)))
  "Returns md5sum for a message object of type '<BeckhoffDevices-request>"
  "830b2a5efe896b0f1c78a87d9bd2d0af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BeckhoffDevices-request)))
  "Returns md5sum for a message object of type 'BeckhoffDevices-request"
  "830b2a5efe896b0f1c78a87d9bd2d0af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BeckhoffDevices-request>)))
  "Returns full string definition for message of type '<BeckhoffDevices-request>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BeckhoffDevices-request)))
  "Returns full string definition for message of type 'BeckhoffDevices-request"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BeckhoffDevices-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BeckhoffDevices-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BeckhoffDevices-request
))
;//! \htmlinclude BeckhoffDevices-response.msg.html

(cl:defclass <BeckhoffDevices-response> (roslisp-msg-protocol:ros-message)
  ((numTerminals
    :reader numTerminals
    :initarg :numTerminals
    :type cl:integer
    :initform 0)
   (terminals
    :reader terminals
    :initarg :terminals
    :type (cl:vector core_communication_msgs-msg:BeckhoffTerminalDescription)
   :initform (cl:make-array 0 :element-type 'core_communication_msgs-msg:BeckhoffTerminalDescription :initial-element (cl:make-instance 'core_communication_msgs-msg:BeckhoffTerminalDescription))))
)

(cl:defclass BeckhoffDevices-response (<BeckhoffDevices-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BeckhoffDevices-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BeckhoffDevices-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<BeckhoffDevices-response> is deprecated: use core_communication_srvs-srv:BeckhoffDevices-response instead.")))

(cl:ensure-generic-function 'numTerminals-val :lambda-list '(m))
(cl:defmethod numTerminals-val ((m <BeckhoffDevices-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:numTerminals-val is deprecated.  Use core_communication_srvs-srv:numTerminals instead.")
  (numTerminals m))

(cl:ensure-generic-function 'terminals-val :lambda-list '(m))
(cl:defmethod terminals-val ((m <BeckhoffDevices-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:terminals-val is deprecated.  Use core_communication_srvs-srv:terminals instead.")
  (terminals m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BeckhoffDevices-response>) ostream)
  "Serializes a message object of type '<BeckhoffDevices-response>"
  (cl:let* ((signed (cl:slot-value msg 'numTerminals)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'terminals))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'terminals))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BeckhoffDevices-response>) istream)
  "Deserializes a message object of type '<BeckhoffDevices-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'numTerminals) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'terminals) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'terminals)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'core_communication_msgs-msg:BeckhoffTerminalDescription))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BeckhoffDevices-response>)))
  "Returns string type for a service object of type '<BeckhoffDevices-response>"
  "core_communication_srvs/BeckhoffDevicesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BeckhoffDevices-response)))
  "Returns string type for a service object of type 'BeckhoffDevices-response"
  "core_communication_srvs/BeckhoffDevicesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BeckhoffDevices-response>)))
  "Returns md5sum for a message object of type '<BeckhoffDevices-response>"
  "830b2a5efe896b0f1c78a87d9bd2d0af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BeckhoffDevices-response)))
  "Returns md5sum for a message object of type 'BeckhoffDevices-response"
  "830b2a5efe896b0f1c78a87d9bd2d0af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BeckhoffDevices-response>)))
  "Returns full string definition for message of type '<BeckhoffDevices-response>"
  (cl:format cl:nil "~%int32 numTerminals~%core_communication_msgs/BeckhoffTerminalDescription[] terminals~%~%~%================================================================================~%MSG: core_communication_msgs/BeckhoffTerminalDescription~%string terminal # terminal type~%uint32 position # relative position of the terminal in the EtherCAT bus (0-n)~%uint8 num_ports # number of ports on the terminal (0-n)~%BeckhoffPortDescription[] ports # port descriptions~%~%================================================================================~%MSG: core_communication_msgs/BeckhoffPortDescription~%uint8 index~%string direction # 'in','out'~%string type # 'digital';'analog'~%string data_type # 'uint8' 'uint16' 'uint32' 'uint64'~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BeckhoffDevices-response)))
  "Returns full string definition for message of type 'BeckhoffDevices-response"
  (cl:format cl:nil "~%int32 numTerminals~%core_communication_msgs/BeckhoffTerminalDescription[] terminals~%~%~%================================================================================~%MSG: core_communication_msgs/BeckhoffTerminalDescription~%string terminal # terminal type~%uint32 position # relative position of the terminal in the EtherCAT bus (0-n)~%uint8 num_ports # number of ports on the terminal (0-n)~%BeckhoffPortDescription[] ports # port descriptions~%~%================================================================================~%MSG: core_communication_msgs/BeckhoffPortDescription~%uint8 index~%string direction # 'in','out'~%string type # 'digital';'analog'~%string data_type # 'uint8' 'uint16' 'uint32' 'uint64'~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BeckhoffDevices-response>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'terminals) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BeckhoffDevices-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BeckhoffDevices-response
    (cl:cons ':numTerminals (numTerminals msg))
    (cl:cons ':terminals (terminals msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BeckhoffDevices)))
  'BeckhoffDevices-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BeckhoffDevices)))
  'BeckhoffDevices-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BeckhoffDevices)))
  "Returns string type for a service object of type '<BeckhoffDevices>"
  "core_communication_srvs/BeckhoffDevices")