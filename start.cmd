@echo off

set vbsPath="%TEMP%\wslxrun.vbs"
del %vbsPath% 2>NUL

for /f "delims=" %%i in ('wsl which x-session-manager') do set "COMMAND=%%i"
if [%COMMAND%] == [] for /f "delims=" %%i in ('wsl which x-window-manager') do set "COMMAND=%%i"

for /f "usebackq delims=" %%i in (`wsl wslpath -w ~`) do set "BASE_PATH=%%i"
echo WScript.CreateObject("Shell.Application").ShellExecute "wsl", "DISPLAY=:0 LANG=en_US.UTF-8 %COMMAND%", "%BASE_PATH%", "open", 0 > %vbsPath%

start .xlaunch 
wscript %vbsPath%
