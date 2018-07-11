;; Auto-generated. Do not edit!


(when (boundp 'whatever::image_process)
  (if (not (find-package "WHATEVER"))
    (make-package "WHATEVER"))
  (shadow 'image_process (find-package "WHATEVER")))
(unless (find-package "WHATEVER::IMAGE_PROCESS")
  (make-package "WHATEVER::IMAGE_PROCESS"))

(in-package "ROS")
;;//! \htmlinclude image_process.msg.html


(defclass whatever::image_process
  :super ros::object
  :slots (_state_red _state_green _count_red _count_green ))

(defmethod whatever::image_process
  (:init
   (&key
    ((:state_red __state_red) 0)
    ((:state_green __state_green) 0)
    ((:count_red __count_red) 0)
    ((:count_green __count_green) 0)
    )
   (send-super :init)
   (setq _state_red (round __state_red))
   (setq _state_green (round __state_green))
   (setq _count_red (round __count_red))
   (setq _count_green (round __count_green))
   self)
  (:state_red
   (&optional __state_red)
   (if __state_red (setq _state_red __state_red)) _state_red)
  (:state_green
   (&optional __state_green)
   (if __state_green (setq _state_green __state_green)) _state_green)
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
   ;; int16 _count_red
     (setq _count_red (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _count_green
     (setq _count_green (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get whatever::image_process :md5sum-) "e5e1c278fbb5698de32e1d5d47db51b4")
(setf (get whatever::image_process :datatype-) "whatever/image_process")
(setf (get whatever::image_process :definition-)
      "int16 state_red
int16 state_green
int16 count_red
int16 count_green

")



(provide :whatever/image_process "e5e1c278fbb5698de32e1d5d47db51b4")


