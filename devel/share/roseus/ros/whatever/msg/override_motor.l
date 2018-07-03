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
  :slots (_state _setpoint _steering _throttle _header ))

(defmethod whatever::override_motor
  (:init
   (&key
    ((:state __state) 0)
    ((:setpoint __setpoint) 0)
    ((:steering __steering) 0)
    ((:throttle __throttle) 0)
    ((:header __header) 0)
    )
   (send-super :init)
   (setq _state (round __state))
   (setq _setpoint (round __setpoint))
   (setq _steering (round __steering))
   (setq _throttle (round __throttle))
   (setq _header (round __header))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
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
  (:serialization-length
   ()
   (+
    ;; int16 _state
    2
    ;; int16 _setpoint
    2
    ;; int16 _steering
    2
    ;; int16 _throttle
    2
    ;; int16 _header
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _state
       (write-word _state s)
     ;; int16 _setpoint
       (write-word _setpoint s)
     ;; int16 _steering
       (write-word _steering s)
     ;; int16 _throttle
       (write-word _throttle s)
     ;; int16 _header
       (write-word _header s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _state
     (setq _state (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _setpoint
     (setq _setpoint (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _steering
     (setq _steering (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _throttle
     (setq _throttle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _header
     (setq _header (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get whatever::override_motor :md5sum-) "376bcc9dcf6eae1af3cfb5ce0f3af536")
(setf (get whatever::override_motor :datatype-) "whatever/override_motor")
(setf (get whatever::override_motor :definition-)
      "int16 state
int16 setpoint
int16 steering
int16 throttle
int16 header

")



(provide :whatever/override_motor "376bcc9dcf6eae1af3cfb5ce0f3af536")


