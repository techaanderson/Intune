#Uninstall All Versions of TV
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $psscriptroot\1TV_Uninstall_All.bat" -wait -NoNewWindow

#Clean up leftovers from Uninstall
Start-Process -FilePath "powershell.exe" -ArgumentList "/c $psscriptroot\2TV_Incompatible_package_fix.ps1" -wait -NoNewWindow

#Install Full Version of TV
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $psscriptroot\3TVFull_Install.bat" -wait -NoNewWindow