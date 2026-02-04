#Install SAP
Start-Process -FilePath "$psscriptroot\1gui800_06_1-80006341_x86.EXE" -ArgumentList "/silent /nodlg" -wait -NoNewWindow
#Install Secure Login Client
Start-Process -FilePath "$psscriptroot\2SAPSetupSLC02_5-80001954.EXE" -ArgumentList "/silent /nodlg" -wait -NoNewWindow
#Configure Logon Environments
Start-Process -FilePath "powershell.exe" -ArgumentList "/c $psscriptroot\3Set-SAP_XMLConfigFile_Device.ps1" -wait -NoNewWindow
#Setup ports for communication
Start-Process -FilePath "powershell.exe" -ArgumentList "/c $psscriptroot\4Set-SAP_Services_TCP_Device.ps1" -wait -NoNewWindow
#Set Computer Default Theme to SAP Signature Theme
Start-Process -FilePath "powershell.exe" -ArgumentList "/c $psscriptroot\5Set-SAP_Theme_Device.ps1" -wait -NoNewWindow
#Set Default View
Start-Process -FilePath "powershell.exe" -ArgumentList "/c $psscriptroot\6Set-SAP_LogonView_Device.ps1" -wait -NoNewWindow