<#
.SYNOPSIS
    This script removes all devices from Windows AutoPilot in Microsoft Intune.
.DESCRIPTION
    This script connects to Microsoft Graph and uses the WindowsAutoPilotIntune PowerShell module to remove all devices registered in Windows AutoPilot.
.PARAMETER <Parameter_Name>
  <Brief description of parameter input required. Repeat this attribute if required>
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  2025-09-30
  Purpose/Change: Initial script development
  
.EXAMPLE
    .\Remove-AllDevices_AutoPilot.ps1
    This command runs the script to remove all devices from Windows AutoPilot.
#>
#---------------------------------------------------------[Initialisations]--------------------------------------------------------

# Check if the WindowsAutoPilotIntune PowerShell module is installed
#Write-Host "Verifying WindowsAutoPilotIntune PowerShell module" -ForegroundColor Cyan -BackgroundColor Black
if (-not (Get-Module -ListAvailable -Name WindowsAutoPilotIntune)) {
    Write-Host "WindowsAutoPilotIntune module not found. Installing..." -ForegroundColor Yellow
    Install-Module -Name WindowsAutoPilotIntune -Scope CurrentUser -Force
    Write-Host "Installation complete." -ForegroundColor Green
} else {
    Write-Host "WindowsAutoPilotIntune module is already installed." -ForegroundColor Green
}

# Import the module
Import-Module WindowsAutoPilotIntune
#---------------------------------------------------------
# Check if MgGraph module is available
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph)) {
    Write-Host "Microsoft.Graph module not found. Installing..."
    Install-Module Microsoft.Graph -Scope CurrentUser -Force
}

# Check if already connected to MgGraph
try {
    $graphContext = Get-MgContext
    if ($graphContext -and $graphContext.Account) {
        Write-Host "Already connected to Microsoft Graph as $($graphContext.Account)" -ForegroundColor Green
    } else {
        throw "Not connected"
    }
} catch {
    Write-Host "Connecting to Microsoft Graph..."
    Connect-MgGraph
    $graphContext = Get-MgContext
    Write-Host "Connected as $($graphContext.Account)"
}


#---------------------------------------------------------[REMOVE ALL]--------------------------------------------------------
## Remove all AutoPilot devices
$allDevices = Get-AutoPilotDevice
foreach ($device in $allDevices) {
    Write-Host "Removing AutoPilot device with Serial Number: $($device.SerialNumber) and ID: $($device.id)"
    Remove-AutoPilotDevice -id $device.id
    Start-Sleep -Seconds 5 # Optional: Pause for a second between deletions to avoid overwhelming the service
}