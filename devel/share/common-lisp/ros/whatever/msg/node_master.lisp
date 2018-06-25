; Auto-generated. Do not edit!


(cl:in-package whatever-msg)


;//! \htmlinclude node_master.msg.html

(cl:defclass <node_master> (roslisp-msg-protocol:ros-message)
  ((override_status
    :reader override_status
    :initarg :override_status
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
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node_master>) ostream)
  "Serializes a message object of type '<node_master>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'override_status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node_master>) istream)
  "Deserializes a message object of type '<node_master>"
    (cl:setf (cl:slot-value msg 'override_status) (cl:not (cl:zerop (cl:read-byte istream))))
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
  "4dd85ad23193e9f5e96775d4f377d490")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node_master)))
  "Returns md5sum for a message object of type 'node_master"
  "4dd85ad23193e9f5e96775d4f377d490")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node_master>)))
  "Returns full string definition for message of type '<node_master>"
  (cl:format cl:nil "bool override_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node_master)))
  "Returns full string definition for message of type 'node_master"
  (cl:format cl:nil "bool override_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node_master>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <node_master>))
  "Converts a ROS message object to a list"
  (cl:list 'node_master
    (cl:cons ':override_status (override_status msg))
))
