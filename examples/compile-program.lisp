(load "cl-yautils.lisp")

(use-package 'cl-yautils)

(defun main ()
  (puts "Hello World")
  (finish-output)  ; Trick for Clozure CL.
  (quit-with-status 0))

(if (equal :windows (platform))
    (defvar *program* "program.exe")
    (defvar *program* "program"))

(compile-program *program* #'main)
(quit-with-status)
