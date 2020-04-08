(load "common.lisp")

(defun main ()
  (assert (definedp t))
  ; nil is undefined.
  (assert (equal nil (definedp nil)))
  (assert (definedp 3))
  (assert (definedp '(1 2 3 4 5)))
  ; `non-existing` is undefined.
  (assert (equal nil (definedp non-existing)))
  (quit-with-status 0))

(main)
