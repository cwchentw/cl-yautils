#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(import 'cl-yautils::nullable)

(defun integer-or-null-p (obj)
  (typep obj '(nullable integer)))

;; Simulate a main function.
(defun main ()
  ;; 3 is either integer or null.
  (assert (integer-or-null-p 3))
  ;; nil is either integer or null.
  (assert (integer-or-null-p nil))
  ;; "3" is neither integer nor null.
  (assert (equal nil (integer-or-null-p "3")))
  (quit))

;; Call the main function.
(main)