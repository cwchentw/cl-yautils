@echo off
rem Place the script to the root path of Clozure CL.

rem Set CCL according to hardware archtecture.
if "AMD64" == "%PROCESSOR_ARCHITECTURE%" (set ccl=wx86cl64.exe) else (set ccl=wx86cl.exe)

rem Get the root path of current batch script.
set rootdir=%~dp0

rem Run Clozure CL compiler.
%rootdir%\%ccl% %*
