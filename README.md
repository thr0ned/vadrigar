# Vadrigar
Get started writing Quake Live server plugins with Python *fast*!

### What is Vadrigar?
Vadrigar aims to be a plug-and-play development environment for minqlx plugins and general Quake Live server configuration. Usable on both Windows and Linux.

### Who is this tool for?
Quake Live players who know basic Python.

### What can it do?
Besides a quick-deploy test server, this repo provides standard files and some handy dev tools that I use:
- a default set of plugins from minqlx-plugins
- a `devutils.py` plugin to help quickly set up bots for gameplay testing
- a simple `server.cfg` and gamemode factories
- a stub version of the minqlx module for LSP features in your IDE (autocomplete etc..).

# Installation


## Linux
If you are using Linux, I'm gonna assume you know how to figure out how to install `docker compose` natively to run the system. If needed I can make some Linux instructions too, just ask.


## Windows
On Windows, we will circumvent Windows by using the Windows Subsystem for Linux(WSL). This tool from Microsoft themselves allows us to quickly set up what we need.


### 1. Install WSL & pull Debian 12
First make sure your Windows is fully updated, then follow the installation guide [here](https://learn.microsoft.com/en-us/windows/wsl/install#install-wsl-command).

Some tips:
- Launch your terminals as administrator to avoid shenanigans
- You will have to reboot one or more times for Windows to properly enable the virtualization features.

Once WSL is installed, we need pull the debian distro.
``` powershell
wsl.exe --install Debian
```
You'll be prompted for a new username and password. I highly recommend setting it to `vadrigar` to avoid unforeseen conflicts.
```powershell
Enter new UNIX username: vadrigar
New password: <whatever-you-want>
Retype password: <whatever-you-want>
```
You should then be inside the debian shell, something like:

```vadrigar@yourpcname:/mnt/c/Users/youruser$```

To launch it manually:
```powershell
wsl.exe --distribution Debian
```

### 2. Vadrigar Installation
Update system with the apt package manager, install git and clone this repository:
```bash
# Go to the home directory first, WSL spawns us in the mounted windows filesystem
cd ~
sudo apt update && sudo apt upgrade
sudo apt install git
git clone https://github.com/thr0ned/vadrigar.git && cd vadrigar
```
Run the installer script. You'll need to provide the sudo password you set before.
```bash
# Set execute permission
chmod +x ./setup/debian-installer.sh
./setup/debian-installer.sh
```
Now exit out back to PowerShell:"
```bash
exit
```
Kill and restart WSL:"
```powershell
wsl --shutdown
wsl.exe --distribution Debian
```
Test docker by running:
```bash
docker run hello-world
```
