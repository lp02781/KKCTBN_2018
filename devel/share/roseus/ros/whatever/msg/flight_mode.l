;; Auto-generated. Do not edit!


(when (boundp 'whatever::flight_mode)
  (if (not (find-package "WHATEVER"))
    (make-package "WHATEVER"))
  (shadow 'flight_mode (find-package "WHATEVER")))
(unless (find-package "WHATEVER::FLIGHT_MODE")
  (make-package "WHATEVER::FLIGHT_MODE"))

(in-package "ROS")
;;//! \htmlinclude flight_mode.msg.html


(defclass whatever::flight_mode
  :super ros::object
  :slots (_flight_mode ))

(defmethod whatever::flight_mode
  (:init
   (&key
    ((:flight_mode __flight_mode) "")
    )
   (send-super :init)
   (setq _flight_mode (string __flight_mode))
   self)
  (:flight_mode
   (&optional __flight_mode)
   (if __flight_mode (setq _flight_mode __flight_mode)) _flight_mode)
  (:serialization-length
   ()
   (+
    ;; string _flight_mode
    4 (length _flight_mode)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _flight_mode
       (write-long (length _flight_mode) s) (princ _flight_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _flight_mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _flight_mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get whatever::flight_mode :md5sum-) "0ec7751446dccbf592ba3e57dd292976")
(setf (get whatever::flight_mode :datatype-) "whatever/flight_mode")
(setf (get whatever::flight_mode :definition-)
      "string flight_mode

")



(provide :whatever/flight_mode "0ec7751446dccbf592ba3e57dd292976")


