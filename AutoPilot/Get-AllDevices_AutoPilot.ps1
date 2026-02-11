<#
.SYNOPSIS
.DESCRIPTION
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  2025-09-30
  Purpose/Change: Initial script development
  
.EXAMPLE
    .\Get-AllDevices_AutoPilot.ps1
    This command runs the script to Get all devices from Windows AutoPilot.
#>
#---------------------------------------------------------[Variables]--------------------------------------------------------
#Output File
$oCSVName = "AutoPilotDevices"
$folder = "C:\GitRepos\techaanderson\Scripts\Intune\AutoPilot\Exports\"
$oCSVPath = Join-Path $folder ($oCSVName + "_" + (Get-Date -Format "yyyy-MM-dd_HHmmss") + ".csv")

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

# Check if the WindowsAutoPilotIntune PowerShell module is installed
Write-Host "Verifying WindowsAutoPilotIntune PowerShell module" -ForegroundColor Cyan
if (-not (Get-Module -ListAvailable -Name WindowsAutoPilotIntune)) {
    Write-Host "WindowsAutoPilotIntune module not found. Installing..." -ForegroundColor Yellow
    Install-Module -Name WindowsAutoPilotIntune -Scope CurrentUser -Force
    Write-Host "Installation complete." -ForegroundColor Green
} else {
    Write-Host "WindowsAutoPilotIntune module is already installed." -ForegroundColor Green
}

## Import the module
#Import-Module WindowsAutoPilotIntune
#---------------------------------------------------------
# Check if MgGraph module is available
Write-Host "Verifying MgGraph PowerShell module" -ForegroundColor Cyan
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph)) {
    Write-Host "Microsoft.Graph module not found. Installing..." -ForegroundColor Yellow
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
    Write-Host "Connecting to Microsoft Graph..." -ForegroundColor Cyan
    Connect-MgGraph
    $graphContext = Get-MgContext
    Write-Host "Connected as $($graphContext.Account)" -ForegroundColor Green
}


#---------------------------------------------------------[REMOVE ALL]--------------------------------------------------------
## Output all AutoPilot devices
$allDevices = Get-AutoPilotDevice
$allDevicesData = foreach ($device in $allDevices) {
#Format Data for CSV
    $device | Select-Object *
}
# Export to CSV
$allDevicesData | Export-Csv -Path $oCSVPath -NoTypeInformation