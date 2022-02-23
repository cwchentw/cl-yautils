@echo off

rem Check whether SBCL is available.
sbcl --version >nul 2>&1 || (
     echo No SBCL on the system 1>&2
     exit /B 1
)

rem Check whether Codex is available.
rem *TODO* Mute SBCL debugger information. 
sbcl --noinform ^
     --disable-debugger ^
     --eval "(handler-case (require \"codex\") (error () (write-line \"No Codex on this system\") (quit)))" ^
     --quit

rem Compile Codex documents.
sbcl --noinform ^
     --eval "(setf sb-impl::*default-external-format* :UTF-8)" ^
     --eval "(require \"codex\")" ^
     --eval "(codex:document :cl-yautils)" ^
     --quit