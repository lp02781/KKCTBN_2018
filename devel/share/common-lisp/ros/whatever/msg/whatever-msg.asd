
(cl:in-package :asdf)

(defsystem "whatever-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "flight_mode" :depends-on ("_package_flight_mode"))
    (:file "_package_flight_mode" :depends-on ("_package"))
    (:file "image_process" :depends-on ("_package_image_process"))
    (:file "_package_image_process" :depends-on ("_package"))
    (:file "node_master" :depends-on ("_package_node_master"))
    (:file "_package_node_master" :depends-on ("_package"))
    (:file "override_motor" :depends-on ("_package_override_motor"))
    (:file "_package_override_motor" :depends-on ("_package"))
    (:file "rc_number" :depends-on ("_package_rc_number"))
    (:file "_package_rc_number" :depends-on ("_package"))
  ))