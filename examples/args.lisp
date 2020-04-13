(load "cl-yautils.lisp")

(use-package :cl-yautils)

(defun main ()
  (prog* ((args (argument-vector))
          #+sbcl   (args (rest args))
          #+ccl    (args (rest (rest (rest (rest args)))))
          #+clisp  (args (rest args))
          #+ecl    (args (rest (rest (rest args))))
          ; In ABCL, no loading script in argument(s).
         )
    ; Print out unprocessed arguments.
    (write-line "Unprocessed argument(s):")
    (puts (argument-vector))
    
    (write-line "")  ; Separator.

    ; Print out processed arguments.
    (write-line "Processed argument(s):")
    (puts args))
  (finish-output)
  (quit-with-status))

(main)
