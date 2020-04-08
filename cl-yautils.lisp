(defvar *safe-mode* nil
  "Validate data at runtime")

(defun boolean-alias ()
  "Alias as boolean constants"
  (defconstant true t "Alias to t")
  (defconstant false nil "Alias to nil"))

(defmacro definedp (obj)
  `(and (ignore-errors ,obj) t))

(defun average (lst)
  "Get the average of a number list."
  (when *safe-mode*
    (check-type lst list)
    (assert (every #'numberp lst)))
  (/ (apply #'+ lst) (length lst)))

(defun random-integer (small large &optional seed)
  "Get a random integer between small and large."
  (when *safe-mode*
    (check-type small integer)
    (check-type large integer)
    (assert (< small large)))
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

(defun quit-with-status (status)
  "Quit a program with exit status"
  (when *safe-mode*
    (check-type status integer))
  #+sbcl   (sb-ext:quit :unix-status status)
  #+ccl    (if (string= "Microsoft Windows" (software-type))
               (external-call "exit" :int status)
               (ccl:quit status))
  #+clisp  (ext:quit status)
  #+ecl    (ext:quit status)
  #+abcl   (ext:quit :status status)
  ; Fallback for uncommon CL implementation
  #-(or sbcl ccl clisp ecl abcl)
    (cl-user::quit status))

(defun compile-program (program main)
  "Compile a program to an executable"
  (when *safe-mode*
    (check-type program string)
    (check-type main function))
  #+sbcl  (sb-ext:save-lisp-and-die program
                                    :toplevel main
                                    :executable t)
  #+ccl   (ccl:save-application program
                                :toplevel-function main
                                :prepend-kernel t)
  #+clisp (ext:saveinitmem program
                           :init-function main
                           :executable t
                           :quiet t
                           :script nil)
  #-(or sbcl ccl clisp)
    (error "Unsupported Common Lisp implementation"))

(defun platform ()
  "Detect platform type"
  #+sbcl   (cond ((string= "Win32" (software-type)) :windows)
                 ((string= "Darwin" (software-type)) :macos)
                 ((string= "Linux" (software-type)) :linux)
                 ((not (not (find :unix *features*))) :unix)
                 (t (error "Unknown platform")))
  #+ccl    (cond ((string= "Microsoft Windows" (software-type)) :windows)
                 ((string= "Darwin" (software-type)) :macos)
                 ((string= "Linux" (software-type)) :linux)
                 ((not (not (find :unix *features*))) :unix)
                 (t (error "Unknown platform")))
  #+clisp  (cond ((not (not (find :win32 *features*))) :windows)
                 ((not (not (find :macos *features*))) :macos)
                 ((string= "Linux"
                           (let ((s (ext:run-program "uname"
                                                     :output :stream)))
                             (read-line s)))
                   :linux)
                 ((not (not (find :unix *features*))) :unix)
                 (t (error "Unknown platform")))
  #+ecl    (cond ((string= "NT" (software-type)) :windows)
                 ((string= "Darwin" (software-type)) :macos)
                 ((string= "Linux" (software-type)) :linux)
                 ((not (not (find :unix *features*))) :unix)
                 (t (error "Unknown platform")))
  #+abcl   (cond ((not (not (find :windows *features*))) :windows)
                 ((string= "Mac OS X" (software-type)) :macos)
                 ((string= "Linux" (software-type)) :linux)
                 ((not (not (find :unix *features*))) :unix)
                 (t (error "Unknown platform")))
  #-(or sbcl ccl clisp ecl abcl)
    (error "Unsupported Common Lisp implementation"))
