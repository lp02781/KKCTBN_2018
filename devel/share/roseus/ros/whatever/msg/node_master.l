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
  :slots (_override_status _pid_status _simple_manuver _simple_speed _record_manuver _record_speed _path_manuver _path_speed ))

(defmethod whatever::node_master
  (:init
   (&key
    ((:override_status __override_status) nil)
    ((:pid_status __pid_status) nil)
    ((:simple_manuver __simple_manuver) nil)
    ((:simple_speed __simple_speed) nil)
    ((:record_manuver __record_manuver) nil)
    ((:record_speed __record_speed) nil)
    ((:path_manuver __path_manuver) nil)
    ((:path_speed __path_speed) nil)
    )
   (send-super :init)
   (setq _override_status __override_status)
   (setq _pid_status __pid_status)
   (setq _simple_manuver __simple_manuver)
   (setq _simple_speed __simple_speed)
   (setq _record_manuver __record_manuver)
   (setq _record_speed __record_speed)
   (setq _path_manuver __path_manuver)
   (setq _path_speed __path_speed)
   self)
  (:override_status
   (&optional __override_status)
   (if __override_status (setq _override_status __override_status)) _override_status)
  (:pid_status
   (&optional __pid_status)
   (if __pid_status (setq _pid_status __pid_status)) _pid_status)
  (:simple_manuver
   (&optional __simple_manuver)
   (if __simple_manuver (setq _simple_manuver __simple_manuver)) _simple_manuver)
  (:simple_speed
   (&optional __simple_speed)
   (if __simple_speed (setq _simple_speed __simple_speed)) _simple_speed)
  (:record_manuver
   (&optional __record_manuver)
   (if __record_manuver (setq _record_manuver __record_manuver)) _record_manuver)
  (:record_speed
   (&optional __record_speed)
   (if __record_speed (setq _record_speed __record_speed)) _record_speed)
  (:path_manuver
   (&optional __path_manuver)
   (if __path_manuver (setq _path_manuver __path_manuver)) _path_manuver)
  (:path_speed
   (&optional __path_speed)
   (if __path_speed (setq _path_speed __path_speed)) _path_speed)
  (:serialization-length
   ()
   (+
    ;; bool _override_status
    1
    ;; bool _pid_status
    1
    ;; bool _simple_manuver
    1
    ;; bool _simple_speed
    1
    ;; bool _record_manuver
    1
    ;; bool _record_speed
    1
    ;; bool _path_manuver
    1
    ;; bool _path_speed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _override_status
       (if _override_status (write-byte -1 s) (write-byte 0 s))
     ;; bool _pid_status
       (if _pid_status (write-byte -1 s) (write-byte 0 s))
     ;; bool _simple_manuver
       (if _simple_manuver (write-byte -1 s) (write-byte 0 s))
     ;; bool _simple_speed
       (if _simple_speed (write-byte -1 s) (write-byte 0 s))
     ;; bool _record_manuver
       (if _record_manuver (write-byte -1 s) (write-byte 0 s))
     ;; bool _record_speed
       (if _record_speed (write-byte -1 s) (write-byte 0 s))
     ;; bool _path_manuver
       (if _path_manuver (write-byte -1 s) (write-byte 0 s))
     ;; bool _path_speed
       (if _path_speed (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _override_status
     (setq _override_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _pid_status
     (setq _pid_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _simple_manuver
     (setq _simple_manuver (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _simple_speed
     (setq _simple_speed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _record_manuver
     (setq _record_manuver (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _record_speed
     (setq _record_speed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _path_manuver
     (setq _path_manuver (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _path_speed
     (setq _path_speed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get whatever::node_master :md5sum-) "9783f29d89cc75e92f81094e627988e9")
(setf (get whatever::node_master :datatype-) "whatever/node_master")
(setf (get whatever::node_master :definition-)
      "bool override_status
bool pid_status
bool simple_manuver
bool simple_speed
bool record_manuver
bool record_speed
bool path_manuver
bool path_speed

")



(provide :whatever/node_master "9783f29d89cc75e92f81094e627988e9")


