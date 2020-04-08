(load "common.lisp")

(defun circle-circumference (radius)
  (when (not (not pi))
    (mathematical-constant))
  (* 2 pi radius))

(defun circle-area (radius)
  (when (not (not pi))
    (mathematical-constant))
  (* pi (expt radius 2)))

(defun main ()
  (prog ((radius 10))
    (puts (circle-circumference radius))
    (puts (circle-area radius))
    (quit-with-status 0)))

(main)
