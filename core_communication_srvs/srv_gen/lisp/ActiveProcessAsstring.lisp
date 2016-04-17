; Auto-generated. Do not edit!


(cl:in-package core_communication_srvs-srv)


;//! \htmlinclude ActiveProcessAsstring-request.msg.html

(cl:defclass <ActiveProcessAsstring-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ActiveProcessAsstring-request (<ActiveProcessAsstring-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActiveProcessAsstring-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActiveProcessAsstring-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<ActiveProcessAsstring-request> is deprecated: use core_communication_srvs-srv:ActiveProcessAsstring-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActiveProcessAsstring-request>) ostream)
  "Serializes a message object of type '<ActiveProcessAsstring-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActiveProcessAsstring-request>) istream)
  "Deserializes a message object of type '<ActiveProcessAsstring-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActiveProcessAsstring-request>)))
  "Returns string type for a service object of type '<ActiveProcessAsstring-request>"
  "core_communication_srvs/ActiveProcessAsstringRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActiveProcessAsstring-request)))
  "Returns string type for a service object of type 'ActiveProcessAsstring-request"
  "core_communication_srvs/ActiveProcessAsstringRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActiveProcessAsstring-request>)))
  "Returns md5sum for a message object of type '<ActiveProcessAsstring-request>"
  "3e94415c89a949942dd081b366fb1fbc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActiveProcessAsstring-request)))
  "Returns md5sum for a message object of type 'ActiveProcessAsstring-request"
  "3e94415c89a949942dd081b366fb1fbc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActiveProcessAsstring-request>)))
  "Returns full string definition for message of type '<ActiveProcessAsstring-request>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActiveProcessAsstring-request)))
  "Returns full string definition for message of type 'ActiveProcessAsstring-request"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActiveProcessAsstring-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActiveProcessAsstring-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ActiveProcessAsstring-request
))
;//! \htmlinclude ActiveProcessAsstring-response.msg.html

(cl:defclass <ActiveProcessAsstring-response> (roslisp-msg-protocol:ros-message)
  ((process
    :reader process
    :initarg :process
    :type cl:string
    :initform "")
   (activeId
    :reader activeId
    :initarg :activeId
    :type cl:integer
    :initform 0)
   (repeat
    :reader repeat
    :initarg :repeat
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ActiveProcessAsstring-response (<ActiveProcessAsstring-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActiveProcessAsstring-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActiveProcessAsstring-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<ActiveProcessAsstring-response> is deprecated: use core_communication_srvs-srv:ActiveProcessAsstring-response instead.")))

(cl:ensure-generic-function 'process-val :lambda-list '(m))
(cl:defmethod process-val ((m <ActiveProcessAsstring-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:process-val is deprecated.  Use core_communication_srvs-srv:process instead.")
  (process m))

(cl:ensure-generic-function 'activeId-val :lambda-list '(m))
(cl:defmethod activeId-val ((m <ActiveProcessAsstring-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:activeId-val is deprecated.  Use core_communication_srvs-srv:activeId instead.")
  (activeId m))

(cl:ensure-generic-function 'repeat-val :lambda-list '(m))
(cl:defmethod repeat-val ((m <ActiveProcessAsstring-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:repeat-val is deprecated.  Use core_communication_srvs-srv:repeat instead.")
  (repeat m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActiveProcessAsstring-response>) ostream)
  "Serializes a message object of type '<ActiveProcessAsstring-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'process))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'process))
  (cl:let* ((signed (cl:slot-value msg 'activeId)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'repeat) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActiveProcessAsstring-response>) istream)
  "Deserializes a message object of type '<ActiveProcessAsstring-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'process) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'process) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'activeId) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'repeat) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActiveProcessAsstring-response>)))
  "Returns string type for a service object of type '<ActiveProcessAsstring-response>"
  "core_communication_srvs/ActiveProcessAsstringResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActiveProcessAsstring-response)))
  "Returns string type for a service object of type 'ActiveProcessAsstring-response"
  "core_communication_srvs/ActiveProcessAsstringResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActiveProcessAsstring-response>)))
  "Returns md5sum for a message object of type '<ActiveProcessAsstring-response>"
  "3e94415c89a949942dd081b366fb1fbc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActiveProcessAsstring-response)))
  "Returns md5sum for a message object of type 'ActiveProcessAsstring-response"
  "3e94415c89a949942dd081b366fb1fbc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActiveProcessAsstring-response>)))
  "Returns full string definition for message of type '<ActiveProcessAsstring-response>"
  (cl:format cl:nil "~%string process~%int32 activeId~%bool repeat~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActiveProcessAsstring-response)))
  "Returns full string definition for message of type 'ActiveProcessAsstring-response"
  (cl:format cl:nil "~%string process~%int32 activeId~%bool repeat~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActiveProcessAsstring-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'process))
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActiveProcessAsstring-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ActiveProcessAsstring-response
    (cl:cons ':process (process msg))
    (cl:cons ':activeId (activeId msg))
    (cl:cons ':repeat (repeat msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ActiveProcessAsstring)))
  'ActiveProcessAsstring-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ActiveProcessAsstring)))
  'ActiveProcessAsstring-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActiveProcessAsstring)))
  "Returns string type for a service object of type '<ActiveProcessAsstring>"
  "core_communication_srvs/ActiveProcessAsstring")