@echo off

rem Get the path of a Lisp script from first argument.
set script=%1

rem Check whether the Lisp script is valid.
if not exist %script% do echo "Not a valid Lisp script" && exit /b 1

rem Consume first argument.
shift

sbcl --noinform --eval "(setf sb-impl::*default-external-format* :UTF-8)" --script %script% %$