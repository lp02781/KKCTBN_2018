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
   (rc_number
    :reader rc_number
    :initarg :rc_number
    :type cl:fixnum
    :initform 0)
   (flight_mode
    :reader flight_mode
    :initarg :flight_mode
    :type cl:string
    :initform ""))
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

(cl:ensure-generic-function 'rc_number-val :lambda-list '(m))
(cl:defmethod rc_number-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:rc_number-val is deprecated.  Use whatever-msg:rc_number instead.")
  (rc_number m))

(cl:ensure-generic-function 'flight_mode-val :lambda-list '(m))
(cl:defmethod flight_mode-val ((m <node_master>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:flight_mode-val is deprecated.  Use whatever-msg:flight_mode instead.")
  (flight_mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node_master>) ostream)
  "Serializes a message object of type '<node_master>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'override_status) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pid_status) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'rc_number)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'flight_mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'flight_mode))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node_master>) istream)
  "Deserializes a message object of type '<node_master>"
    (cl:setf (cl:slot-value msg 'override_status) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'pid_status) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rc_number) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'flight_mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'flight_mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  "3f3657994b0c8ed8f1919100c99067da")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node_master)))
  "Returns md5sum for a message object of type 'node_master"
  "3f3657994b0c8ed8f1919100c99067da")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node_master>)))
  "Returns full string definition for message of type '<node_master>"
  (cl:format cl:nil "bool override_status~%bool pid_status~%int16 rc_number~%string flight_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node_master)))
  "Returns full string definition for message of type 'node_master"
  (cl:format cl:nil "bool override_status~%bool pid_status~%int16 rc_number~%string flight_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node_master>))
  (cl:+ 0
     1
     1
     2
     4 (cl:length (cl:slot-value msg 'flight_mode))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <node_master>))
  "Converts a ROS message object to a list"
  (cl:list 'node_master
    (cl:cons ':override_status (override_status msg))
    (cl:cons ':pid_status (pid_status msg))
    (cl:cons ':rc_number (rc_number msg))
    (cl:cons ':flight_mode (flight_mode msg))
))
