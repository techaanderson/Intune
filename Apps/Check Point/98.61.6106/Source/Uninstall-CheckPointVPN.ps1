# Uninstall-CheckPointVPN.ps1
<#
.SYNOPSIS
    Uninstalls Check Point VPN with specified configuration options.
.DESCRIPTION
    This script uninstalls Check Point VPN using the provided installer and configuration arguments.
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  2026-02-09
  Purpose/Change: Initial script development
  
.EXAMPLE
    .\Uninstall-CheckPointVPN.ps1
    This command will execute the script to uninstall Check Point VPN with predefined settings.
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
    "/x"                    # Uninstall the package
    "`"$InstallerPath`""    # Path to the MSI file (double-quoted to handle spaces)
    "/qn"                   # User Interface level: Quiet, No UI
    "/norestart"            # Suppress any restart prompts
)
# Execute the installation process
Write-Host "Starting Check Point VPN uninstallation..." -ForegroundColor Cyan
Start-Process -FilePath "msiexec.exe" -ArgumentList $msiArguments -Wait -NoNewWindow
Write-Host "Finished Check Point VPN uninstallation" -ForegroundColor Cyan