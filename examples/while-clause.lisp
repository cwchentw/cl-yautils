(load "cl-yautils.lisp")

(use-package :cl-yautils)

(defun main ()
  (prog ((i 1))
    (while (<= i 10)
      (puts i)
      (finish-output)
      (incf i 1)))
  (quit-with-status))

(main)