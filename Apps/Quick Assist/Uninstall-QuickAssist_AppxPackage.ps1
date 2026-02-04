## Remove Quick Assist Appx Version (Windows 10/11) # One Liner
#Get-AppxPackage -Name MicrosoftCorporationII.QuickAssist | Remove-AppxPackage -AllUsers

# ---------------------------------------------------------------------------------------------------------

## Remove Quick Assist Appx Version (Windows 10/11) # WITH MORE LOGIC
# Check if Quick Assist is installed
$checkQuickAssist = Get-AppxPackage -Name MicrosoftCorporationII.QuickAssist

# If installed, uninstall Quick Assist
if ($checkQuickAssist) {
  Write-Host "Uninstalling Quick Assist..."
  try {
    $checkQuickAssist | Remove-AppxPackage -AllUsers
    Write-Host "Quick Assist uninstalled successfully."
  } catch {
    Write-Error "Error uninstalling Quick Assist: $($_.Exception.Message)"
  }
} else {
  Write-Host "Quick Assist is not installed."
}
