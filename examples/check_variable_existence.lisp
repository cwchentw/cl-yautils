(load "common.lisp")

(defun main ()
  (assert (existp t))
  (assert (equal nil (existp nil)))
  (assert (existp 3))
  (assert (existp '(1 2 3 4 5)))
  ; `non-existing` is not defined.
  (assert (equal nil (existp non-existing)))
  (quit-with-status 0))

(main)
