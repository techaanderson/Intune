<#
.SYNOPSIS
    Configures Check Point VPN with specified configuration options.
.DESCRIPTION
    This script configures Check Point VPN using the provided settings.
    Guide: https://sc1.checkpoint.com/documents/RemoteAccessClients_forWindows_AdminGuide/Content/Topics-RA-VPN-for-Win/create.htm?tocpath=Remote%20Access%20Clients%20Command%20Line%7CCLI%20Commands%7C_____4
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  2026-02-09
  Purpose/Change: Initial script development
    
.EXAMPLE
    .\Config-CheckPointVPN_Site.ps1
    This command will execute the script to configure Check Point VPN with predefined settings.
#>

# Configure trac.exe for Check Point VPN Site

# VPN Site Configuration
$VPNConfig = @{
    Site        = "usercheck.womans.org"
    DisplayName = "usercheck.womans.org"
    LoginOption = "Woman's Login"
}

# Path to trac.exe
$tracPath = "C:\Program Files (x86)\CheckPoint\Endpoint Connect\trac.exe"

# Validate trac.exe exists
if (-not (Test-Path -Path $tracPath)) {
    Write-Error "CheckPoint trac.exe not found at $tracPath"
    exit 1
}

# Create the VPN site configuration
try {
    Write-Verbose "Creating VPN site: $($VPNConfig.Site)"
    & $tracPath create -s $VPNConfig.Site -di $VPNConfig.DisplayName -lo $VPNConfig.LoginOption
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Successfully configured VPN site: $($VPNConfig.Site)"
    } else {
        Write-Error "Failed to create VPN site. Exit code: $LASTEXITCODE"
        exit $LASTEXITCODE
    }
} catch {
    Write-Error "Error executing trac.exe: $_"
    exit 1
}