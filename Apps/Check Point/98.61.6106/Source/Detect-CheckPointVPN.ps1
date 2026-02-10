$DisplayName = "Check Point VPN"
$Version = "98.61.6025"

$Installed = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall |
Get-ItemProperty |
Where-Object {$_.DisplayName -match "$DisplayName"} |
Select-Object -Property DisplayVersion

if ($Installed.DisplayVersion -ge "$Version") {
    Write-Host "Installed" -ForegroundColor Green
    exit 0
} else {
    Write-Host "Not Installed" -ForegroundColor Red
    exit 1
}