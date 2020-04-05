@echo off

sbcl --eval "(setf sb-impl::*default-external-format* :UTF-8)" %*