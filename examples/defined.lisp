#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(import 'cl-yautils::defined)

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
  (assert (defined #'write-line))
  ;; FIXME: Fails on SBCL.
  #-sbcl (assert (not (defined #'unknown)))
  (quit))

;; Call the main function.
(main)