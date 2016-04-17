; Auto-generated. Do not edit!


(cl:in-package core_communication_srvs-srv)


;//! \htmlinclude PickUpPose-request.msg.html

(cl:defclass <PickUpPose-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass PickUpPose-request (<PickUpPose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PickUpPose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PickUpPose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<PickUpPose-request> is deprecated: use core_communication_srvs-srv:PickUpPose-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PickUpPose-request>) ostream)
  "Serializes a message object of type '<PickUpPose-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PickUpPose-request>) istream)
  "Deserializes a message object of type '<PickUpPose-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PickUpPose-request>)))
  "Returns string type for a service object of type '<PickUpPose-request>"
  "core_communication_srvs/PickUpPoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickUpPose-request)))
  "Returns string type for a service object of type 'PickUpPose-request"
  "core_communication_srvs/PickUpPoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PickUpPose-request>)))
  "Returns md5sum for a message object of type '<PickUpPose-request>"
  "7eb78993106bbc56ce51866c24210bdf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PickUpPose-request)))
  "Returns md5sum for a message object of type 'PickUpPose-request"
  "7eb78993106bbc56ce51866c24210bdf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PickUpPose-request>)))
  "Returns full string definition for message of type '<PickUpPose-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PickUpPose-request)))
  "Returns full string definition for message of type 'PickUpPose-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PickUpPose-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PickUpPose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PickUpPose-request
))
;//! \htmlinclude PickUpPose-response.msg.html

(cl:defclass <PickUpPose-response> (roslisp-msg-protocol:ros-message)
  ((pickUpPose
    :reader pickUpPose
    :initarg :pickUpPose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass PickUpPose-response (<PickUpPose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PickUpPose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PickUpPose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_srvs-srv:<PickUpPose-response> is deprecated: use core_communication_srvs-srv:PickUpPose-response instead.")))

(cl:ensure-generic-function 'pickUpPose-val :lambda-list '(m))
(cl:defmethod pickUpPose-val ((m <PickUpPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_srvs-srv:pickUpPose-val is deprecated.  Use core_communication_srvs-srv:pickUpPose instead.")
  (pickUpPose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PickUpPose-response>) ostream)
  "Serializes a message object of type '<PickUpPose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pickUpPose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PickUpPose-response>) istream)
  "Deserializes a message object of type '<PickUpPose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pickUpPose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PickUpPose-response>)))
  "Returns string type for a service object of type '<PickUpPose-response>"
  "core_communication_srvs/PickUpPoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickUpPose-response)))
  "Returns string type for a service object of type 'PickUpPose-response"
  "core_communication_srvs/PickUpPoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PickUpPose-response>)))
  "Returns md5sum for a message object of type '<PickUpPose-response>"
  "7eb78993106bbc56ce51866c24210bdf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PickUpPose-response)))
  "Returns md5sum for a message object of type 'PickUpPose-response"
  "7eb78993106bbc56ce51866c24210bdf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PickUpPose-response>)))
  "Returns full string definition for message of type '<PickUpPose-response>"
  (cl:format cl:nil "~%geometry_msgs/Pose pickUpPose~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PickUpPose-response)))
  "Returns full string definition for message of type 'PickUpPose-response"
  (cl:format cl:nil "~%geometry_msgs/Pose pickUpPose~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PickUpPose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pickUpPose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PickUpPose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PickUpPose-response
    (cl:cons ':pickUpPose (pickUpPose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PickUpPose)))
  'PickUpPose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PickUpPose)))
  'PickUpPose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickUpPose)))
  "Returns string type for a service object of type '<PickUpPose>"
  "core_communication_srvs/PickUpPose")