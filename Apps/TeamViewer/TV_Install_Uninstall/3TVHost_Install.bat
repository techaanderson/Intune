@echo off
cd %~dp0
msiexec.exe /i "TeamViewer_Host.msi" /qn CUSTOMCONFIGID=ns37d8w APITOKEN=4602504-Wpe73p5mhb7r16MUazNP SETTINGSFILE="\\nocscmp01\packagesource$\Software\Desktop\TeamViewer\TV_Host_15.5.3.0\TVHost_Settings.tvopt" ASSIGNMENTOPTIONS="--alias %COMPUTERNAME% --group-id g136228388 --reassign --grant-easy-access"