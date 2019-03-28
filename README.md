# wsl

Install some X-server for Windows (for example, [https://github.com/ArcticaProject/vcxsrv/releases]VcXsrv or [https://sourceforge.net/projects/xming/]Xming). 

To connect WSL to it we should start it in background. The simpliest way to do that is to run wscript with actual Visual Basic script as argument. We'll create it in temporary directory:

"%tmp%\wslxrun.vbs"
