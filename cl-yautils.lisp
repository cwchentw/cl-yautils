(in-package :cl-user)

(defpackage :cl-yautils
  (:nicknames :yau)
  (:use :cl)
  (:documentation
    "Yet another utilities for Common Lisp")
  (:export :defined
           :nullable
           :default
           :random-integer
           :puts
           :perror
           :average
           :proper-list
           :flatten))

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

(defmacro average (&rest args)
  "Get the average of a number lst."
  `(/ (+ ,@args) ,(length args)))

(defun dotted-pair-p (lst)
  "Detect whether a dotted pair exists"
  (and (consp lst)
       (not (listp (cdr lst)))))

(defun dotted-to-proper (lst)
  "Convert a dotted pair to a proper list"
  (cons (car lst) (cons (cdr lst) nil)))

(defun proper-list (lst)
  "Convert a list with dotted pair(s) to a proper list"
  (cond ((null lst) nil)
        ((atom lst) (cons lst nil))
        ((dotted-pair-p lst) (dotted-to-proper lst))
        (t (append (proper-list (car lst))
                   (proper-list (cdr lst))))))

(defun flatten (lst)
  "Converts a list with dotted pair(s) to single level"
  (cond ((null lst) nil)
        ((atom lst) (cons lst nil))
        ((atom (car lst)) (cons (car lst)
                                (flatten (cdr lst))))
        ((dotted-pair-p (car lst)) (flatten
                                     (append (dotted-to-proper (car lst))
                                             (cdr lst))))
        (t (append (flatten (car lst)) (flatten (cdr lst))))))
