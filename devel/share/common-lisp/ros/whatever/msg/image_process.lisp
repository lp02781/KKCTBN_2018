; Auto-generated. Do not edit!


(cl:in-package whatever-msg)


;//! \htmlinclude image_process.msg.html

(cl:defclass <image_process> (roslisp-msg-protocol:ros-message)
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

(cl:defclass image_process (<image_process>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <image_process>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'image_process)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name whatever-msg:<image_process> is deprecated: use whatever-msg:image_process instead.")))

(cl:ensure-generic-function 'state_red-val :lambda-list '(m))
(cl:defmethod state_red-val ((m <image_process>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:state_red-val is deprecated.  Use whatever-msg:state_red instead.")
  (state_red m))

(cl:ensure-generic-function 'state_green-val :lambda-list '(m))
(cl:defmethod state_green-val ((m <image_process>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:state_green-val is deprecated.  Use whatever-msg:state_green instead.")
  (state_green m))

(cl:ensure-generic-function 'count_red-val :lambda-list '(m))
(cl:defmethod count_red-val ((m <image_process>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:count_red-val is deprecated.  Use whatever-msg:count_red instead.")
  (count_red m))

(cl:ensure-generic-function 'count_green-val :lambda-list '(m))
(cl:defmethod count_green-val ((m <image_process>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:count_green-val is deprecated.  Use whatever-msg:count_green instead.")
  (count_green m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <image_process>) ostream)
  "Serializes a message object of type '<image_process>"
  (cl:let* ((signed (cl:slot-value msg 'state_red)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'state_green)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <image_process>) istream)
  "Deserializes a message object of type '<image_process>"
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
      (cl:setf (cl:slot-value msg 'count_red) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count_green) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<image_process>)))
  "Returns string type for a message object of type '<image_process>"
  "whatever/image_process")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'image_process)))
  "Returns string type for a message object of type 'image_process"
  "whatever/image_process")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<image_process>)))
  "Returns md5sum for a message object of type '<image_process>"
  "e5e1c278fbb5698de32e1d5d47db51b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'image_process)))
  "Returns md5sum for a message object of type 'image_process"
  "e5e1c278fbb5698de32e1d5d47db51b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<image_process>)))
  "Returns full string definition for message of type '<image_process>"
  (cl:format cl:nil "int16 state_red~%int16 state_green~%int16 count_red~%int16 count_green~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'image_process)))
  "Returns full string definition for message of type 'image_process"
  (cl:format cl:nil "int16 state_red~%int16 state_green~%int16 count_red~%int16 count_green~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <image_process>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <image_process>))
  "Converts a ROS message object to a list"
  (cl:list 'image_process
    (cl:cons ':state_red (state_red msg))
    (cl:cons ':state_green (state_green msg))
    (cl:cons ':count_red (count_red msg))
    (cl:cons ':count_green (count_green msg))
))
