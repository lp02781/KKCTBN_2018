;; Auto-generated. Do not edit!


(when (boundp 'pid::pid_const_msg)
  (if (not (find-package "PID"))
    (make-package "PID"))
  (shadow 'pid_const_msg (find-package "PID")))
(unless (find-package "PID::PID_CONST_MSG")
  (make-package "PID::PID_CONST_MSG"))

(in-package "ROS")
;;//! \htmlinclude pid_const_msg.msg.html


(defclass pid::pid_const_msg
  :super ros::object
  :slots (_p _i _d ))

(defmethod pid::pid_const_msg
  (:init
   (&key
    ((:p __p) 0.0)
    ((:i __i) 0.0)
    ((:d __d) 0.0)
    )
   (send-super :init)
   (setq _p (float __p))
   (setq _i (float __i))
   (setq _d (float __d))
   self)
  (:p
   (&optional __p)
   (if __p (setq _p __p)) _p)
  (:i
   (&optional __i)
   (if __i (setq _i __i)) _i)
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:serialization-length
   ()
   (+
    ;; float64 _p
    8
    ;; float64 _i
    8
    ;; float64 _d
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _p
       (sys::poke _p (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i
       (sys::poke _i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _d
       (sys::poke _d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _p
     (setq _p (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i
     (setq _i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _d
     (setq _d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pid::pid_const_msg :md5sum-) "4d7f5db5580abe953fdf6985b0b4717c")
(setf (get pid::pid_const_msg :datatype-) "pid/pid_const_msg")
(setf (get pid::pid_const_msg :definition-)
      "float64 p
float64 i
float64 d

")



(provide :pid/pid_const_msg "4d7f5db5580abe953fdf6985b0b4717c")


