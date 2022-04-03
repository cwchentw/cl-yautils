#+quicklisp (ql:quickload "cl-portable" :silent t)
#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-portable.lisp" :print nil)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(use-package 'cl-portable)
(use-package 'cl-yautils)

;; Simulate a main function.
(defun main ()
  ;; Check an undefined variable.
  (assert (not (defined v)))
  ;; Check a variable which value is nil.
  (let ((v nil))
    (assert (defined v)))
  ;; Check a variable which value is anything else.
  (let ((v 0))
    (assert (defined v)))
  (quit-with-status 0))

(main)