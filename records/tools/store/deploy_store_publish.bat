@echo off
setlocal EnableExtensions

set "RECORDS_HOME=D:\records"
set "RECORDS_OUT=D:\records\outputs"
set "PUBLISH_REPO=C:\Users\David\Documents\GitHub\Records"

set "SRC=%RECORDS_OUT%\store\site"
set "DST=%PUBLISH_REPO%\store"

echo === Store (DEPLOY TO PUBLISH REPO) ===
echo Source: %SRC%
echo Dest:   %DST%

if not exist "%SRC%\index.html" (
  echo ERROR: Missing %SRC%\index.html. Run the TEST build first.
  pause
  exit /b 1
)

if not exist "%PUBLISH_REPO%" (
  echo ERROR: Publish repo not found: %PUBLISH_REPO%
  pause
  exit /b 1
)

if not exist "%DST%" mkdir "%DST%"

xcopy "%SRC%\*" "%DST%\" /E /I /Y >nul

echo Done.
pause
