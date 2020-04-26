@echo off
rem Place the script to the root path of ABCL.

rem Check whether Java is available.
java -version >nul 2>&1 || (
    echo No Java on this system 1>&2
    exit /B 1
)

rem Get the root path of current batch script.
set rootdir=%~dp0

rem Get the path of a Lisp script from first argument.
set script=%1

rem Check whether the Lisp script is valid.
rem Run in batch mode if %script% is a file.
if exist %script% goto batch_mode

rem Fallback to interactive mode.
goto interactive_mode

:batch_mode
java -jar %rootdir%abcl.jar --noinform --eval "(require :abcl-contrib)" --load %*
rem %script% is the first argument. Hence, there is no need to shift first argument.

rem Exit the program with inherited return value.
exit /B %ERRORLEVEL%

:interactive_mode
java -jar %rootdir%abcl.jar --eval "(require :abcl-contrib)" %*
