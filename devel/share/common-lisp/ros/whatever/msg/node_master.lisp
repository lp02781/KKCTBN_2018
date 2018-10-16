; Auto-generated. Do not edit!


(cl:in-package whatever-msg)


;//! \htmlinclude node_master.msg.html

(cl:defclass <node_master> (roslisp-msg-protocol:ros-message)
  ((override_status
    :reader override_status
    :initarg :override_status
    :type cl:boolean
    :initform cl:nil)
   (pid_status
    :reader pid_status
    :initarg :pid_status
    :type cl:boolean
    :initform cl:nil)
   (simple_manuver
    :reader simple_manuver
    :initarg :simple_manuver
    :type cl:boolean
    :initform cl:nil)
   (simple_speed
    :reader simple_speed
    :initarg :simple_speed
    :type cl:boolean
    :initform cl:nil)
   (recorder
    :reader recorder
    :initarg :recorder
    :type cl:boolean
    :initform cl:nil)
   (player
    :reader player
    :initarg :player
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass node_master (<node_master>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <node_master>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'node_master)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name whatever-msg:<node_master> is deprecated: use whatever-msg:node_master instead.")))

(cl:ensure-generic-function 'override_status-val :lambda-list '(m))
(cl:defmethod override_status-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:override_status-val is deprecated.  Use whatever-msg:override_status instead.")
  (override_status m))

(cl:ensure-generic-function 'pid_status-val :lambda-list '(m))
(cl:defmethod pid_status-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:pid_status-val is deprecated.  Use whatever-msg:pid_status instead.")
  (pid_status m))

(cl:ensure-generic-function 'simple_manuver-val :lambda-list '(m))
(cl:defmethod simple_manuver-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:simple_manuver-val is deprecated.  Use whatever-msg:simple_manuver instead.")
  (simple_manuver m))

(cl:ensure-generic-function 'simple_speed-val :lambda-list '(m))
(cl:defmethod simple_speed-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:simple_speed-val is deprecated.  Use whatever-msg:simple_speed instead.")
  (simple_speed m))

(cl:ensure-generic-function 'recorder-val :lambda-list '(m))
(cl:defmethod recorder-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:recorder-val is deprecated.  Use whatever-msg:recorder instead.")
  (recorder m))

(cl:ensure-generic-function 'player-val :lambda-list '(m))
(cl:defmethod player-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:player-val is deprecated.  Use whatever-msg:player instead.")
  (player m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node_master>) ostream)
  "Serializes a message object of type '<node_master>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'override_status) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pid_status) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'simple_manuver) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'simple_speed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'recorder) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'player) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node_master>) istream)
  "Deserializes a message object of type '<node_master>"
    (cl:setf (cl:slot-value msg 'override_status) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'pid_status) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'simple_manuver) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'simple_speed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'recorder) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'player) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<node_master>)))
  "Returns string type for a message object of type '<node_master>"
  "whatever/node_master")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'node_master)))
  "Returns string type for a message object of type 'node_master"
  "whatever/node_master")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<node_master>)))
  "Returns md5sum for a message object of type '<node_master>"
  "e8dbc3cc1533c62f04e54d76742a542b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node_master)))
  "Returns md5sum for a message object of type 'node_master"
  "e8dbc3cc1533c62f04e54d76742a542b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node_master>)))
  "Returns full string definition for message of type '<node_master>"
  (cl:format cl:nil "bool override_status~%bool pid_status~%bool simple_manuver~%bool simple_speed~%bool recorder~%bool player~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node_master)))
  "Returns full string definition for message of type 'node_master"
  (cl:format cl:nil "bool override_status~%bool pid_status~%bool simple_manuver~%bool simple_speed~%bool recorder~%bool player~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node_master>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <node_master>))
  "Converts a ROS message object to a list"
  (cl:list 'node_master
    (cl:cons ':override_status (override_status msg))
    (cl:cons ':pid_status (pid_status msg))
    (cl:cons ':simple_manuver (simple_manuver msg))
    (cl:cons ':simple_speed (simple_speed msg))
    (cl:cons ':recorder (recorder msg))
    (cl:cons ':player (player msg))
))
