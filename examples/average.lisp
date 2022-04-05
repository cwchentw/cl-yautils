#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(import 'cl-yautils::average)

;; Simulate a main function.
(defun main ()
  (assert (equal 3 (average 1 2 3 4 5)))
  (quit))

;; Call the main function.
(main)