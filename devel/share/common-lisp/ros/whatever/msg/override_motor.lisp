; Auto-generated. Do not edit!


(cl:in-package whatever-msg)


;//! \htmlinclude override_motor.msg.html

(cl:defclass <override_motor> (roslisp-msg-protocol:ros-message)
  ((state_red
    :reader state_red
    :initarg :state_red
    :type cl:fixnum
    :initform 0)
   (state_green
    :reader state_green
    :initarg :state_green
    :type cl:fixnum
    :initform 0)
   (setpoint
    :reader setpoint
    :initarg :setpoint
    :type cl:fixnum
    :initform 0)
   (steering
    :reader steering
    :initarg :steering
    :type cl:fixnum
    :initform 0)
   (throttle
    :reader throttle
    :initarg :throttle
    :type cl:fixnum
    :initform 0)
   (header
    :reader header
    :initarg :header
    :type cl:fixnum
    :initform 0)
   (count_red
    :reader count_red
    :initarg :count_red
    :type cl:fixnum
    :initform 0)
   (count_green
    :reader count_green
    :initarg :count_green
    :type cl:fixnum
    :initform 0))
)

(cl:defclass override_motor (<override_motor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <override_motor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'override_motor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name whatever-msg:<override_motor> is deprecated: use whatever-msg:override_motor instead.")))

(cl:ensure-generic-function 'state_red-val :lambda-list '(m))
(cl:defmethod state_red-val ((m <override_motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:state_red-val is deprecated.  Use whatever-msg:state_red instead.")
  (state_red m))

(cl:ensure-generic-function 'state_green-val :lambda-list '(m))
(cl:defmethod state_green-val ((m <override_motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:state_green-val is deprecated.  Use whatever-msg:state_green instead.")
  (state_green m))

(cl:ensure-generic-function 'setpoint-val :lambda-list '(m))
(cl:defmethod setpoint-val ((m <override_motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:setpoint-val is deprecated.  Use whatever-msg:setpoint instead.")
  (setpoint m))

(cl:ensure-generic-function 'steering-val :lambda-list '(m))
(cl:defmethod steering-val ((m <override_motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:steering-val is deprecated.  Use whatever-msg:steering instead.")
  (steering m))

(cl:ensure-generic-function 'throttle-val :lambda-list '(m))
(cl:defmethod throttle-val ((m <override_motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:throttle-val is deprecated.  Use whatever-msg:throttle instead.")
  (throttle m))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <override_motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:header-val is deprecated.  Use whatever-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'count_red-val :lambda-list '(m))
(cl:defmethod count_red-val ((m <override_motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:count_red-val is deprecated.  Use whatever-msg:count_red instead.")
  (count_red m))

(cl:ensure-generic-function 'count_green-val :lambda-list '(m))
(cl:defmethod count_green-val ((m <override_motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:count_green-val is deprecated.  Use whatever-msg:count_green instead.")
  (count_green m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <override_motor>) ostream)
  "Serializes a message object of type '<override_motor>"
  (cl:let* ((signed (cl:slot-value msg 'state_red)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'state_green)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'setpoint)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'steering)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'throttle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'header)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'count_red)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'count_green)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <override_motor>) istream)
  "Deserializes a message object of type '<override_motor>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state_red) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state_green) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'setpoint) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'steering) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'throttle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'header) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count_red) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count_green) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<override_motor>)))
  "Returns string type for a message object of type '<override_motor>"
  "whatever/override_motor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'override_motor)))
  "Returns string type for a message object of type 'override_motor"
  "whatever/override_motor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<override_motor>)))
  "Returns md5sum for a message object of type '<override_motor>"
  "c61324fa2e040eda100a19f37f751190")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'override_motor)))
  "Returns md5sum for a message object of type 'override_motor"
  "c61324fa2e040eda100a19f37f751190")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<override_motor>)))
  "Returns full string definition for message of type '<override_motor>"
  (cl:format cl:nil "int16 state_red~%int16 state_green~%int16 setpoint~%int16 steering~%int16 throttle~%int16 header~%int16 count_red~%int16 count_green~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'override_motor)))
  "Returns full string definition for message of type 'override_motor"
  (cl:format cl:nil "int16 state_red~%int16 state_green~%int16 setpoint~%int16 steering~%int16 throttle~%int16 header~%int16 count_red~%int16 count_green~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <override_motor>))
  (cl:+ 0
     2
     2
     2
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <override_motor>))
  "Converts a ROS message object to a list"
  (cl:list 'override_motor
    (cl:cons ':state_red (state_red msg))
    (cl:cons ':state_green (state_green msg))
    (cl:cons ':setpoint (setpoint msg))
    (cl:cons ':steering (steering msg))
    (cl:cons ':throttle (throttle msg))
    (cl:cons ':header (header msg))
    (cl:cons ':count_red (count_red msg))
    (cl:cons ':count_green (count_green msg))
))
