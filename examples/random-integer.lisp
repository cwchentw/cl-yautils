#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(import 'cl-yautils::random-integer)

;; Simulate main function.
(defun main ()
              ;; Get a random integer
              ;;  with an internal random seed.
  (prog ((num (random-integer 1 100)))
    (if (evenp num)
        (format t "~d is even~%" num)
        (format t "~d is odd~%" num)))
  #+ccl (finish-output)  ; Trick for Clozure CL.
  (quit))

;; Call the main function.
(main)