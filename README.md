# WSL-SK: Windows Subsystem for Linux Starter Kit
How to setup WSL with GUI?

## Usage
[start.cmd](start.cmd) launches WSL session and XServer simultaniously. It'll try to deduce session/windows manager to be launched. 

[stop.cmd](stop.cmd) stops [LxssManager](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux#LXSS_Manager_Service), which is equal to Linux subsystem shutdown.

## Installation

### WSL

You'll need Powershell with Administrative privileges

- [Install WSL](https://aka.ms/wslinstall) on your PC:
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux"
```

- Install any distributive [via Store](https://aka.ms/wslstore) or using Powershell (e.g. Ubuntu 18.04):

```powershell
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing
```

After installation, you'll be able to run `wsl` and `bash`.

### X-server

Install X-server for Windows (for example, [VcXsrv](https://github.com/ArcticaProject/vcxsrv/releases) or [Xming](https://sourceforge.net/projects/xming/)). 

```powershell
choco install vcxsrv
# or
choco install xming
```

To connect WSL to it we should start it in background. The simpliest way to do that is to run wscript with actual Visual Basic script as argument ([startup script](start.cmd) creates it in temporary directory).

#### x32 support
 
WSL has issues with x32 architecture support - you can use [this](https://github.com/Microsoft/WSL/issues/2468#issuecomment-374904520) solution:

```bash
sudo apt install -y qemu-user-static
sudo update-binfmts --install i386 /usr/bin/qemu-i386-static --magic '\x7fELF\x01\x01\x01\x03\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x03\x00\x01\x00\x00\x00' --mask '\xff\xff\xff\xff\xff\xff\xff\xfc\xff\xff\xff\xff\xff\xff\xff\xff\xf8\xff\xff\xff\xff\xff\xff\xff'
# unfortunately you should run this command @ every session start:
sudo service binfmt-support start
```
