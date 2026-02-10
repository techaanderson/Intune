# Vendor Docs
Guide:
https://sc1.checkpoint.com/documents/RemoteAccessClients_forWindows_AdminGuide/Content/Topics-RA-VPN-for-Win/Using-VPN-Client-Configuration-Utility.htm


MSI Client Download: 
https://support.checkpoint.com/results/sk/sk182722


VPN Configuration Utility for Endpoint Security Clients for Windows:
https://support.checkpoint.com/results/sk/sk122574

# Setup VPN Config
First you must unobscure the trac.config file by going to trac.defaults and change LINE 1.
UNOBSCURE_FILE INT 1 to 0. Then restart your Checkpoint Endpoint Connect service.




# Intune Windows App Info
Type: Win32
File: CitrixWorkspaceFullInstaller.intunewin
Name: Citrix Workspace
Description: The Citrix Workspace app allows for secure, unified access to all your SaaS apps, web apps, virtual apps, files, and desktops. If your company uses Citrix simply login with your company credentials to access all of the resources you need to be productive from anywhere.
Publisher: Citrix
App Version: 2507.1 CU1 LTSR
Category: Productivity
Show as featured app: Yes
Logo: CitrixWorkspaceApp_Icon.png

# Intune Program
Install command: 
CitrixWorkspaceFullInstaller.exe /silent /AutoUpdateStream=LTSR /AutoUpdateCheck=manual /includeSSON /cleaninstall /forceinstall

Uninstall command:
CitrixWorkspaceFullInstaller.exe /silent /uninstall

Installation time required: 10

Allow available uninstall: Yes

Install behavior: System

Device restart behavior: Determine behavior based on return codes

# Intune Requirements
No requirements

# Intune Detection rules
File System Detection Rule (Most Common & Recommended)
Type: File System.
Path: %ProgramFiles(x86)%\Citrix\ICA Client\Receiver\
File/Folder Name: receiver.exe
Property: Version
Operator: Greater than or equal to
Value: The specific version number you're deploying (e.g., 23.11.0.21)
Why it works: This targets the main executable and checks its version, which is reliable even as folder names change with updates, as long as you update the version value in Intune.