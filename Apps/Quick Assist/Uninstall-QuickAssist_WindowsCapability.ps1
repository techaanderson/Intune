#### Remove Quick Assist Feature on Demand Version (Windows 10) # With More Logic
#Requires -RunAsAdministrator
# Check if Quick Assist is installed
$checkQuickAssist = Get-WindowsCapability -online | Where-Object {$_.name -like "*QuickAssist*"}

# If installed, uninstall Quick Assist
if ($checkQuickAssist.state -eq 'Installed') {
  Write-Host "Uninstalling Quick Assist..."
  try {
    Remove-WindowsCapability -online -name $checkQuickAssist.name -ErrorAction Stop
    Write-Host "Quick Assist uninstalled successfully."
  } catch {
    Write-Error "Error uninstalling Quick Assist: $($_.Exception.Message)"
  }
} else {
  Write-Host "Quick Assist is not installed."
}

#### Remove Quick Assist Feature on Demand Version (Windows 10) - Run with Admin rights # One Liner
#Remove-WindowsCapability -Online -Name $(Get-WindowsCapability -Online -Name *quickassist*).Name

## Get Current Status
#Get-WindowsCapability -Online -Name "App.Support.QuickAssist~~~~0.0.1.0"
## Install it
#Add-WindowsCapability -Online -Name "App.Support.QuickAssist~~~~0.0.1.0"
## Remove it
#Remove-WindowsCapability -Online -Name "App.Support.QuickAssist~~~~0.0.1.0"
# ---------------------------------------------------------------------------------------------------------