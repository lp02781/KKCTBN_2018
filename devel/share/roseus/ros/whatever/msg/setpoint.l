;; Auto-generated. Do not edit!


(when (boundp 'whatever::setpoint)
  (if (not (find-package "WHATEVER"))
    (make-package "WHATEVER"))
  (shadow 'setpoint (find-package "WHATEVER")))
(unless (find-package "WHATEVER::SETPOINT")
  (make-package "WHATEVER::SETPOINT"))

(in-package "ROS")
;;//! \htmlinclude setpoint.msg.html


(defclass whatever::setpoint
  :super ros::object
  :slots (_setpoint _state ))

(defmethod whatever::setpoint
  (:init
   (&key
    ((:setpoint __setpoint) 0)
    ((:state __state) 0)
    )
   (send-super :init)
   (setq _setpoint (round __setpoint))
   (setq _state (round __state))
   self)
  (:setpoint
   (&optional __setpoint)
   (if __setpoint (setq _setpoint __setpoint)) _setpoint)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; int16 _setpoint
    2
    ;; int16 _state
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _setpoint
       (write-word _setpoint s)
     ;; int16 _state
       (write-word _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _setpoint
     (setq _setpoint (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _state
     (setq _state (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get whatever::setpoint :md5sum-) "c823094da4abe0627d8c08c6c9da751e")
(setf (get whatever::setpoint :datatype-) "whatever/setpoint")
(setf (get whatever::setpoint :definition-)
      "int16 setpoint
int16 state

")



(provide :whatever/setpoint "c823094da4abe0627d8c08c6c9da751e")


