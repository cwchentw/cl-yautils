python --version >nul 2>&1 || (
    echo "No Python on the system"
    exit /B 1
)

python -m http.server --directory docs\build\cl-yautils\html 8080