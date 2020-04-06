@echo off
rem Place the script to the root path of ABCL.

rem Check whether Java is available.
java -version >nul 2>&1 || ( echo "No Java on this system" && exit 1)

rem Get the root path of current batch script.
set rootdir=%~dp0

rem Run Clozure CL compiler.
java -jar %rootdir%\abcl.jar -jar %rootdir%\abcl-contrib.jar %*
