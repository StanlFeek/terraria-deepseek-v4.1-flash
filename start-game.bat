@echo off
setlocal
cd /d "%~dp0"

where python >nul 2>nul
if errorlevel 1 (
  echo Python was not found. Opening index.html directly...
  start "" "%~dp0index.html"
  exit /b 0
)

echo Starting Terraria local server on http://127.0.0.1:8123 ...
start "Terraria Local Server" /min cmd /c "python -m http.server 8123 --bind 127.0.0.1"
timeout /t 1 /nobreak >nul
start "" "http://127.0.0.1:8123/index.html"
echo.
echo Game opened in your browser. Close the minimized server window when finished.
endlocal
