
## Delinea Privilege Manager solution
# Install ThycoticAgent
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"ThycoticAgent_x64_11_4_1030.msi`" /norestart AMSURL=https://heequipment.privilegemanagercloud.com/TMS/ INSTALLCODE=7X1M-GIHZ-ZMLR REBOOT=ReallySuppress /qn" -wait -NoNewWindow
# Install ApplicationControlAgent
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"Thycotic_ApplicationControlAgent_x64_11_4_1030.msi`" /norestart REBOOT=ReallySuppress /qn" -wait -NoNewWindow
# Install LocalSecurityAgent
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"Thycotic_LocalSecurityAgent_x64_11_4_1030.msi`" /norestart REBOOT=ReallySuppress /qn" -wait -NoNewWindow