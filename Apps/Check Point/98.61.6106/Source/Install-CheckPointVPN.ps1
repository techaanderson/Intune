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

# Define configuration script path
$ConfigScript = Join-Path $PSScriptRoot "Config-CheckPointVPN_Site.ps1"
if (-not (Test-Path $ConfigScript)) {
    Write-Warning "Configuration script not found at: $ConfigScript. Installation will proceed without configuration."
    $SkipConfig = $true
}

# Define arguments for installation
$msiArguments = @(
    "/i", "`"$InstallerPath`""  # Install the package
    "/qn"                       # User Interface level: Quiet, No UI
    "/norestart"                # Suppress any restart prompts
)

## Start Installation
Write-Host "Starting Check Point VPN installation..." -ForegroundColor Cyan
$installProcess = Start-Process -FilePath "msiexec.exe" -ArgumentList $msiArguments -Wait -PassThru -NoNewWindow
$installExitCode = $installProcess.ExitCode

if ($installExitCode -eq 0) {
    Write-Host "Check Point VPN installation completed successfully (Exit Code: $installExitCode)" -ForegroundColor Green
}
elseif ($installExitCode -eq 3010) {
    Write-Host "Installation completed successfully. Restart required (Exit Code: $installExitCode)" -ForegroundColor Yellow
}
else {
    Write-Error "Check Point VPN installation failed with exit code: $installExitCode"
    exit $installExitCode
}

## Configure
if (-not $SkipConfig) {
    Write-Host "Configuring Check Point VPN installation..." -ForegroundColor Cyan
    $configProcess = Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "`"$ConfigScript`"" -Wait -PassThru -NoNewWindow
    $configExitCode = $configProcess.ExitCode
    
    if ($configExitCode -eq 0) {
        Write-Host "Configuration completed successfully (Exit Code: $configExitCode)" -ForegroundColor Green
    }
    else {
        Write-Error "Configuration script failed with exit code: $configExitCode"
        exit $configExitCode
    }
}

## Complete
Write-Host "Finished Check Point VPN installation and configuration" -ForegroundColor Cyan