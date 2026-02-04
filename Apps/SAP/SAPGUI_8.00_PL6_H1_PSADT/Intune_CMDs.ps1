#Install
powershell.exe -executionpolicy bypass -file "Win32App_PSADT_PreLaunch.ps1" -DeploymentType Install
#Uninstall
powershell.exe -executionpolicy bypass -file "Win32App_PSADT_PreLaunch.ps1" -DeploymentType Uninstall