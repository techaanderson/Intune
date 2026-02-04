# -------------------------------------------------------------------------
# Registry-based detection for Citrix Workspace
# Define the known registry path for Citrix Workspace
$RegPath = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\CitrixOnlinePluginPackWeb"
if (Test-Path $RegPath) {
    $Version = (Get-ItemProperty -Path $RegPath).DisplayVersion
    #$InstallDate = (Get-ItemProperty -Path $RegPath).InstallDate
    Write-Host "SUCCESS: Citrix Workspace is installed." -ForegroundColor Green
    Write-Host "Version: $Version"
    exit 0
    #Write-Host "Installed on: $InstallDate"
} else {
    Write-Error "FAILURE: Citrix Workspace not detected in the registry."
    exit 1
}

# -------------------------------------------------------------------------

# File-based detection for Citrix Workspace
# Define the known file path for Citrix Workspace
$File = "C:\Program Files (x86)\Citrix\ICA Client\Receiver\Receiver.exe"
if (Test-Path $File) {
  Write-Host "SUCCESS: Citrix Workspace is installed." -ForegroundColor Green
  exit 0
} else {
  exit 1
}

# -------------------------------------------------------------------------

# File-based detection with Version for Citrix Workspace
# Define the known file path for Citrix Workspace
$File = "C:\Program Files (x86)\Citrix\ICA Client\Receiver\Receiver.exe"
if (Test-Path $File) {
    $FileVersionInfo = Get-Item $File | Select-Object -ExpandProperty VersionInfo
    $ProductVersion = $FileVersionInfo.ProductVersion
    Write-Host "SUCCESS: Citrix Workspace is installed." -ForegroundColor Green
    Write-Host "Product Version: $ProductVersion"
    exit 0
} else {
    Write-Error "FAILURE: Citrix Workspace not detected."
    exit 1
}