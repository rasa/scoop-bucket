@echo off
setlocal

for /f %%i in ('scoop which scoop') do (
    set CHECKVER=%%~dpicheckver.ps1
    set FORMAT=%%~dpiformatjson.ps1
)
for /f %%i in ('scoop which powershell') do set PWSH=%%i
for %%i in (%0) do set DIR=%%~dpi..

if "x%~1" == "x" goto updall

:updone
if "x%~1" == "x" goto end
%PWSH% -f %CHECKVER% -dir %DIR% "%~n1" -u
%PWSH% -f %FORMAT% -dir %DIR% "%~n1"
shift
goto :updone

:updall
%PWSH% -f %CHECKVER% -dir %DIR% -u
%PWSH% -f %FORMAT% -dir %DIR%

:end
