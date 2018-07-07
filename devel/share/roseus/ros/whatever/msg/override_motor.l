;; Auto-generated. Do not edit!


(when (boundp 'whatever::override_motor)
  (if (not (find-package "WHATEVER"))
    (make-package "WHATEVER"))
  (shadow 'override_motor (find-package "WHATEVER")))
(unless (find-package "WHATEVER::OVERRIDE_MOTOR")
  (make-package "WHATEVER::OVERRIDE_MOTOR"))

(in-package "ROS")
;;//! \htmlinclude override_motor.msg.html


(defclass whatever::override_motor
  :super ros::object
  :slots (_state_red _state_green _setpoint _steering _throttle _header _count_red _count_green ))

(defmethod whatever::override_motor
  (:init
   (&key
    ((:state_red __state_red) 0)
    ((:state_green __state_green) 0)
    ((:setpoint __setpoint) 0)
    ((:steering __steering) 0)
    ((:throttle __throttle) 0)
    ((:header __header) 0)
    ((:count_red __count_red) 0)
    ((:count_green __count_green) 0)
    )
   (send-super :init)
   (setq _state_red (round __state_red))
   (setq _state_green (round __state_green))
   (setq _setpoint (round __setpoint))
   (setq _steering (round __steering))
   (setq _throttle (round __throttle))
   (setq _header (round __header))
   (setq _count_red (round __count_red))
   (setq _count_green (round __count_green))
   self)
  (:state_red
   (&optional __state_red)
   (if __state_red (setq _state_red __state_red)) _state_red)
  (:state_green
   (&optional __state_green)
   (if __state_green (setq _state_green __state_green)) _state_green)
  (:setpoint
   (&optional __setpoint)
   (if __setpoint (setq _setpoint __setpoint)) _setpoint)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:throttle
   (&optional __throttle)
   (if __throttle (setq _throttle __throttle)) _throttle)
  (:header
   (&optional __header)
   (if __header (setq _header __header)) _header)
  (:count_red
   (&optional __count_red)
   (if __count_red (setq _count_red __count_red)) _count_red)
  (:count_green
   (&optional __count_green)
   (if __count_green (setq _count_green __count_green)) _count_green)
  (:serialization-length
   ()
   (+
    ;; int16 _state_red
    2
    ;; int16 _state_green
    2
    ;; int16 _setpoint
    2
    ;; int16 _steering
    2
    ;; int16 _throttle
    2
    ;; int16 _header
    2
    ;; int16 _count_red
    2
    ;; int16 _count_green
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _state_red
       (write-word _state_red s)
     ;; int16 _state_green
       (write-word _state_green s)
     ;; int16 _setpoint
       (write-word _setpoint s)
     ;; int16 _steering
       (write-word _steering s)
     ;; int16 _throttle
       (write-word _throttle s)
     ;; int16 _header
       (write-word _header s)
     ;; int16 _count_red
       (write-word _count_red s)
     ;; int16 _count_green
       (write-word _count_green s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _state_red
     (setq _state_red (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _state_green
     (setq _state_green (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _setpoint
     (setq _setpoint (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _steering
     (setq _steering (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _throttle
     (setq _throttle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _header
     (setq _header (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _count_red
     (setq _count_red (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _count_green
     (setq _count_green (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get whatever::override_motor :md5sum-) "c61324fa2e040eda100a19f37f751190")
(setf (get whatever::override_motor :datatype-) "whatever/override_motor")
(setf (get whatever::override_motor :definition-)
      "int16 state_red
int16 state_green
int16 setpoint
int16 steering
int16 throttle
int16 header
int16 count_red
int16 count_green

")



(provide :whatever/override_motor "c61324fa2e040eda100a19f37f751190")


