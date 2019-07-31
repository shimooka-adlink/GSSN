@echo off
setlocal
set OldDir=%cd%
cd /D %~dp0

rem Change the following line if you are using a different version of IAR.
set IAR_EMBEDDED_WORKBENCH_FOR_ARM=7.80.4

rem Check if batch file is running with permissions.
net session >nul 2>&1
if %ERRORLEVEL% NEQ 0 echo This batch file must be run with administrator rights! & goto END

rem Get path to IAR by looking it up in the registry.
set IAR_REGISTRY_PATH="HKLM\Software\IAR Systems\Embedded Workbench\5.0\EWARM\%IAR_EMBEDDED_WORKBENCH_FOR_ARM%"
call ..\..\common\regquery %IAR_REGISTRY_PATH% InstallPath IAR_TOOL_DIR
if "%IAR_TOOL_DIR%"=="" echo ERROR: Could not locate where IAR Embedded Workbench was installed! & goto END
echo Found IAR at: %IAR_TOOL_DIR%

echo Copying product files to IAR...
xcopy /y /s /e /h /k /i Debugger      "%IAR_TOOL_DIR%\arm\config\debugger\Epson\"           | findstr -v "copied"
xcopy /y /s /e /h /k /i Devices       "%IAR_TOOL_DIR%\arm\config\devices\Epson\"            | findstr -v "copied"
xcopy /y /s /e /h /k /i "flashloader" "%IAR_TOOL_DIR%\arm\config\flashloader\Epson\"        | findstr -v "copied"
xcopy /y /h /k /i "S1C31W74.h"        "%IAR_TOOL_DIR%\arm\inc\Epson\"                       | findstr -v "copied"
xcopy /y /h /k /i "S1C31W74.icf"      "%IAR_TOOL_DIR%\arm\config\linker\Epson\S1C31W74.icf" | findstr -v "copied"
echo Setup Complete.

:END
cd /D %OldDir%
endlocal
echo.
echo Press any key to exit...
pause >nul
