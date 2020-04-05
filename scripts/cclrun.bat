@echo off
rem Try the script later.

rem Set CCL according to hardware archtecture.
if "AMD64" == %PROCESSOR_ARCHITECTURE% (set ccl=wx86cl64.exe) else (set ccl=wx86cl.exe)

rem Get the root path of current batch script.
set rootdir=%~dp0

rem Get the path of a Lisp script from first argument.
set script=%1

rem Check whether the Lisp script is valid.
if not exist %script% do echo "Not a valid Lisp script" && exit /b 1

rem Consume first argument.
shift

rem Run Clozure CL compiler.
%rootdir%\%ccl% -l %script% %$