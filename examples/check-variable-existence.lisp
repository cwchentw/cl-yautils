#+quicklisp (ql:quickload "cl-portable" :silent t)
#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-portable.lisp" :print nil)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(use-package 'cl-portable)
(use-package 'cl-yautils)

;; Simulate a main function.
(defun main ()
  (assert (defined t))
  ;; nil is undefined.
  (assert (equal nil (defined nil)))
  (assert (defined 3))
  (assert (defined '(1 2 3 4 5)))
  ;; `non-existing` is undefined.
  (assert (equal nil (defined non-existing)))
  (quit-with-status 0))

(main)