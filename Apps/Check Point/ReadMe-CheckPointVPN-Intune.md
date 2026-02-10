# Vendor Docs
Guide:
https://sc1.checkpoint.com/documents/RemoteAccessClients_forWindows_AdminGuide/Content/Topics-RA-VPN-for-Win/Using-VPN-Client-Configuration-Utility.htm


MSI Client Download: 
https://support.checkpoint.com/results/sk/sk182722


VPN Configuration Utility for Endpoint Security Clients for Windows:
https://support.checkpoint.com/results/sk/sk122574

# Setup VPN Config
-First you must unobscure the trac.config file by going to trac.defaults and change LINE 1.
UNOBSCURE_FILE INT 1 to 0. Then restart your Checkpoint Endpoint Connect service.
-




# Intune Windows App Info
Type: Win32
File: E89.10_CheckPointVPN.intunewin
Name: Check Point VPN
Description: Check Point VPN provides secure, encrypted remote access to corporate networks for mobile and remote users
Publisher: Check Point
App Version: 98.61.6106
Category: Security
Show as featured app: Yes
Notes: Available: Checkpoint-VPN_users
Logo: CheckPointVPN_Icon.png

# Intune Program
Installer type: PowerShell Script
Install-CheckPointVPN.ps1

Uninstall type: PowerShell Script
Uninstall-CheckPointVPN.ps1

Installation time required: 10

Allow available uninstall: Yes

Install behavior: System

Device restart behavior: Determine behavior based on return codes

# Intune Requirements
No requirements

# Intune Detection rules
Use a custom detection script
Detect-CheckPointVPN.ps1
Run script as 32-bit process on 64-bit clients: No
Enforce script signature check and run script silently: No