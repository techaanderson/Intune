# Install-CheckPointVPN.ps1
<#
.SYNOPSIS
    Installs Check Point VPN with specified configuration options.
.DESCRIPTION
    This script installs Check Point VPN using the provided installer and configuration arguments.
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  2026-02-09
  Purpose/Change: Initial script development
  
.EXAMPLE
    .\Install-CheckPointVPN.ps1
    This command will execute the script to install Check Point VPN with predefined settings.
#>

# Define installer name and verify path
$InstallerName = "E89.10_CheckPointVPN.msi"
$InstallerPath = Join-Path $PSScriptRoot $InstallerName

# Verify the file exists before attempting installation
if (-not (Test-Path $InstallerPath)) {
    Write-Error "Installer not found at: $InstallerPath"
    exit 1
}

# Define your specific arguments for the installation
$msiArguments = @(
    "/i"                    # Install the package
    "`"$InstallerPath`""    # Path to the MSI file (double-quoted to handle spaces)
    "/qn"                   # User Interface level: Quiet, No UI
    "/norestart"            # Suppress any restart prompts
)

## Start
Write-Host "Starting Check Point VPN installation..." -ForegroundColor Cyan
Start-Process -FilePath "msiexec.exe" -ArgumentList $msiArguments -Wait -NoNewWindow

## Configure
Write-Host "Configuring Check Point VPN installation" -ForegroundColor Cyan
#Start-Process -FilePath "powershell.exe" -ArgumentList "-File", ".\Config-CheckPointVPN_Site.ps1" -Wait -NoNewWindow
# Configure trac.exe for Check Point VPN Site
$site = "usercheck.womans.org"
$DisplayName = "usercheck.womans.org"
$LoginOption = "Woman's Login"
## Set the location to trac.exe directory
# Execute trac.exe with the specified arguments
$tracPath = "C:\Program Files (x86)\CheckPoint\Endpoint Connect\trac.exe"
& $tracPath create -s $site -di $DisplayName -lo $LoginOption

## Complete
Write-Host "Finished Check Point VPN installation" -ForegroundColor Cyan