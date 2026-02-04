#Uninstall SAP
Set-Location "C:\Program Files (x86)\SAP\SapSetup\Setup"
Start-Process -FilePath "NWSAPSetup.exe" -ArgumentList "/all /Silent /Uninstall" -wait -NoNewWindow