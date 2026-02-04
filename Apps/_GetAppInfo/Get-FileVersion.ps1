#referance = https://leonc.info/file-versions-in-windows-with-powershell/

#-------------------------------------------------------------------------------------------------------

#If program version is greater than or equal to minversion, app = installed
$AnyConnectPath="C:\Program Files*\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe"
$MinVersion=[version]"4.6.03049"
If (Test-Path $AnyConnectPath) {
    $ACVersion=[version](Get-ChildItem "C:\Program Files*\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe").VersionInfo.ProductVersion
    $MaxVersionInstalled=($ACVersion | Measure-Object -Maximum).maximum
    If ($MaxVersionInstalled -ge $MinVersion) { $true }
    Else { $false }
}
Else { $false }

#-------------------------------------------------------------------------------------------------------

#If it's a certain version or newer, run another installer.
$ProgramPath="C:\Program Files*\Microsoft Monitoring Agent\Agent\HealthService.exe"
$MinVersion=[version]"10.20.18053.0"
If (Test-Path $ProgramPath) {
    $GetProgramVersion=(Get-ChildItem $ProgramPath).VersionInfo.ProductVersion -replace ', ','.'
    $ConvertedProgramVersion=[version]$GetProgramVersion
    $MaxVersionInstalled=($ConvertedProgramVersion | Measure-Object -Maximum).maximum
    If ($MaxVersionInstalled -ge $MinVersion) {
    	Start-Process "msiexec.exe" -ArgumentList '/i "installer.msi" /q /lvx* "C:\Windows\Temp\MyProgram-install.log"' -Wait
    }

#-------------------------------------------------------------------------------------------------------

## <Perform Pre-Installation tasks here>
        $MMAAgentInstalled = $false
        Write-Log -Message "Installation Application" -Source $deployAppScriptFriendlyName
        $ProgramPath="C:\Program Files*\Microsoft Monitoring Agent\Agent\HealthService.exe"
        $MinVersion=[version]"10.20.18053.0"
        If (Test-Path $ProgramPath) {
        $GetProgramVersion=(Get-ChildItem $ProgramPath).VersionInfo.ProductVersion -replace ', ','.'
        $ConvertedProgramVersion=[version]$GetProgramVersion
        $MaxVersionInstalled=($ConvertedProgramVersion | Measure-Object -Maximum).maximum
        If ($MaxVersionInstalled -ge $MinVersion) {
    	    $MMAAgentInstalled = $true
            Write-Log -Message "Agent already installed" -Source $deployAppScriptFriendlyName
         }