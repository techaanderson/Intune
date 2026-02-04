# DesktopInfo Readme

# 1. Download zip from link
https://www.glenn.delahoy.com/desktopinfo/

# Install
powershell.exe -executionpolicy bypass -file .\DesktopInfo-Install.ps1

1. Log script in C:\ProgramData\Microsoft\IntuneManagementExtension\Logs\
2. Move exe, ini, and ps1 to C:\Program Files\DesktopInfo
3. Create PowerShell hiding vbscript and add to C:\Program Files\DesktopInfo
4. Create Scheduled Task that calls DesktopInfo.ps1

# Uninstall
powershell.exe -executionpolicy bypass -file .\DesktopInfo-Uninstall.ps1

1. Log in packagename uninstall log
2. Remove program folder
3. Remove Scheduled Task

# Check
powershell.exe -executionpolicy bypass -file .\DesktopInfo-Detection.ps1

1. Pull file version from exe
2. Compare against expectedVersion



# Configure
hostnameIP.ini