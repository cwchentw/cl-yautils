@echo off

rem Check whether Python is available.
python --version >nul 2>&1 || (
    echo No Python on the system 1>&2
    exit /B 1
)

rem Run a development web server on the Codex output path.
python -m http.server --directory docs\build\cl-yautils\html 8080