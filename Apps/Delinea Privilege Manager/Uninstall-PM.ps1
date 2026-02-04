
## Delinea Privilege Manager solution
# UnInstall ThycoticAgent
Start-Process -FilePath "msiexec.exe" -ArgumentList "/x `"ThycoticAgent_x64_11_4_1030.msi`" /norestart REBOOT=ReallySuppress /qn" -wait -NoNewWindow
# UnInstall ApplicationControlAgent
Start-Process -FilePath "msiexec.exe" -ArgumentList "/x `"Thycotic_ApplicationControlAgent_x64_11_4_1030.msi`" /norestart REBOOT=ReallySuppress /qn" -wait -NoNewWindow
# UnInstall LocalSecurityAgent
Start-Process -FilePath "msiexec.exe" -ArgumentList "/x `"Thycotic_LocalSecurityAgent_x64_11_4_1030.msi`" /norestart REBOOT=ReallySuppress /qn" -wait -NoNewWindow