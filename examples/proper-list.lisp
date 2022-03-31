#+quicklisp (ql:quickload "cl-portable" :silent t)
#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-portable.lisp" :print nil)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(use-package 'cl-portable)
(use-package 'cl-yautils)

;; Simulate a main function.
(defun main ()
  ;; Test against an empty list.
  (assert (equal '() (proper-list '())))
  ;; Test against a dotted pair.
  (assert (equal '(a b) (proper-list (cons 'a 'b))))
  ;; Test against a proper list.
  (assert (equal '(a b c d) (proper-list '(a b c d))))
  ;; Test against a list with a trailing dotted pair.
  (assert (equal '(a b c d)
                 (proper-list (cons 'a
                                    (cons 'b
                                          (cons 'c 'd))))))
  ;; Test against a list with non-trailing dotted pairs.
  (assert (equal '(a b c d e f g)
                 (proper-list
                   (cons (cons 'a 'b)
                         (cons 'c
                               (cons (cons 'd 'e)
                                     (cons 'f 'g)))))))
  (quit-with-status))

(main)