(load "cl-yautils.lisp")

(use-package :cl-yautils)

(defun main ()
  (puts (argument-vector))
  (finish-output)
  (quit-with-status))

(main)
