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
           :puterr
           :average
           :proper-list
           :flatten))

(in-package :cl-yautils)

(defmacro defined (v)
  "Check whether a variable is defined"
  (let ((it (gensym)))
  `(let ((it (handler-case ,v
               (unbound-variable (c) nil)
               ;; FIXME: Not trigger errors in SBCL.
               (undefined-function (c) nil)
               (:no-error (c) t))))
    (and it t))))

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
  "Get a random integer between small and large"
  (check-type small integer)
  (check-type large integer)
  (assert (< small large))
  (+ small
     (random (1+ (- large small))
             (or seed (make-random-state t)))))

(defun puts (obj)
  "Print obj to standard output with a trailing newline"
  (if (stringp obj)
      (write-line obj)
      (write-line (princ-to-string obj))))

(defun puterr (obj)
  "Print obj to standard error with a trailing newline"
  (if (stringp obj)
      (write-line obj *error-output*)
      (write-line (princ-to-string obj) *error-output*)))

(defmacro average (&rest args)
  "Get the average of numbers"
  `(/ (+ ,@args) ,(length args)))

;; Not exported.
(defun dotted-pair-p (lst)
  "Detect whether a dotted pair exists"
  (and (consp lst)
       (not (listp (cdr lst)))))

;; Not exported.
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
