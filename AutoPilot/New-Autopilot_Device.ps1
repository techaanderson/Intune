# Validated
# Add Windows Device to Autopilot from OOBE
# Shift+F10 to Open Cmd Line

# Run powershell
powershell
# Allow scripts
Set-ExecutionPolicy Bypass
# Install script
Install-Script Get-WindowsAutoPilotInfo -Force
# Run Script
Get-WindowsAutoPilotInfo.ps1 -Online
# Reboot after process is complete
shutdown -r -t 0

# Testing Device
.\Get-WindowsAutoPilotInfo.ps1 -Online -AssignedUser "aander07@hospital.womans.com" -GroupTag "Test-AA" -AssignedComputerName "tst-VMAA-AP2" -Assign -Reboot

# Examples of using New-Autopilot_Device.ps1
.\Get-WindowsAutoPilotInfo.ps1 -Online -Assign -Reboot
.\Get-WindowsAutoPilotInfo.ps1 -Online -Reboot
.\Get-WindowsAutoPilotInfo.ps1 -Online -AssignedUser "aander07@hospital.womans.com"
.\Get-WindowsAutoPilotInfo.ps1 -Online -GroupTag "IS"
.\Get-WindowsAutoPilotInfo.ps1 -Online -AddToGroup "Something-Devices"
.\Get-WindowsAutoPilotInfo.ps1 -Online -AssignedComputerName "WOMANSHOSPITAL-01"

<#
.PARAMETER Name
The names of the computers.  These can be provided via the pipeline (property name Name or one of the available aliases, DNSHostName, ComputerName, and Computer).
.PARAMETER OutputFile
The name of the CSV file to be created with the details for the computers.  If not specified, the details will be returned to the PowerShell
pipeline.
.PARAMETER Append
Switch to specify that new computer details should be appended to the specified output file, instead of overwriting the existing file.
.PARAMETER Credential
Credentials that should be used when connecting to a remote computer (not supported when gathering details from the local computer).
.PARAMETER Partner
Switch to specify that the created CSV file should use the schema for Partner Center (using serial number, make, and model).
.PARAMETER GroupTag
An optional tag value that should be included in a CSV file that is intended to be uploaded via Intune (not supported by Partner Center or Microsoft Store for Business).
.PARAMETER AssignedUser
An optional value specifying the UPN of the user to be assigned to the device.  This can only be specified for Intune (not supported by Partner Center or Microsoft Store for Business).
.PARAMETER Online
Add computers to Windows Autopilot via the Intune Graph API
.PARAMETER AssignedComputerName
An optional value specifying the computer name to be assigned to the device.  This can only be specified with the -Online switch and only works with AAD join scenarios.
.PARAMETER AddToGroup
Specifies the name of the Azure AD group that the new device should be added to.
.PARAMETER Assign
Wait for the Autopilot profile assignment.  (This can take a while for dynamic groups.)
.PARAMETER Reboot
Reboot the device after the Autopilot profile has been assigned (necessary to download the profile and apply the computer name, if specified).
#>
