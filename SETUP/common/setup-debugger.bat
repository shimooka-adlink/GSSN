@echo off
setlocal enabledelayedexpansion
set OldDir=%cd%
cd /D %~dp0

if "%1"=="" goto USE
if "%2"=="" goto USE

set MCU=%1
set OPT=%2
if not exist uvopt-%OPT%-flash.txt goto BAD
if not exist uvopt-%OPT%-ram.txt goto BAD

set ALLDIRS=..\..\Examples ..\..\Demos

for %%D in (%ALLDIRS%) do call :DODIR "%%D"
goto END


:DODIR
set DIR=%~1
if not exist %DIR%\ goto :EOF
for /f "delims=" %%F in ('dir /s /b %DIR%\*.uvprojx ^| findstr %MCU%') do call :DOFILE "%%F"
goto :EOF


:DOFILE
set PROJFILE=%~1
set OPTFILE=!PROJFILE:uvprojx=uvoptx!
copy /b uvopt-all-head.txt "%OPTFILE%" > nul
for /f "delims=" %%T in ('findstr TargetName "%PROJFILE%" ^| sed "s|^.*<TargetName>\(.*\)</TargetName>.*|\1|"') do call :DOTARGET "%%T"
copy /b "%OPTFILE%" + uvopt-all-tail.txt "%OPTFILE%" > nul
echo %OPTFILE%
goto :EOF

:DOTARGET
set TARGET=%~1
set TYPE=ram
if not "%TARGET%"=="%TARGET:FLASH=%" set TYPE=flash
sed -e "s|_TARGETNAME_|%TARGET%|" -e "s|_MCU_|%MCU%|" uvopt-%OPT%-%TYPE%.txt >> "%OPTFILE%"
goto :EOF


:USE
echo Usage: %0 mcu adapter
goto END


:BAD
echo Adapter %OPT% not supported^^!
goto END


:END
cd /D %OldDir%
endlocal
