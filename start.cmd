@echo off

rem Check WSL existance
wsl exit || goto :error

for /f "delims=" %%i in ('wsl which x-session-manager') do set "XCOMMAND=%%i"
if "%XCOMMAND%"=="" for /f "delims=" %%i in ('wsl which x-window-manager') do set "XCOMMAND=%%i"
if "%XCOMMAND%"=="" (
	echo Install X Window Manager.
	echo Examples can be found at http://www.xwinman.org/ 
	goto :error
)

for /f "usebackq delims=" %%i in (`wsl wslpath -w ~`) do set "BASE_PATH=%%i"

set vbsPath="%TEMP%\wslxrun.vbs"
del %vbsPath% 2>NUL
echo WScript.CreateObject("Shell.Application").ShellExecute "wsl", "DISPLAY=:0 LANG=en_US.UTF-8 %XCOMMAND%", "%BASE_PATH%", "open", 0 > %vbsPath%

start .xlaunch 
wscript %vbsPath%
goto :eof

:error
pause
