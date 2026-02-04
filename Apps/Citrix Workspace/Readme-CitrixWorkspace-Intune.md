# Vendor Docs
https://docs.citrix.com/en-us/citrix-workspace-app-for-windows/install.html


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