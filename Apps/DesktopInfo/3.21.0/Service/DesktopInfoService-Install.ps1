#Install Desktop Info Service
#Start-Process -FilePath "$psscriptroot\DesktopInfoSvc.exe" -ArgumentList "/install" -wait -NoNewWindow #Validated working

$iniFile = "desktopinfo-service.ini"
$ProgramPath = "$env:ProgramData\DesktopInfo"
$regPath = "HKLM:\SOFTWARE\Desktop Info Service"

# Create Program Data folder if it does not exist
If (-not (Test-Path $ProgramPath)) {
    New-Item -Path $ProgramPath -ItemType Directory -Force | Out-Null
}

# Overwrite Service ini to Program Data location
Copy-Item -Path "$psscriptroot\$iniFile" -Destination "$ProgramPath\$iniFile" -Force

# Create Registry Key for HKEY_LOCAL_MACHINE\SOFTWARE\Desktop Info Service
If (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}
# Create string (REG_SZ) value entry for configuration ini
Set-ItemProperty -Path $regPath -Name "ini" -Value "$ProgramPath\$iniFile" -Type String -Force


# Start Desktop Info Service
Get-Service -Name "DesktopInfo" -ErrorAction SilentlyContinue | Start-Service -ErrorAction SilentlyContinue