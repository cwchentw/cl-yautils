@echo off
rem The script assumes that SBCL is in system path.

sbcl --eval "(setf sb-impl::*default-external-format* :UTF-8)" %*
