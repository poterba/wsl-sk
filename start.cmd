@echo off

set vbsPath="%tmp%\wslxrun.vbs"
del %vbsPath%

echo WScript.CreateObject("Shell.Application").ShellExecute "wsl", "DISPLAY=:0 LANG=en_US.UTF-8 x-session-manager", "", "open", 0 > %vbsPath%

start config.xlaunch 
wscript %vbsPath%
