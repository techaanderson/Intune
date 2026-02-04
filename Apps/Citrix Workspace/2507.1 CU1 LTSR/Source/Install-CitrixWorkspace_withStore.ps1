# Install-CitrixWorkspace.ps1
<#
.SYNOPSIS
    Installs Citrix Workspace with specified configuration options.
.DESCRIPTION
    This script installs Citrix Workspace using the provided installer and configuration arguments.
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  2026-01-20
  Purpose/Change: Initial script development
  
.EXAMPLE
    .\Install-CitrixWorkspace.ps1
    This command will execute the script to install Citrix Workspace with predefined settings.
#>

# Define installer name and verify path
$InstallerName = "CitrixWorkspaceFullInstaller.exe"
$InstallerPath = Join-Path $PSScriptRoot $InstallerName

# Verify the file exists before attempting installation
if (-not (Test-Path $InstallerPath)) {
    Write-Error "Installer not found at: $InstallerPath"
    exit 1
}

# Define your specific arguments
# Note: The STORE0 argument requires nested quotes to handle semicolons correctly
$Arguments = @(
    "/silent",
    "/AutoUpdateStream=LTSR",
    "/AutoUpdateCheck=manual",
    "/includeSSON",
    "/cleaninstall",
    "/forceinstall",
    'STORE0="WomansCitrix;https://citrix.womans.org"'
    #'STORE0="WomansCitrix;https://citrix.womans.org/Citrix/WomansCitrix/discovery;on;WomansCitrix"' # Worked on network, but had issues off network
)

Write-Host "Starting Citrix Workspace installation..." -ForegroundColor Cyan
Start-Process -FilePath $InstallerPath -ArgumentList $Arguments -Wait -NoNewWindow