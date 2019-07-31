@echo off
setlocal enabledelayedexpansion

if '%1'=='' goto HELP
if '%1'=='?' goto HELP
if '%1'=='-?' goto HELP
if '%1'=='-h' goto HELP
if '%1'=='/?' goto HELP
if '%1'=='/h' goto HELP
if '%1'=='help' goto HELP
if '%2'=='' goto HELP
if '%2'=='*' goto DOSCAN

call :DOQUERY "%~1" "%~2" "/reg:64"
if %errorlevel% equ 0 goto SUCCESS

call :DOQUERY "%~1" "%~2" "/reg:32"
if %errorlevel% equ 0 goto SUCCESS

call :DOQUERY "%~1" "%~2" ""
if %errorlevel% equ 0 goto SUCCESS
goto FAILURE


:DOQUERY
reg query "%~1" /v "%~2" %~3 2>nul >nul || exit /b 1

set KEY=%~1
set VALUE=%~2
set QUERY=""
for /f "tokens=*" %%a in ('reg query "%KEY%" /v "%VALUE%" %~3 ^| findstr "%VALUE%"') do set QUERY="%%a"

set VALUENS=%VALUE: =%
if not "%VALUE%"=="%VALUENS%" set QUERY=!QUERY:%VALUE%=%VALUENS%!

set RESULT=""
for /f "tokens=2*" %%a in (%QUERY%) do set RESULT="%%b"

set RESULT=%RESULT:"=%
exit /b 0
goto :EOF


:DOSCAN
set RESULT=
for /f "tokens=*" %%V in ('reg query "%~1" /f * /k 2^>nul ^| findstr "\\"') do set RESULT=!RESULT!"%%~nxV" 
goto SUCCESS


:HELP
echo.
echo %0 RegPath RegKey [EnvVar]
echo.
echo Performs a registry query to get a value for a given key.
echo RegPath - Full path of the subkey.
echo RegKey  - The name of the registry key, if "*" then enumerate keys.
echo EnvVar  - [optional] The environment variable to set with the key's value.
echo.
echo Examples:
echo %0 "HKLM\Software\IAR Systems\Embedded Workbench\5.0\EWARM" InstallPath
echo %0 HKLM\Software\WinRAR exe64 WINRAREXE
echo.
goto :EOF


:FAILURE
echo Cannot find %~2 in %~1^^!
exit /b 1
goto :EOF


:SUCCESS
if "%3"=="" echo.%RESULT%
endlocal & if not "%3"=="" set %~3=%RESULT%
exit /b 0
goto :EOF
