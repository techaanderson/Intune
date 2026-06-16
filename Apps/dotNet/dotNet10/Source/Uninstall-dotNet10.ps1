# Uninstall .NET 10.0.8 Components
$uninstallKeys = Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object DisplayName, BundleCachePath, QuietUninstallString | Where-Object { $_.DisplayName -like "*Microsoft Windows Desktop Runtime 10.0.8 (x64)*" }

# Uninstall via EXE path (found in Registry)
if (Test-Path $uninstallKeys.BundleCachePath) {
    Start-Process $uninstallKeys.BundleCachePath -ArgumentList "/uninstall /quiet /norestart" -Wait
}