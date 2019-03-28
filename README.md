# wsl

This option is for Windows 10 users only. [Make sure](https://aka.ms/wslinstall), you've enabled and installed WSL on your PC properly.

```batch
rem Powershell with Administrative privileges
Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux"
```

After installation, you'll be able to run CLI with bash in emulated environment.

Install some X-server for Windows (for example, [VcXsrv](https://github.com/ArcticaProject/vcxsrv/releases) or [Xming](https://sourceforge.net/projects/xming/)). 

To connect WSL to it we should start it in background. The simpliest way to do that is to run wscript with actual Visual Basic script as argument (we'll create it in temporary directory).

Install somehow non-preinstalled but needed packages:
```bash
sudo apt install -y dbus-x11 libgtk2.0-0 libxss-dev libasound2 mesa-utils libgles2-mesa
```

WSL has issues with x32 architecture support - use solution I've found [here](https://github.com/Microsoft/WSL/issues/2468#issuecomment-374904520):

```bash
sudo apt install -y qemu-user-static
sudo update-binfmts --install i386 /usr/bin/qemu-i386-static --magic '\x7fELF\x01\x01\x01\x03\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x03\x00\x01\x00\x00\x00' --mask '\xff\xff\xff\xff\xff\xff\xff\xfc\xff\xff\xff\xff\xff\xff\xff\xff\xf8\xff\xff\xff\xff\xff\xff\xff'
# unfortunately you should run this command @ every session start:
sudo service binfmt-support start
```

# reboot.cmd 
`reboot` command of WSL makes whole PC restart. Something, you wouldn't be similar with, using Oracle VirtualBox or VMWare solutions.
`reboot.cmd` restarts LxssManager, which is equal to 'hard reset' for WSL as system.

```batch
net stop LxssManager
net start LxssManager
```
needs to be started with Administrator rights [(done automatically)](https://stackoverflow.com/a/10052222)
