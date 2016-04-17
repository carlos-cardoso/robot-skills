; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude Parameter.msg.html

(cl:defclass <Parameter> (roslisp-msg-protocol:ros-message)
  ((parameterId
    :reader parameterId
    :initarg :parameterId
    :type cl:integer
    :initform 0)
   (collectionId
    :reader collectionId
    :initarg :collectionId
    :type cl:integer
    :initform 0)
   (parameterDescription
    :reader parameterDescription
    :initarg :parameterDescription
    :type cl:string
    :initform "")
   (collectionDescription
    :reader collectionDescription
    :initarg :collectionDescription
    :type cl:string
    :initform "")
   (parentClass
    :reader parentClass
    :initarg :parentClass
    :type cl:string
    :initform "")
   (editable
    :reader editable
    :initarg :editable
    :type cl:boolean
    :initform cl:nil)
   (type
    :reader type
    :initarg :type
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:string
    :initform ""))
)

(cl:defclass Parameter (<Parameter>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Parameter>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Parameter)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<Parameter> is deprecated: use core_communication_msgs-msg:Parameter instead.")))

(cl:ensure-generic-function 'parameterId-val :lambda-list '(m))
(cl:defmethod parameterId-val ((m <Parameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:parameterId-val is deprecated.  Use core_communication_msgs-msg:parameterId instead.")
  (parameterId m))

(cl:ensure-generic-function 'collectionId-val :lambda-list '(m))
(cl:defmethod collectionId-val ((m <Parameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:collectionId-val is deprecated.  Use core_communication_msgs-msg:collectionId instead.")
  (collectionId m))

(cl:ensure-generic-function 'parameterDescription-val :lambda-list '(m))
(cl:defmethod parameterDescription-val ((m <Parameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:parameterDescription-val is deprecated.  Use core_communication_msgs-msg:parameterDescription instead.")
  (parameterDescription m))

(cl:ensure-generic-function 'collectionDescription-val :lambda-list '(m))
(cl:defmethod collectionDescription-val ((m <Parameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:collectionDescription-val is deprecated.  Use core_communication_msgs-msg:collectionDescription instead.")
  (collectionDescription m))

(cl:ensure-generic-function 'parentClass-val :lambda-list '(m))
(cl:defmethod parentClass-val ((m <Parameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:parentClass-val is deprecated.  Use core_communication_msgs-msg:parentClass instead.")
  (parentClass m))

(cl:ensure-generic-function 'editable-val :lambda-list '(m))
(cl:defmethod editable-val ((m <Parameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:editable-val is deprecated.  Use core_communication_msgs-msg:editable instead.")
  (editable m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Parameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:type-val is deprecated.  Use core_communication_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <Parameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:value-val is deprecated.  Use core_communication_msgs-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Parameter>) ostream)
  "Serializes a message object of type '<Parameter>"
  (cl:let* ((signed (cl:slot-value msg 'parameterId)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'collectionId)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'parameterDescription))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'parameterDescription))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'collectionDescription))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'collectionDescription))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'parentClass))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'parentClass))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'editable) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Parameter>) istream)
  "Deserializes a message object of type '<Parameter>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'parameterId) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'collectionId) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'parameterDescription) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'parameterDescription) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'collectionDescription) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'collectionDescription) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'parentClass) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'parentClass) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'editable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'value) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Parameter>)))
  "Returns string type for a message object of type '<Parameter>"
  "core_communication_msgs/Parameter")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Parameter)))
  "Returns string type for a message object of type 'Parameter"
  "core_communication_msgs/Parameter")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Parameter>)))
  "Returns md5sum for a message object of type '<Parameter>"
  "016b74fca8a90b8cadf93520158750d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Parameter)))
  "Returns md5sum for a message object of type 'Parameter"
  "016b74fca8a90b8cadf93520158750d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Parameter>)))
  "Returns full string definition for message of type '<Parameter>"
  (cl:format cl:nil "int32 parameterId~%int32 collectionId~%string parameterDescription~%string collectionDescription~%string parentClass~%bool editable~%string type~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Parameter)))
  "Returns full string definition for message of type 'Parameter"
  (cl:format cl:nil "int32 parameterId~%int32 collectionId~%string parameterDescription~%string collectionDescription~%string parentClass~%bool editable~%string type~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Parameter>))
  (cl:+ 0
     4
     4
     4 (cl:length (cl:slot-value msg 'parameterDescription))
     4 (cl:length (cl:slot-value msg 'collectionDescription))
     4 (cl:length (cl:slot-value msg 'parentClass))
     1
     4 (cl:length (cl:slot-value msg 'type))
     4 (cl:length (cl:slot-value msg 'value))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Parameter>))
  "Converts a ROS message object to a list"
  (cl:list 'Parameter
    (cl:cons ':parameterId (parameterId msg))
    (cl:cons ':collectionId (collectionId msg))
    (cl:cons ':parameterDescription (parameterDescription msg))
    (cl:cons ':collectionDescription (collectionDescription msg))
    (cl:cons ':parentClass (parentClass msg))
    (cl:cons ':editable (editable msg))
    (cl:cons ':type (type msg))
    (cl:cons ':value (value msg))
))
