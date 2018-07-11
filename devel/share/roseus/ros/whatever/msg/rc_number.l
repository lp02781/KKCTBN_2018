;; Auto-generated. Do not edit!


(when (boundp 'whatever::rc_number)
  (if (not (find-package "WHATEVER"))
    (make-package "WHATEVER"))
  (shadow 'rc_number (find-package "WHATEVER")))
(unless (find-package "WHATEVER::RC_NUMBER")
  (make-package "WHATEVER::RC_NUMBER"))

(in-package "ROS")
;;//! \htmlinclude rc_number.msg.html


(defclass whatever::rc_number
  :super ros::object
  :slots (_rc_number ))

(defmethod whatever::rc_number
  (:init
   (&key
    ((:rc_number __rc_number) 0)
    )
   (send-super :init)
   (setq _rc_number (round __rc_number))
   self)
  (:rc_number
   (&optional __rc_number)
   (if __rc_number (setq _rc_number __rc_number)) _rc_number)
  (:serialization-length
   ()
   (+
    ;; int16 _rc_number
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _rc_number
       (write-word _rc_number s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _rc_number
     (setq _rc_number (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get whatever::rc_number :md5sum-) "2244ae5f9aac7ce5c8daccbb71337be0")
(setf (get whatever::rc_number :datatype-) "whatever/rc_number")
(setf (get whatever::rc_number :definition-)
      "int16 rc_number

")



(provide :whatever/rc_number "2244ae5f9aac7ce5c8daccbb71337be0")


