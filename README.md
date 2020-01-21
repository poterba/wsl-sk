# wsl-sk

This option is for Windows 10 users only. 

<details>
  <summary>Install WSL</summary>
  
[Make sure](https://aka.ms/wslinstall), you've enabled and installed WSL on your PC properly.
```batch
rem Powershell with Administrative privileges
Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux"
rem After reboot you can install any distributive via Store or using powershell:
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing
```

After installation, you'll be able to run `bash`.

Update your system:
```bash
wsl
sudo apt update
sudo apt upgrade
```
</details>

Install X-server for Windows (for example, [VcXsrv](https://github.com/ArcticaProject/vcxsrv/releases) or [Xming](https://sourceforge.net/projects/xming/)). 

To connect WSL to it we should start it in background. The simpliest way to do that is to run wscript with actual Visual Basic script as argument ([startup script](start.cmd) creates it in temporary directory).

<details>
  <summary>x32 support</summary>
 
WSL has issues with x32 architecture support - you can use solution I've found [here](https://github.com/Microsoft/WSL/issues/2468#issuecomment-374904520):

```bash
sudo apt install -y qemu-user-static
sudo update-binfmts --install i386 /usr/bin/qemu-i386-static --magic '\x7fELF\x01\x01\x01\x03\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x03\x00\x01\x00\x00\x00' --mask '\xff\xff\xff\xff\xff\xff\xff\xfc\xff\xff\xff\xff\xff\xff\xff\xff\xf8\xff\xff\xff\xff\xff\xff\xff'
# unfortunately you should run this command @ every session start:
sudo service binfmt-support start
```
</details>
  
[Shutdown script](stop.cmd) stops LxssManager, and needs to be started with Administrator rights ([done automatically](https://stackoverflow.com/a/10052222))

```batch
net stop LxssManager
rem To start WSL again, you can use:
net start LxssManager
```
