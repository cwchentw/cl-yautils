(load "cl-yautils.lisp")

(use-package :cl-yautils)

(defun main ()
  ; Print out unprocessed arguments.
  (write-line "Unprocessed argument(s):")
  (puts (argument-vector))
    
  (write-line "")  ; Separator.

  ; Print out processed arguments.
  (write-line "Processed argument(s):")
  (puts (argument))
  (finish-output)
  (quit-with-status))

(main)
