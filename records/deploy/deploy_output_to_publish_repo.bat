@echo off
setlocal EnableExtensions

REM Copy the generated gallery output from runtime into your publish repo (static site).
REM Assumes runtime output is: D:\records\offline_gallery\offline_gallery\
REM And publish repo is: C:\Users\David\Documents\GitHub\Records\

set "SRC=D:\records\offline_gallery\offline_gallery"
set "DST=C:\Users\David\Documents\GitHub\Records"

echo === Deploy Gallery Output to Publish Repo ===
echo Source: %SRC%
echo Dest:   %DST%

if not exist "%SRC%\index.html" (
  echo ERROR: Missing %SRC%\index.html (run the gallery build first)
  pause
  exit /b 1
)

if not exist "%DST%" (
  echo ERROR: Destination publish repo folder not found: %DST%
  pause
  exit /b 1
)

copy /y "%SRC%\index.html" "%DST%\index.html" >nul

if exist "%SRC%\images" (
  if not exist "%DST%\images" mkdir "%DST%\images"
  xcopy "%SRC%\images\*" "%DST%\images\" /E /I /Y >nul
) else (
  echo WARNING: No images folder found at %SRC%\images
)

echo Done.
pause
