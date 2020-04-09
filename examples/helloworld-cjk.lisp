(load "cl-yautils.lisp")

(use-package 'cl-yautils)

(defun main ()
  (puts "你好，世界")
  (puts "こんにちは世界")
  (puts "안녕 세상")
  (finish-output)  ; Trick for Clozure CL.
  (quit-with-status 0))

(main)
