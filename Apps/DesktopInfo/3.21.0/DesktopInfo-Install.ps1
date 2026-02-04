<#
.DESCRIPTION
	This script installs and configures DesktopInfo application.
	When executed under SYSTEM authority a scheduled task is created to ensure recurring script execution on each user logon.

.NOTES
	Author: Aaron Anderson.
#>

###########################################################################################
# Input values and Logging
###########################################################################################

$PackageName = "DesktopInfo"
$ProgramPath = "$env:ProgramData\$PackageName"
$Version = 1.0
$Description = "Display system information on the Desktop."
$exeFile = "DesktopInfo.exe"
$iniFile = "womans.ini"

$exeFilePath = "$ProgramPath\$exeFile"
$IniFilePath = "$ProgramPath\$iniFile"
$LogFilePath = "$env:ProgramData\Microsoft\IntuneManagementExtension\Logs\$PackageName-install.log"

###########################################################################################
# Start Transcript for logging
###########################################################################################

Start-Transcript -Path $LogFilePath -Force
#Start-Transcript -Path $(Join-Path $env:temp "$PackageName-install.log") -Force

###########################################################################################
#Terminate existing task
###########################################################################################
#taskkill /IM DesktopInfo.exe /F
$processName = "DesktopInfo"
$process = Get-Process -Name $processName -ErrorAction SilentlyContinue
if ($process) {
    $process | Stop-Process -Force
    Write-Host "$processName was running and has been terminated."
} else {
    Write-Host "$processName is not running."
}

###########################################################################################
# Copy application files to ProgramData folder
###########################################################################################
$scriptName = "DesktopInfo.ps1"
$scriptPath = "$ProgramPath\$scriptName"
if (-not (Test-Path -Path $ProgramPath)) {
    New-Item -ItemType Directory -Path $ProgramPath
}
Copy-item -path ".\$exeFile" -destination $exeFilePath
Copy-item -path ".\$iniFile" -destination $IniFilePath
Copy-item -path ".\$scriptName" -destination $scriptPath

# ###########################################################################################
# # Create dummy vbscript to hide PowerShell Window popping up at logon
# ###########################################################################################

# $vbsDummyScript = "
# Dim shell,fso,file

# Set shell=CreateObject(`"WScript.Shell`")
# Set fso=CreateObject(`"Scripting.FileSystemObject`")

# strPath=WScript.Arguments.Item(0)

# If fso.FileExists(strPath) Then
# 	set file=fso.GetFile(strPath)
# 	strCMD=`"powershell -nologo -executionpolicy ByPass -command `" & Chr(34) & `"&{`" &_
# 	file.ShortPath & `"}`" & Chr(34)
# 	shell.Run strCMD,0
# End If
# "

# $scriptSaveName = "$PackageName-VBSHelper.vbs"
# $dummyScriptPath = $(Join-Path -Path $ProgramPath -ChildPath $scriptSaveName)
# $vbsDummyScript | Out-File -FilePath $dummyScriptPath -Force
# $wscriptPath = Join-Path $env:SystemRoot -ChildPath "System32\wscript.exe"

###########################################################################################
# Register a scheduled task to run for all users and execute the script on logon
###########################################################################################
$schtaskName = $PackageName
$schtaskDescription = $Description
$PowerShellExePath = Join-Path $env:SystemRoot "System32\WindowsPowerShell\v1.0\powershell.exe"
$schtaskArguments = "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$scriptPath`""
#cmd.exe /c start /min "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command ". 'C:\some\path\test.ps1'"

#Create trigger to run at user logon
$trigger = New-ScheduledTaskTrigger -AtLogOn

#Execute task in users context
$principal = New-ScheduledTaskPrincipal -GroupId "S-1-5-32-545" -Id "Author"

#call the vbscript helper and pass the PosH script as argument
#$action = New-ScheduledTaskAction -Execute $wscriptPath -Argument "`"$dummyScriptPath`" `"$scriptPath`""

#call the PowerShell exe directly with hidden window style
$action = New-ScheduledTaskAction -Execute $PowerShellExePath -Argument $schtaskArguments
# call the exe directly without hidden window style
$action = New-ScheduledTaskAction -Execute $exeFilePath -Argument $schtaskArguments

#Settings to allow running on battery and not stop if going on battery
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

#Register the scheduled task
$null = Register-ScheduledTask -TaskName $schtaskName -Trigger $trigger -Action $action -Principal $principal -Settings $settings -Description $schtaskDescription -Force

#Start the scheduled task to run immediately
Start-ScheduledTask -TaskName $schtaskName

###########################################################################################
# Write Install information to file for tracking
###########################################################################################
$InstallLogPath = Join-Path -Path $env:ProgramData -ChildPath "$PackageName\version-$version.log"
$InstallInfo = @{
    PackageName = $PackageName
    Version = $Version
    InstallDate = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
}
$InstallInfo | ConvertTo-Json | Out-File -FilePath $InstallLogPath -Force

###########################################################################################
# End & finish transcript
###########################################################################################
Stop-Transcript

###########################################################################################
# Done
###########################################################################################