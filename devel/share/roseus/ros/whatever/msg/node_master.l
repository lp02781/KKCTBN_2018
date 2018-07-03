;; Auto-generated. Do not edit!


(when (boundp 'whatever::node_master)
  (if (not (find-package "WHATEVER"))
    (make-package "WHATEVER"))
  (shadow 'node_master (find-package "WHATEVER")))
(unless (find-package "WHATEVER::NODE_MASTER")
  (make-package "WHATEVER::NODE_MASTER"))

(in-package "ROS")
;;//! \htmlinclude node_master.msg.html


(defclass whatever::node_master
  :super ros::object
  :slots (_override_status _pid_status _rc_number _flight_mode ))

(defmethod whatever::node_master
  (:init
   (&key
    ((:override_status __override_status) nil)
    ((:pid_status __pid_status) nil)
    ((:rc_number __rc_number) 0)
    ((:flight_mode __flight_mode) "")
    )
   (send-super :init)
   (setq _override_status __override_status)
   (setq _pid_status __pid_status)
   (setq _rc_number (round __rc_number))
   (setq _flight_mode (string __flight_mode))
   self)
  (:override_status
   (&optional __override_status)
   (if __override_status (setq _override_status __override_status)) _override_status)
  (:pid_status
   (&optional __pid_status)
   (if __pid_status (setq _pid_status __pid_status)) _pid_status)
  (:rc_number
   (&optional __rc_number)
   (if __rc_number (setq _rc_number __rc_number)) _rc_number)
  (:flight_mode
   (&optional __flight_mode)
   (if __flight_mode (setq _flight_mode __flight_mode)) _flight_mode)
  (:serialization-length
   ()
   (+
    ;; bool _override_status
    1
    ;; bool _pid_status
    1
    ;; int16 _rc_number
    2
    ;; string _flight_mode
    4 (length _flight_mode)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _override_status
       (if _override_status (write-byte -1 s) (write-byte 0 s))
     ;; bool _pid_status
       (if _pid_status (write-byte -1 s) (write-byte 0 s))
     ;; int16 _rc_number
       (write-word _rc_number s)
     ;; string _flight_mode
       (write-long (length _flight_mode) s) (princ _flight_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _override_status
     (setq _override_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _pid_status
     (setq _pid_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int16 _rc_number
     (setq _rc_number (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string _flight_mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _flight_mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get whatever::node_master :md5sum-) "3f3657994b0c8ed8f1919100c99067da")
(setf (get whatever::node_master :datatype-) "whatever/node_master")
(setf (get whatever::node_master :definition-)
      "bool override_status
bool pid_status
int16 rc_number
string flight_mode

")



(provide :whatever/node_master "3f3657994b0c8ed8f1919100c99067da")


