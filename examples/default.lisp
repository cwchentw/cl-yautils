#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(import 'cl-yautils::default)

;; Simulate a main function.
(defun main ()
  (defvar a 5)
  (defvar b nil)
  ;; `a` keeps its original value.
  (assert (equal 5 (default a 9999)))
  ;; `b` becomes its default value.
  (assert (equal 9999 (default b 9999)))
  (quit))

;; Call the main function.
(main)