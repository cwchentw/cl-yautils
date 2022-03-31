#+quicklisp (ql:quickload "cl-portable" :silent t)
#+quicklisp (ql:quickload "cl-yautils" :silent t)
#-quicklisp (load "cl-portable.lisp" :print nil)
#-quicklisp (load "cl-yautils.lisp" :print nil)

(use-package 'cl-portable)
(use-package 'cl-yautils)

;; Simulate a main function.
(defun main ()
  (puts "你好，世界")
  (puts "こんにちは世界")
  (puts "안녕 세상")
  (perror "Something wrong")
  ;; Trick for Clozure CL.
  #+ccl (finish-output)
  (quit-with-status 0))

;; Load the main function.
(main)