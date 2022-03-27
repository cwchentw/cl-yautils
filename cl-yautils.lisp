(in-package :cl-user)

(defpackage :cl-yautils
  (:nicknames :yau)
  (:use :cl)
  (:documentation
    "Yet another utilities for Common Lisp")
  (:export :defined
           :nullable
           :default
           :average
           :random-integer
           :puts
           :perror))

(in-package :cl-yautils)

(defmacro defined (obj)
  "Check whether obj is defined."
  `(and (ignore-errors ,obj) t))

(deftype nullable (type)
  "Define nullable type"
  `(or null ,type))

(defun default (x n)
  "Set a default value for a null variable"
  (if (null x)
      n
      x))

(defun average (lst)
  (declare (ftype (function (list) number) average))
  "Get the average of a number lst."
  (check-type lst list)
  (assert (every #'numberp lst))
  (/ (apply #'+ lst) (length lst)))

(defun random-integer (small large &optional seed)
  (declare
    (ftype (function
             (integer integer &optional random-state)
             integer)
           random-integer))
  "Get a random integer between @cl:param(small) and @cl:param(large)."
  (check-type small integer)
  (check-type large integer)
  (assert (< small large))
  (+ small
     (random (1+ (- large small))
             (or seed (make-random-state t)))))

(defun puts (obj)
  "Print obj to standard output with trailing newline."
  (if (stringp obj)
      (write-line obj)
      (write-line (princ-to-string obj))))

(defun perror (obj)
  "Print obj to standard error with trailing newline."
  (if (stringp obj)
      (write-line obj *error-output*)
      (write-line (princ-to-string obj) *error-output*)))
