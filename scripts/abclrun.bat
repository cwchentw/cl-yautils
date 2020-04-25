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
if not exist %script% do echo "Not a valid Lisp script" && exit /b 1

rem Consume first argument.
shift

rem Run ABCL compiler in batch mode.
java -jar %rootdir%abcl.jar --noinform --eval "(require :abcl-contrib)" --load %*
