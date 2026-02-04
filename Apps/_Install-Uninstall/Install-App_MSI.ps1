#Example
# Start-Process -FilePath "$env:systemroot\system32\msiexec.exe" -ArgumentList '/i', 'C:\Spi-Setup\Antivirus\SecurepointAntivirusPro_x64_de.msi', '/qn', '/l', 'c:\spi-setup\Antivirus\setuplog.txt', 'TID="KundenID"', 'ACCEPTLICENSEAGREEMENT="yes"', 'ACCEPTPRIVACYPOLICY="yes"' -Wait -NoNewWindow
# msiexec.exe /i "TeamViewer_Full.msi" /qn IMPORTREGFILE=1 APITOKEN=4602504-Wpe73p5mhb7r16MUazNP ASSIGNMENTOPTIONS="--alias %COMPUTERNAME% --group Remote_Support_IT --reassign --grant-easy-access"

#Work in Progress
Start-Process -FilePath "$env:systemroot\system32\msiexec.exe" -ArgumentList '/i', 'TeamViewer_Full.msi', '/qn', 'IMPORTREGFILE=1', 'APITOKEN=4602504-Wpe73p5mhb7r16MUazNP', 'ASSIGNMENTOPTIONS="--alias %COMPUTERNAME% --group Remote_Support_IT --reassign --grant-easy-access"' -Wait -NoNewWindow