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
  :slots (_override_status _rc_flag ))

(defmethod whatever::node_master
  (:init
   (&key
    ((:override_status __override_status) nil)
    ((:rc_flag __rc_flag) 0)
    )
   (send-super :init)
   (setq _override_status __override_status)
   (setq _rc_flag (round __rc_flag))
   self)
  (:override_status
   (&optional __override_status)
   (if __override_status (setq _override_status __override_status)) _override_status)
  (:rc_flag
   (&optional __rc_flag)
   (if __rc_flag (setq _rc_flag __rc_flag)) _rc_flag)
  (:serialization-length
   ()
   (+
    ;; bool _override_status
    1
    ;; int16 _rc_flag
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _override_status
       (if _override_status (write-byte -1 s) (write-byte 0 s))
     ;; int16 _rc_flag
       (write-word _rc_flag s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _override_status
     (setq _override_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int16 _rc_flag
     (setq _rc_flag (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get whatever::node_master :md5sum-) "2e6fced663cb3e5fee5dab7b6365bb07")
(setf (get whatever::node_master :datatype-) "whatever/node_master")
(setf (get whatever::node_master :definition-)
      "bool override_status
int16 rc_flag

")



(provide :whatever/node_master "2e6fced663cb3e5fee5dab7b6365bb07")


