@echo off

rem Check whether SBCL is available.
sbcl --version >nul 2>&1 || (echo "No SBCL on the system" && exit 1)

rem Run SBCL, setting the external format to UTF-8
sbcl --eval "(setf sb-impl::*default-external-format* :UTF-8)" %*
