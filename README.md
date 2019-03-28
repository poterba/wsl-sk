# wsl

Install some X-server for Windows (for example, [VcXsrv](https://github.com/ArcticaProject/vcxsrv/releases) or [Xming](https://sourceforge.net/projects/xming/)). 

To connect WSL to it we should start it in background. The simpliest way to do that is to run wscript with actual Visual Basic script as argument. We'll create it in temporary directory:

"%tmp%\wslxrun.vbs"

WSL has issues with x32 architecture support - use solution I've found here:
