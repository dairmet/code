@echo off
setlocal EnableExtensions

set "RECORDS_HOME=D:\records"
set "RECORDS_OUT=D:\records\outputs"

set "SRC=%RECORDS_OUT%\store\site"
set "DST=C:\Users\David\Documents\GitHub\store"

echo === Store (DEPLOY TO PUBLISH REPO) ===
echo Source: %SRC%
echo Dest:   %DST%

if not exist "%SRC%\index.html" (
  echo ERROR: Missing %SRC%\index.html. Run run_store_test.bat first.
  pause
  exit /b 1
)

if not exist "%DST%" (
  echo ERROR: Publish repo not found: %DST%
  pause
  exit /b 1
)

xcopy "%SRC%\*" "%DST%\" /E /I /Y >nul

echo Done.
pause
