<#
.SYNOPSIS
    This script removes a device from Windows AutoPilot in Microsoft Intune.
.DESCRIPTION
    This script connects to Microsoft Graph and uses the WindowsAutoPilotIntune PowerShell module to remove a device registered in Windows AutoPilot based on its serial number.
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  2025-09-30
  Purpose/Change: Initial script development
#>
#---------------------------------------------------------[Initialisations]--------------------------------------------------------

# Check if the WindowsAutoPilotIntune PowerShell module is installed
Write-Host "Verifying WindowsAutoPilotIntune PowerShell module" -ForegroundColor Cyan -BackgroundColor Black
if (-not (Get-Module -ListAvailable -Name WindowsAutoPilotIntune)) {
    Write-Host "WindowsAutoPilotIntune module not found. Installing..." -ForegroundColor Yellow -BackgroundColor Black
    Install-Module -Name WindowsAutoPilotIntune -Scope CurrentUser -Force
    Write-Host "Installation complete." -ForegroundColor Green -BackgroundColor Black
} else {
    Write-Host "WindowsAutoPilotIntune module is already installed." -ForegroundColor Green -BackgroundColor Black
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
        Write-Host "Already connected to Microsoft Graph as $($graphContext.Account)"
    } else {
        throw "Not connected"
    }
} catch {
    Write-Host "Connecting to Microsoft Graph..."
    Connect-MgGraph
    $graphContext = Get-MgContext
    Write-Host "Connected as $($graphContext.Account)"
}

#---------------------------------------------------------[REMOVE ONE]--------------------------------------------------------
# ## Remove the current device from AutoPilot based on its serial number
# $device = Get-AutoPilotDevice | Where-Object SerialNumber -eq (Get-WmiObject -class Win32_Bios).SerialNumber
# Remove-AutoPilotDevice -id $device.id

# Or remove device from AutoPilot based on its serial number
$serialNumber = "4B60TT3"
$device = Get-AutoPilotDevice | Where-Object SerialNumber -eq $serialNumber
Remove-AutoPilotDevice -id $device.id