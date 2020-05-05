(load "cl-yautils.lisp")

(use-package 'cl-yautils)

;; Simulate main function.
(defun main ()
              ;; Get a random integer
              ;;  with an internal random seed.
  (prog ((num (random-integer 1 100)))
    (if (evenp num)
        (format t "~d is even~%" num)
        (format t "~d is odd~%" num)))
  (finish-output)  ; Trick for Clozure CL.
  (quit-with-status))