
(cl:in-package :asdf)

(defsystem "whatever-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "node_master" :depends-on ("_package_node_master"))
    (:file "_package_node_master" :depends-on ("_package"))
    (:file "override_motor" :depends-on ("_package_override_motor"))
    (:file "_package_override_motor" :depends-on ("_package"))
  ))