;; Auto-generated. Do not edit!


(when (boundp 'pid::plant_msg)
  (if (not (find-package "PID"))
    (make-package "PID"))
  (shadow 'plant_msg (find-package "PID")))
(unless (find-package "PID::PLANT_MSG")
  (make-package "PID::PLANT_MSG"))

(in-package "ROS")
;;//! \htmlinclude plant_msg.msg.html


(defclass pid::plant_msg
  :super ros::object
  :slots (_x _t _setpoint ))

(defmethod pid::plant_msg
  (:init
   (&key
    ((:x __x) 0.0)
    ((:t __t) 0.0)
    ((:setpoint __setpoint) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _t (float __t))
   (setq _setpoint (float __setpoint))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:t
   (&optional __t)
   (if __t (setq _t __t)) _t)
  (:setpoint
   (&optional __setpoint)
   (if __setpoint (setq _setpoint __setpoint)) _setpoint)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _t
    8
    ;; float64 _setpoint
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _t
       (sys::poke _t (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _setpoint
       (sys::poke _setpoint (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _t
     (setq _t (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _setpoint
     (setq _setpoint (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pid::plant_msg :md5sum-) "292a905e671af67a6c65822b0e898330")
(setf (get pid::plant_msg :datatype-) "pid/plant_msg")
(setf (get pid::plant_msg :definition-)
      "float64 x
float64 t
float64 setpoint

")



(provide :pid/plant_msg "292a905e671af67a6c65822b0e898330")


