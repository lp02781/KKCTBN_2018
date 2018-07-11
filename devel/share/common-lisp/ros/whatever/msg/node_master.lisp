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
   (record_manuver
    :reader record_manuver
    :initarg :record_manuver
    :type cl:boolean
    :initform cl:nil)
   (record_speed
    :reader record_speed
    :initarg :record_speed
    :type cl:boolean
    :initform cl:nil)
   (path_manuver
    :reader path_manuver
    :initarg :path_manuver
    :type cl:boolean
    :initform cl:nil)
   (path_speed
    :reader path_speed
    :initarg :path_speed
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

(cl:ensure-generic-function 'record_manuver-val :lambda-list '(m))
(cl:defmethod record_manuver-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:record_manuver-val is deprecated.  Use whatever-msg:record_manuver instead.")
  (record_manuver m))

(cl:ensure-generic-function 'record_speed-val :lambda-list '(m))
(cl:defmethod record_speed-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:record_speed-val is deprecated.  Use whatever-msg:record_speed instead.")
  (record_speed m))

(cl:ensure-generic-function 'path_manuver-val :lambda-list '(m))
(cl:defmethod path_manuver-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:path_manuver-val is deprecated.  Use whatever-msg:path_manuver instead.")
  (path_manuver m))

(cl:ensure-generic-function 'path_speed-val :lambda-list '(m))
(cl:defmethod path_speed-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:path_speed-val is deprecated.  Use whatever-msg:path_speed instead.")
  (path_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node_master>) ostream)
  "Serializes a message object of type '<node_master>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'override_status) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pid_status) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'simple_manuver) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'simple_speed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'record_manuver) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'record_speed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'path_manuver) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'path_speed) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node_master>) istream)
  "Deserializes a message object of type '<node_master>"
    (cl:setf (cl:slot-value msg 'override_status) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'pid_status) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'simple_manuver) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'simple_speed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'record_manuver) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'record_speed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'path_manuver) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'path_speed) (cl:not (cl:zerop (cl:read-byte istream))))
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
  "9783f29d89cc75e92f81094e627988e9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node_master)))
  "Returns md5sum for a message object of type 'node_master"
  "9783f29d89cc75e92f81094e627988e9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node_master>)))
  "Returns full string definition for message of type '<node_master>"
  (cl:format cl:nil "bool override_status~%bool pid_status~%bool simple_manuver~%bool simple_speed~%bool record_manuver~%bool record_speed~%bool path_manuver~%bool path_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node_master)))
  "Returns full string definition for message of type 'node_master"
  (cl:format cl:nil "bool override_status~%bool pid_status~%bool simple_manuver~%bool simple_speed~%bool record_manuver~%bool record_speed~%bool path_manuver~%bool path_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node_master>))
  (cl:+ 0
     1
     1
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
    (cl:cons ':record_manuver (record_manuver msg))
    (cl:cons ':record_speed (record_speed msg))
    (cl:cons ':path_manuver (path_manuver msg))
    (cl:cons ':path_speed (path_speed msg))
))
