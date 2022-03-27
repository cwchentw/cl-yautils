#+quicklisp (ql:quickload "cl-portable" :silent t)
#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-portable.lisp" :print nil)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(use-package 'cl-portable)
(use-package 'cl-yautils)

(defun main ()
  (defvar a 5)
  (defvar b nil)
  ;; `a` keeps its original value.
  (assert (equal 5 (default a 9999)))
  ;; `b` becomes its default value.
  (assert (equal 9999 (default b 9999)))
  (quit-with-status 0))

(main)