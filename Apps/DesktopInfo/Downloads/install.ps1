$PackageName = "DesktopInfo3210" # replace with your package name

Start-Transcript -Path $(Join-Path $env:temp "Intune-App-$PackageName-install.log") -Force

$ErrorActionPreference = 'Stop'
try{
    Start-Process 'DesktopInfo3210.exe' -ArgumentList '/VERYSILENT /ALLUSERS' -Wait
}catch{
    Write-Host "_____________________________________________________________________"
    Write-Host "ERROR while installing $PackageName"
    Write-Host "$_"
}

Stop-Transcript