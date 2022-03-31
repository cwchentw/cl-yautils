#+quicklisp (ql:quickload "cl-portable" :silent t)
#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-portable.lisp" :print nil)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(use-package 'cl-portable)
(use-package 'cl-yautils)

;; Simulate a main function.
(defun main ()
  ;; Test against a proper list.
  (assert (equal '(a b c d) (flatten '(a b c d))))
  ;; Test against a nested proper list.
  (assert (equal '(a b c d) (flatten '((a b) c (d)))))
  ;; Test against another nested proper list.
  (assert (equal '(a b c d e f g)
                 (flatten '((a (b c)) ((d e) f g)))))
  ;; Test against a nested list with dotted pairs.
  (assert (equal '(a b c d e f g h)
                 (flatten (cons (cons (cons 'a 'b)
                                      'c)
                                (cons 'd
                                      (cons (cons (cons 'e nil)
                                                  'f)
                                            (cons 'g 'h)))))))
  (quit-with-status))

(main)