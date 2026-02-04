#Copy msi to C:\Windows\ccmcache\5
Copy-Item -Path ".\PowerShell-7.2.3-win-x64.msi" -Destination "C:\Windows\ccmcache\5" -Force
#Run Install
Start-Process -FilePath "$env:systemroot\system32\msiexec.exe" -ArgumentList '/i', 'PowerShell-7.4.2-win-x64.msi', '/qn', 'ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1', 'ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1', 'ENABLE_PSREMOTING=1', 'REGISTER_MANIFEST=1', 'USE_MU=1', "ENABLE_MU=1", "ADD_PATH=1" -Wait -NoNewWindow
#Run UnInstall
Start-Process -FilePath "$env:systemroot\system32\msiexec.exe" -ArgumentList '/x', 'PowerShell-7.4.2-win-x64.msi', '/qn', 'ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1', 'ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1', 'ENABLE_PSREMOTING=1', 'REGISTER_MANIFEST=1', 'USE_MU=1', "ENABLE_MU=1", "ADD_PATH=1" -Wait -NoNewWindow
#Run Install
Start-Process -FilePath "$env:systemroot\system32\msiexec.exe" -ArgumentList '/i', 'PowerShell-7.4.2-win-x64.msi', '/qn', 'ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1', 'ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1', 'ENABLE_PSREMOTING=1', 'REGISTER_MANIFEST=1', 'USE_MU=1', "ENABLE_MU=1", "ADD_PATH=1" -Wait -NoNewWindow