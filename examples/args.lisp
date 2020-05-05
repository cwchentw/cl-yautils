(load "cl-yautils.lisp")

(use-package :cl-yautils)

;; Simulate main function.
(defun main ()
  ;; Print out unprocessed arguments.
  (write-line "Unprocessed argument vector:")
  (puts (argument-vector))
    
  (write-line "")  ; Separator.

  ;; Print out processed arguments.
  (write-line "Processed argument(s) in scripting mode:")
  (puts (argument-script))

  (finish-output)  ; Trick for Clozure CL.
  (quit-with-status))

;; Assume args.lisp runs in scripting mode.
(main)
