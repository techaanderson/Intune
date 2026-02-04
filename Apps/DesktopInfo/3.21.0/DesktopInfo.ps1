$ProgramPath = "$env:ProgramData\Intune-Apps\$PackageName"
$IniFilePath = "$ProgramPath\womans.ini"
$exeFilePath = "$ProgramPath\DesktopInfo.exe"

Start-Transcript -Path "$ProgramPath\DesktopInfo-lastrun.log" -Force

Write-Host "Starting DesktopInfo"
Start-Process -FilePath $exeFilePath -ArgumentList "/ini=$IniFilePath"

Stop-Transcript