; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude BioRobJointTrajectoryPoint.msg.html

(cl:defclass <BioRobJointTrajectoryPoint> (roslisp-msg-protocol:ros-message)
  ((trajectoryPoint
    :reader trajectoryPoint
    :initarg :trajectoryPoint
    :type trajectory_msgs-msg:JointTrajectoryPoint
    :initform (cl:make-instance 'trajectory_msgs-msg:JointTrajectoryPoint))
   (gripperAction
    :reader gripperAction
    :initarg :gripperAction
    :type core_communication_msgs-msg:GripperAction
    :initform (cl:make-instance 'core_communication_msgs-msg:GripperAction))
   (reachingAccuracyCart
    :reader reachingAccuracyCart
    :initarg :reachingAccuracyCart
    :type cl:float
    :initform 0.0)
   (reachingAccuracyOrient
    :reader reachingAccuracyOrient
    :initarg :reachingAccuracyOrient
    :type cl:float
    :initform 0.0)
   (reachingAccuracyJoint
    :reader reachingAccuracyJoint
    :initarg :reachingAccuracyJoint
    :type cl:float
    :initform 0.0)
   (controlLoopRatio
    :reader controlLoopRatio
    :initarg :controlLoopRatio
    :type cl:float
    :initform 0.0))
)

(cl:defclass BioRobJointTrajectoryPoint (<BioRobJointTrajectoryPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BioRobJointTrajectoryPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BioRobJointTrajectoryPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<BioRobJointTrajectoryPoint> is deprecated: use core_communication_msgs-msg:BioRobJointTrajectoryPoint instead.")))

(cl:ensure-generic-function 'trajectoryPoint-val :lambda-list '(m))
(cl:defmethod trajectoryPoint-val ((m <BioRobJointTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:trajectoryPoint-val is deprecated.  Use core_communication_msgs-msg:trajectoryPoint instead.")
  (trajectoryPoint m))

(cl:ensure-generic-function 'gripperAction-val :lambda-list '(m))
(cl:defmethod gripperAction-val ((m <BioRobJointTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:gripperAction-val is deprecated.  Use core_communication_msgs-msg:gripperAction instead.")
  (gripperAction m))

(cl:ensure-generic-function 'reachingAccuracyCart-val :lambda-list '(m))
(cl:defmethod reachingAccuracyCart-val ((m <BioRobJointTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:reachingAccuracyCart-val is deprecated.  Use core_communication_msgs-msg:reachingAccuracyCart instead.")
  (reachingAccuracyCart m))

(cl:ensure-generic-function 'reachingAccuracyOrient-val :lambda-list '(m))
(cl:defmethod reachingAccuracyOrient-val ((m <BioRobJointTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:reachingAccuracyOrient-val is deprecated.  Use core_communication_msgs-msg:reachingAccuracyOrient instead.")
  (reachingAccuracyOrient m))

(cl:ensure-generic-function 'reachingAccuracyJoint-val :lambda-list '(m))
(cl:defmethod reachingAccuracyJoint-val ((m <BioRobJointTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:reachingAccuracyJoint-val is deprecated.  Use core_communication_msgs-msg:reachingAccuracyJoint instead.")
  (reachingAccuracyJoint m))

(cl:ensure-generic-function 'controlLoopRatio-val :lambda-list '(m))
(cl:defmethod controlLoopRatio-val ((m <BioRobJointTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:controlLoopRatio-val is deprecated.  Use core_communication_msgs-msg:controlLoopRatio instead.")
  (controlLoopRatio m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BioRobJointTrajectoryPoint>) ostream)
  "Serializes a message object of type '<BioRobJointTrajectoryPoint>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trajectoryPoint) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gripperAction) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'reachingAccuracyCart))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'reachingAccuracyOrient))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'reachingAccuracyJoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'controlLoopRatio))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BioRobJointTrajectoryPoint>) istream)
  "Deserializes a message object of type '<BioRobJointTrajectoryPoint>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trajectoryPoint) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gripperAction) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'reachingAccuracyCart) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'reachingAccuracyOrient) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'reachingAccuracyJoint) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'controlLoopRatio) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BioRobJointTrajectoryPoint>)))
  "Returns string type for a message object of type '<BioRobJointTrajectoryPoint>"
  "core_communication_msgs/BioRobJointTrajectoryPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BioRobJointTrajectoryPoint)))
  "Returns string type for a message object of type 'BioRobJointTrajectoryPoint"
  "core_communication_msgs/BioRobJointTrajectoryPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BioRobJointTrajectoryPoint>)))
  "Returns md5sum for a message object of type '<BioRobJointTrajectoryPoint>"
  "98a8e34183deadfd954fa698cebd99d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BioRobJointTrajectoryPoint)))
  "Returns md5sum for a message object of type 'BioRobJointTrajectoryPoint"
  "98a8e34183deadfd954fa698cebd99d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BioRobJointTrajectoryPoint>)))
  "Returns full string definition for message of type '<BioRobJointTrajectoryPoint>"
  (cl:format cl:nil "trajectory_msgs/JointTrajectoryPoint trajectoryPoint~%GripperAction gripperAction~%float64 reachingAccuracyCart~%float64 reachingAccuracyOrient~%float64 reachingAccuracyJoint~%float64 controlLoopRatio~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%float64[] positions~%float64[] velocities~%float64[] accelerations~%duration time_from_start~%================================================================================~%MSG: core_communication_msgs/GripperAction~%float64 absolutePosition~%bool absPosIsSet~%bool closeGripper~%float64 noMovementTimeout~%bool openGripper~%bool useCustomNoMovementTimeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BioRobJointTrajectoryPoint)))
  "Returns full string definition for message of type 'BioRobJointTrajectoryPoint"
  (cl:format cl:nil "trajectory_msgs/JointTrajectoryPoint trajectoryPoint~%GripperAction gripperAction~%float64 reachingAccuracyCart~%float64 reachingAccuracyOrient~%float64 reachingAccuracyJoint~%float64 controlLoopRatio~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%float64[] positions~%float64[] velocities~%float64[] accelerations~%duration time_from_start~%================================================================================~%MSG: core_communication_msgs/GripperAction~%float64 absolutePosition~%bool absPosIsSet~%bool closeGripper~%float64 noMovementTimeout~%bool openGripper~%bool useCustomNoMovementTimeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BioRobJointTrajectoryPoint>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trajectoryPoint))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gripperAction))
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BioRobJointTrajectoryPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'BioRobJointTrajectoryPoint
    (cl:cons ':trajectoryPoint (trajectoryPoint msg))
    (cl:cons ':gripperAction (gripperAction msg))
    (cl:cons ':reachingAccuracyCart (reachingAccuracyCart msg))
    (cl:cons ':reachingAccuracyOrient (reachingAccuracyOrient msg))
    (cl:cons ':reachingAccuracyJoint (reachingAccuracyJoint msg))
    (cl:cons ':controlLoopRatio (controlLoopRatio msg))
))
