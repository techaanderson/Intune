# Find 

# Define installer name and verify path
$InstallerName = "CitrixWorkspaceFullInstaller.exe"
$InstallerPath = Join-Path $PSScriptRoot $InstallerName

# Verify the file exists before attempting installation
if (-not (Test-Path $InstallerPath)) {
    Write-Error "Installer not found at: $InstallerPath"
    exit 1
}

# Define your specific arguments
$Arguments = @(
    "/silent",
    "uninstall"
)

Start-Process -FilePath $InstallerPath -ArgumentList $Arguments -Wait

# Prompt to reboot
Write-Host "Citrix Workspace has been uninstalled. It is recommended to reboot the system to complete the uninstallation process." -ForegroundColor Yellow
$reboot = Read-Host "Would you like to reboot now? (Y/N)"
if ($reboot -eq "Y" -or $reboot -eq "y") {
    Restart-Computer
} else {
    Write-Host "Please remember to reboot the system later to complete the uninstallation." -ForegroundColor Yellow
}