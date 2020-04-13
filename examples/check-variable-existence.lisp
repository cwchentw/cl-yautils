(load "cl-yautils.lisp")

(use-package 'cl-yautils)

(defun main ()
  (assert (defined t))
  ; nil is undefined.
  (assert (equal nil (defined nil)))
  (assert (defined 3))
  (assert (defined '(1 2 3 4 5)))
  ; `non-existing` is undefined.
  (assert (equal nil (defined non-existing)))
  (quit-with-status 0))

(main)
