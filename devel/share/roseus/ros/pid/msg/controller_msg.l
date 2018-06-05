;; Auto-generated. Do not edit!


(when (boundp 'pid::controller_msg)
  (if (not (find-package "PID"))
    (make-package "PID"))
  (shadow 'controller_msg (find-package "PID")))
(unless (find-package "PID::CONTROLLER_MSG")
  (make-package "PID::CONTROLLER_MSG"))

(in-package "ROS")
;;//! \htmlinclude controller_msg.msg.html


(defclass pid::controller_msg
  :super ros::object
  :slots (_u ))

(defmethod pid::controller_msg
  (:init
   (&key
    ((:u __u) 0.0)
    )
   (send-super :init)
   (setq _u (float __u))
   self)
  (:u
   (&optional __u)
   (if __u (setq _u __u)) _u)
  (:serialization-length
   ()
   (+
    ;; float64 _u
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _u
       (sys::poke _u (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _u
     (setq _u (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pid::controller_msg :md5sum-) "988df341e727ad40b85d2b8acf9471e9")
(setf (get pid::controller_msg :datatype-) "pid/controller_msg")
(setf (get pid::controller_msg :definition-)
      "float64 u

")



(provide :pid/controller_msg "988df341e727ad40b85d2b8acf9471e9")


