@echo off
setlocal EnableExtensions

REM Deploy offline_gallery tool from this repo into your runtime folder at D:\records\offline_gallery

set "SRC=%~dp0..\tools\offline_gallery"
for %%I in ("%SRC%") do set "SRC=%%~fI"

set "DST=D:\records\offline_gallery"

echo === Deploy Offline Gallery to D:\records ===
echo Source: %SRC%
echo Dest:   %DST%

if not exist "%SRC%\offline_gallery.py" (
  echo ERROR: Missing %SRC%\offline_gallery.py
  pause
  exit /b 1
)

if not exist "%SRC%\run_offline_gallery.bat" (
  echo ERROR: Missing %SRC%\run_offline_gallery.bat
  pause
  exit /b 1
)

if not exist "%DST%" (
  echo ERROR: Destination folder not found: %DST%
  pause
  exit /b 1
)

copy /y "%SRC%\offline_gallery.py" "%DST%\offline_gallery.py" >nul
copy /y "%SRC%\run_offline_gallery.bat" "%DST%\run_offline_gallery.bat" >nul

echo Done.
pause
