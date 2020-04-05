(load "common.lisp")

(defun main ()
  (puts "Hello World")
  (quit-with-status 0))

(if (equal :windows (platform))
    (defvar *program* "program.exe")
    (defvar *program* "program"))

(compile-program *program* #'main)
(quit-with-status 0)
