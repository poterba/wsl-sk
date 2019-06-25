@echo off

set vbsPath="%TEMP%\wslxrun.vbs"
del %vbsPath% 2>NUL

for /f "usebackq delims=" %%i in (`wsl wslpath -w ~`) do set "BASE_PATH=%%i"

echo WScript.CreateObject("Shell.Application").ShellExecute "wsl", "DISPLAY=:0 LANG=en_US.UTF-8 x-window-manager", "%BASE_PATH%", "open", 0 > %vbsPath%

start .xlaunch 
wscript %vbsPath%
