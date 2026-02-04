#Kill Task
taskkill /F /IM Chrome*

#Get Version
$ChromeVer = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  |
    Get-ItemProperty |
    Where-Object {$_.DisplayName -match "Chrome" } |
    Select-Object -Property DisplayName, UninstallString

#Uninstall
ForEach ($ver in $ChromeVer) {

    If ($ver.UninstallString) {

        $uninst = $ver.UninstallString
        & cmd /c $uninst --force-uninstall --multi-install --chrome 
    }
     
}