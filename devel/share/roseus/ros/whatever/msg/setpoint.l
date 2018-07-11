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
  :slots (_setpoint ))

(defmethod whatever::setpoint
  (:init
   (&key
    ((:setpoint __setpoint) 0)
    )
   (send-super :init)
   (setq _setpoint (round __setpoint))
   self)
  (:setpoint
   (&optional __setpoint)
   (if __setpoint (setq _setpoint __setpoint)) _setpoint)
  (:serialization-length
   ()
   (+
    ;; int16 _setpoint
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _setpoint
       (write-word _setpoint s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _setpoint
     (setq _setpoint (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get whatever::setpoint :md5sum-) "8ee399a1f7e5b4decdfc42e0ba4ab098")
(setf (get whatever::setpoint :datatype-) "whatever/setpoint")
(setf (get whatever::setpoint :definition-)
      "int16 setpoint

")



(provide :whatever/setpoint "8ee399a1f7e5b4decdfc42e0ba4ab098")


