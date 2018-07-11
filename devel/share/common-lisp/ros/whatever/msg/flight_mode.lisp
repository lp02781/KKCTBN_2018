; Auto-generated. Do not edit!


(cl:in-package whatever-msg)


;//! \htmlinclude flight_mode.msg.html

(cl:defclass <flight_mode> (roslisp-msg-protocol:ros-message)
  ((flight_mode
    :reader flight_mode
    :initarg :flight_mode
    :type cl:string
    :initform ""))
)

(cl:defclass flight_mode (<flight_mode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <flight_mode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'flight_mode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name whatever-msg:<flight_mode> is deprecated: use whatever-msg:flight_mode instead.")))

(cl:ensure-generic-function 'flight_mode-val :lambda-list '(m))
(cl:defmethod flight_mode-val ((m <flight_mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whatever-msg:flight_mode-val is deprecated.  Use whatever-msg:flight_mode instead.")
  (flight_mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <flight_mode>) ostream)
  "Serializes a message object of type '<flight_mode>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'flight_mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'flight_mode))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <flight_mode>) istream)
  "Deserializes a message object of type '<flight_mode>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<flight_mode>)))
  "Returns string type for a message object of type '<flight_mode>"
  "whatever/flight_mode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'flight_mode)))
  "Returns string type for a message object of type 'flight_mode"
  "whatever/flight_mode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<flight_mode>)))
  "Returns md5sum for a message object of type '<flight_mode>"
  "0ec7751446dccbf592ba3e57dd292976")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'flight_mode)))
  "Returns md5sum for a message object of type 'flight_mode"
  "0ec7751446dccbf592ba3e57dd292976")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<flight_mode>)))
  "Returns full string definition for message of type '<flight_mode>"
  (cl:format cl:nil "string flight_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'flight_mode)))
  "Returns full string definition for message of type 'flight_mode"
  (cl:format cl:nil "string flight_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <flight_mode>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'flight_mode))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <flight_mode>))
  "Converts a ROS message object to a list"
  (cl:list 'flight_mode
    (cl:cons ':flight_mode (flight_mode msg))
))
