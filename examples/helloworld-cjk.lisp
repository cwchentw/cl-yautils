#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(import 'cl-yautils::puts)
(import 'cl-yautils::puterr)

;; Simulate a main function.
(defun main ()
  (puts "你好，世界")
  (puts "こんにちは世界")
  (puts "안녕 세상")
  (puterr "Something wrong")
  ;; Trick for Clozure CL.
  #+ccl (finish-output)
  (quit))

;; Load the main function.
(main)