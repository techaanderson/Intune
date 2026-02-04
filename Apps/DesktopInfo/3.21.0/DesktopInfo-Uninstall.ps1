$PackageName = "DesktopInfo"
$ProgramPath = "$env:ProgramData\$PackageName"
$LogFilePath = "$env:ProgramData\Microsoft\IntuneManagementExtension\Logs\$PackageName-uninstall.log"

# Start logging the uninstallation process
Start-Transcript -Path $LogFilePath -Force
try{
    Remove-Item -Path "$ProgramPath" -Force -Confirm:$false -Recurse
    Remove-Item -Path "HKLM:\SOFTWARE\AppDeploy\$PackageName" -Force -Recurse
    Unregister-ScheduledTask -TaskName $PackageName -Confirm:$false
}catch{
    Write-Host "_____________________________________________________________________"
    Write-Host "ERROR while uninstalling $PackageName"
    Write-Host "$_"
}

Stop-Transcript