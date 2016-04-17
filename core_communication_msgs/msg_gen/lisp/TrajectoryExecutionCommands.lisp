; Auto-generated. Do not edit!


(cl:in-package core_communication_msgs-msg)


;//! \htmlinclude TrajectoryExecutionCommands.msg.html

(cl:defclass <TrajectoryExecutionCommands> (roslisp-msg-protocol:ros-message)
  ((startTrajectory
    :reader startTrajectory
    :initarg :startTrajectory
    :type cl:boolean
    :initform cl:nil)
   (stopTrajectory
    :reader stopTrajectory
    :initarg :stopTrajectory
    :type cl:boolean
    :initform cl:nil)
   (finishTrajectory
    :reader finishTrajectory
    :initarg :finishTrajectory
    :type cl:boolean
    :initform cl:nil)
   (pauseTrajectory
    :reader pauseTrajectory
    :initarg :pauseTrajectory
    :type cl:boolean
    :initform cl:nil)
   (resumeTrajectory
    :reader resumeTrajectory
    :initarg :resumeTrajectory
    :type cl:boolean
    :initform cl:nil)
   (clearTrajectory
    :reader clearTrajectory
    :initarg :clearTrajectory
    :type cl:boolean
    :initform cl:nil)
   (finishGripperAction
    :reader finishGripperAction
    :initarg :finishGripperAction
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TrajectoryExecutionCommands (<TrajectoryExecutionCommands>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectoryExecutionCommands>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectoryExecutionCommands)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_communication_msgs-msg:<TrajectoryExecutionCommands> is deprecated: use core_communication_msgs-msg:TrajectoryExecutionCommands instead.")))

(cl:ensure-generic-function 'startTrajectory-val :lambda-list '(m))
(cl:defmethod startTrajectory-val ((m <TrajectoryExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:startTrajectory-val is deprecated.  Use core_communication_msgs-msg:startTrajectory instead.")
  (startTrajectory m))

(cl:ensure-generic-function 'stopTrajectory-val :lambda-list '(m))
(cl:defmethod stopTrajectory-val ((m <TrajectoryExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:stopTrajectory-val is deprecated.  Use core_communication_msgs-msg:stopTrajectory instead.")
  (stopTrajectory m))

(cl:ensure-generic-function 'finishTrajectory-val :lambda-list '(m))
(cl:defmethod finishTrajectory-val ((m <TrajectoryExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:finishTrajectory-val is deprecated.  Use core_communication_msgs-msg:finishTrajectory instead.")
  (finishTrajectory m))

(cl:ensure-generic-function 'pauseTrajectory-val :lambda-list '(m))
(cl:defmethod pauseTrajectory-val ((m <TrajectoryExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:pauseTrajectory-val is deprecated.  Use core_communication_msgs-msg:pauseTrajectory instead.")
  (pauseTrajectory m))

(cl:ensure-generic-function 'resumeTrajectory-val :lambda-list '(m))
(cl:defmethod resumeTrajectory-val ((m <TrajectoryExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:resumeTrajectory-val is deprecated.  Use core_communication_msgs-msg:resumeTrajectory instead.")
  (resumeTrajectory m))

(cl:ensure-generic-function 'clearTrajectory-val :lambda-list '(m))
(cl:defmethod clearTrajectory-val ((m <TrajectoryExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:clearTrajectory-val is deprecated.  Use core_communication_msgs-msg:clearTrajectory instead.")
  (clearTrajectory m))

(cl:ensure-generic-function 'finishGripperAction-val :lambda-list '(m))
(cl:defmethod finishGripperAction-val ((m <TrajectoryExecutionCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_communication_msgs-msg:finishGripperAction-val is deprecated.  Use core_communication_msgs-msg:finishGripperAction instead.")
  (finishGripperAction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectoryExecutionCommands>) ostream)
  "Serializes a message object of type '<TrajectoryExecutionCommands>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'startTrajectory) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'stopTrajectory) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finishTrajectory) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pauseTrajectory) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'resumeTrajectory) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'clearTrajectory) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finishGripperAction) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectoryExecutionCommands>) istream)
  "Deserializes a message object of type '<TrajectoryExecutionCommands>"
    (cl:setf (cl:slot-value msg 'startTrajectory) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'stopTrajectory) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'finishTrajectory) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'pauseTrajectory) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'resumeTrajectory) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'clearTrajectory) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'finishGripperAction) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectoryExecutionCommands>)))
  "Returns string type for a message object of type '<TrajectoryExecutionCommands>"
  "core_communication_msgs/TrajectoryExecutionCommands")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryExecutionCommands)))
  "Returns string type for a message object of type 'TrajectoryExecutionCommands"
  "core_communication_msgs/TrajectoryExecutionCommands")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectoryExecutionCommands>)))
  "Returns md5sum for a message object of type '<TrajectoryExecutionCommands>"
  "2b55c94def99dd4364b97dc409a619b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryExecutionCommands)))
  "Returns md5sum for a message object of type 'TrajectoryExecutionCommands"
  "2b55c94def99dd4364b97dc409a619b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryExecutionCommands>)))
  "Returns full string definition for message of type '<TrajectoryExecutionCommands>"
  (cl:format cl:nil "bool startTrajectory~%bool stopTrajectory~%bool finishTrajectory~%bool pauseTrajectory~%bool resumeTrajectory~%bool clearTrajectory~%bool finishGripperAction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryExecutionCommands)))
  "Returns full string definition for message of type 'TrajectoryExecutionCommands"
  (cl:format cl:nil "bool startTrajectory~%bool stopTrajectory~%bool finishTrajectory~%bool pauseTrajectory~%bool resumeTrajectory~%bool clearTrajectory~%bool finishGripperAction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryExecutionCommands>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryExecutionCommands>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryExecutionCommands
    (cl:cons ':startTrajectory (startTrajectory msg))
    (cl:cons ':stopTrajectory (stopTrajectory msg))
    (cl:cons ':finishTrajectory (finishTrajectory msg))
    (cl:cons ':pauseTrajectory (pauseTrajectory msg))
    (cl:cons ':resumeTrajectory (resumeTrajectory msg))
    (cl:cons ':clearTrajectory (clearTrajectory msg))
    (cl:cons ':finishGripperAction (finishGripperAction msg))
))
