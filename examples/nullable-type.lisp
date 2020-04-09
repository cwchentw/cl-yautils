(load "cl-yautils.lisp")

(use-package 'cl-yautils)

(defun main ()
  ; 3 is either integer or null.
  (assert (typep 3 '(nullable integer)))
  ; nil is either integer or null.
  (assert (typep nil '(nullable integer)))
  ; "3" is neither integer nor null.
  (assert (equal nil (typep "3" '(nullable integer))))
  (quit-with-status))

(main)