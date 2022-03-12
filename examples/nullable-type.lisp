#+quicklisp (ql:quickload "cl-portable" :silent t)
#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-portable.lisp" :print nil)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(use-package 'cl-portable)
(use-package 'cl-yautils)

(defun integer-or-null-p (obj)
  (typep obj '(nullable integer)))

;; Simulate main function.
(defun main ()
  ;; 3 is either integer or null.
  (assert (integer-or-null-p 3))
  ;; nil is either integer or null.
  (assert (integer-or-null-p nil))
  ;; "3" is neither integer nor null.
  (assert (equal nil (integer-or-null-p "3")))
  (quit-with-status))

(main)