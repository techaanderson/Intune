@echo off
cd %~dp0
msiexec.exe /i "TeamViewer_Full.msi" /qn CUSTOMCONFIGID=6y6rn3s APITOKEN=9063119-iZUFcjhVH3neoaN0ZaS9 SETTINGSFILE="\\nocscmp01\packagesource$\Software\Desktop\TeamViewer\TV_Full_15.5.3.0\TVFull_Settings.tvopt" ASSIGNMENTOPTIONS="--alias %COMPUTERNAME% --group-id g119993720 --reassign --grant-easy-access"