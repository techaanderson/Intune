<#
.SYNOPSIS
    This script is used to detect and remediate features on demand or DISM in Windows 10.

.DESCRIPTION
    The script provides two main functionalities: detection and remediation of features on demand. By default, the script runs in detection mode, but it can also be configured to perform remediation.
    The list of features to be detected and remediated can be customized by modifying the $windowsCapabilityList array in the script.

.NOTES
    File Name      : Detect-Remediate-WindowsCapabilities.ps1
    Author         : Aaron Anderson
    Blog           : https://www.imab.dk
#>

#Requires -RunAsAdministrator

param (
    [bool]$runDetection = $true,
    [bool]$runRemediation = $false
)

begin {
    $windowsCapabilityList = @(
        "App.Support.QuickAssist~~~~0.0.1.0"
    )
    function Test-InstalledWindowsCapabilities() {
        foreach ($windowsCapability in $windowsCapabilityList) {
            try {
                $isWindowsCapabilityInstalled = Get-WindowsCapability -Online -Name $windowsCapability -ErrorAction SilentlyContinue  | Where-Object {$_.state -eq 'Installed'}
                if (-NOT[string]::IsNullOrEmpty($isWindowsCapabilityInstalled)) {
                    Write-Output $windowsCapability
                }
            }
            catch {
                Write-Output "[ERROR] Failed to retrieve the installed WindowsCapability: $_"
            }
        }
    }
    function Remove-InstalledWindowsCapability() {
        param (
            [string]$Name
        )
        try {
            Remove-WindowsCapability -Online -Name $windowsCapability
            $global:remediationSuccess += $true
        }
        catch {
            Write-Output "[ERROR] Failed to remove the WindowsCapability: $_"
        }
    }
    if ($runDetection -eq $false) {
        Write-Output "[ERROR] runDetection cannot be set to false. As a minimum runDetection must be set to true."
        exit 1
    }
}

process {
    $global:needsRemediation = @()
    $global:remediationSuccess = @()
    $installedWindowsCapabilities = Test-InstalledWindowsCapabilities
    if ($runDetection -eq $true) {
        if (-NOT[string]::IsNullOrEmpty($installedWindowsCapabilities)) {
            foreach ($windowsCapability in $installedWindowsCapabilities) {
                $global:needsRemediation += $true
                if ($runRemediation -eq $true) {
                    Remove-InstalledWindowsCapability -Name $windowsCapability
                }
            }
        }
    }
}

end {
    if ($runDetection -eq $true) {
        if ($global:needsRemediation -contains $true -AND $global:remediationSuccess -notcontains $true) {
            Write-Output "[WARNING] Windows Capability found installed. Remediation is needed."
            exit 1
        }
        elseif ($global:remediationSuccess -contains $true -AND $global:remediationSuccess -notcontains $false) {
            Write-Output "[OK] Remediation was run successfully. Windows Capabilities were removed."
            exit 0
        }
        else {
            Write-Output "[OK] No Windows Capabilities found. Doing nothing."
            exit 0
        }
    }
}
