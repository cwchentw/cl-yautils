@echo off

rem Check whether SBCL is available.
sbcl --version >nul 2>&1 || (echo "No SBCL on the system" && exit 1)

rem Get the path of a Lisp script from first argument.
set script=%1

rem Check whether the Lisp script is valid.
if not exist %script% do echo "Not a valid Lisp script" && exit /b 1

rem Consume first argument.
shift

rem Run SBCL in batch mode, setting the external format to UTF-8.
sbcl --noinform --eval "(setf sb-impl::*default-external-format* :UTF-8)" --script %*
