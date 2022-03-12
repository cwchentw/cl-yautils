#+quicklisp (ql:quickload "cl-portable" :silent t)
#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-portable.lisp" :print nil)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(use-package 'cl-portable)
(use-package 'cl-yautils)

;; Simulate main function.
(defun main ()
              ;; Get a random integer
              ;;  with an internal random seed.
  (prog ((num (random-integer 1 100)))
    (if (evenp num)
        (format t "~d is even~%" num)
        (format t "~d is odd~%" num)))
  (finish-output)  ;; Trick for Clozure CL.
  (quit-with-status))

(main)