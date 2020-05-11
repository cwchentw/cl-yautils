(load "cl-yautils")

(use-package 'cl-yautils)

;; Trick for Clozure CL.
#+ccl (defconstant true t)
#+ccl (defconstant false nil)

;; Simulate main function.
(defun main ()
  ;; Basic boolean algebra.
  (assert (equal true (and true true)))
  (assert (equal false (and true false)))

  ;; princ-to-string is overloaded
  ;;  in the package.
  (puts true)
  (puts false)
  (puts :foo)
  (puts 3.14159)
  (puts "Hello World")
  (finish-output)  ;; Trick for Clozure CL.

  ;; princ-to-string remains unmodified
  ;;  outside the package.
  (assert (string= "T" (princ-to-string true)))
  (assert (string= "NIL" (princ-to-string false)))
  (quit-with-status))