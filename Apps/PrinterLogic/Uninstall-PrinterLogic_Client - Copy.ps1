[CmdletBinding()]
param (
    $name,$code
)

# ----- FUNCTION DEFINITIONS
function Write-ColoredOutput {
    param (
        $Color,
        $Text
    )
    $uic = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $Color
    Write-Output $Text
    $host.UI.RawUI.ForegroundColor = $uic
}
function Test-IsAdmin
{
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal $identity
    $principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function nukeDrivers() {
    Remove-Item "HKLM:\System\CurrentControlSet\Control\Print\Environments\Windows x64\Drivers\Version-3\$failedDriver" -Force
}

function verifyProccess() {
    Write-Output "Waiting for processes...`n"
    While ($true) {
        Start-Sleep 2
        $result = @(
            ForEach ($process in $processPrefix){
                Get-Process | Where-Object {$_.ProcessName -match $process}
            }
        )
        if ($result.Count -ge 3) {
            break
        } else {
            continue
        }
    }
}

# ----- END FUNCTION DEFINITIONS


# ----- MAIN SCRIPT STARTS HERE

# Make sure we are elevated

if (!(Test-IsAdmin)) {
    $params = @(
        "-NoLogo"
        "-NoProfile"
        "-ExecutionPolicy RemoteSigned"
        "-File `"$PSCommandPath`""
    )

    Start-Process "$($(Get-Process -id $pid | Get-Item).FullName)" -Verb RunAs -ArgumentList $params
    exit
}

$overridePath = @(
    "HKLM:\Software\PrinterLogic\PrinterInstaller\Overrides"
    "HKLM:\Software\WOW6432Node\PPP\PrinterInstaller"
)

$overrides = @(
    #"Noparse"
    #"DisablePortMonitor"
    "DisableHomeSecurity"
    "IgnoreCertificateFailures"
)

$regKeys = @(
    "HKLM:\SOFTWARE\Classes\CLSID\{95986c55-6a68-5ef1-8753-fb2f1040a350}"
    "HKLM:\SOFTWARE\Classes\Installer\Products\8580ED9ADDD9B1E40B142CAA09CDFB47"
    "HKLM:\SOFTWARE\Classes\PPPiPrinterfile"
    "HKLM:\SOFTWARE\Classes\PrinterLogic.PrinterInstallerClientPlugin"
    "HKLM:\SOFTWARE\Classes\PrinterLogic.PrinterInstallerClientPlugin.1"
    "HKLM:\SOFTWARE\Classes\printerlogicidp"
    "HKLM:\SOFTWARE\Classes\TypeLib\{7D2DA2E1-1CD1-53A3-8153-CA0B344D6930}"
    "HKLM:\SOFTWARE\Classes\WOW6432Node\CLSID\{95986c55-6a68-5ef1-8753-fb2f1040a350}"
    "HKLM:\SOFTWARE\Classes\WOW6432Node\TypeLib\{7D2DA2E1-1CD1-53A3-8153-CA0B344D6930}"
    "HKLM:\SOFTWARE\WOW6432Node\Google\Chrome\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Edge\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKLM:\SOFTWARE\WOW6432Node\Chromium\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKLM:\SOFTWARE\Google\Chrome\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKLM:\SOFTWARE\Microsoft\Edge\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKLM:\SOFTWARE\Chromium\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKLM:\SOFTWARE\Mozilla\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKLM:\SOFTWARE\MozillaPlugins\printerlogic.com/PrinterInstallerClientPlugin_x86_64"
    "HKLM:\SOFTWARE\WOW6432Node\Classes\CLSID\{95986c55-6a68-5ef1-8753-fb2f1040a350}"
    "HKLM:\SOFTWARE\WOW6432Node\Classes\TypeLib\{7D2DA2E1-1CD1-53A3-8153-CA0B344D6930}"
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{A9DE0858-9DDD-4E1B-B041-C2AA90DCBF74}"
    "HKLM:\SOFTWARE\WOW6432Node\Mozilla\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKLM:\SOFTWARE\WOW6432Node\MozillaPlugins\printerlogic.com/PrinterInstallerClientPlugin"
    "HKLM:\SOFTWARE\WOW6432Node\PPP"
    "HKLM:\SYSTEM\CurrentControlSet\Services\PrinterInstallerLauncher"
    "HKLM:\SOFTWARE\PrinterLogic"
    "HKLM:\SOFTWARE\PPP"
    "HKCU:\SOFTWARE\Classes\CLSID\{95986c55-6a68-5ef1-8753-fb2f1040a350}"
    "HKCU:\SOFTWARE\Classes\Installer\Products\8580ED9ADDD9B1E40B142CAA09CDFB47"
    "HKCU:\SOFTWARE\Classes\PPPiPrinterfile"
    "HKCU:\SOFTWARE\Classes\PrinterLogic.PrinterInstallerClientPlugin"
    "HKCU:\SOFTWARE\Classes\PrinterLogic.PrinterInstallerClientPlugin.1"
    "HKCU:\SOFTWARE\Classes\printerlogicidp"
    "HKCU:\SOFTWARE\Classes\TypeLib\{7D2DA2E1-1CD1-53A3-8153-CA0B344D6930}"
    "HKCU:\SOFTWARE\Classes\WOW6432Node\CLSID\{95986c55-6a68-5ef1-8753-fb2f1040a350}"
    "HKCU:\SOFTWARE\Classes\WOW6432Node\TypeLib\{7D2DA2E1-1CD1-53A3-8153-CA0B344D6930}"
    "HKCU:\SOFTWARE\WOW6432Node\Google\Chrome\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKCU:\SOFTWARE\WOW6432Node\Microsoft\Edge\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKCU:\SOFTWARE\WOW6432Node\Chromium\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKCU:\SOFTWARE\Google\Chrome\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKCU:\SOFTWARE\Microsoft\Edge\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKCU:\SOFTWARE\Chromium\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKCU:\SOFTWARE\Mozilla\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKCU:\SOFTWARE\MozillaPlugins\printerlogic.com/PrinterInstallerClientPlugin_x86_64"
    "HKCU:\SOFTWARE\WOW6432Node\Classes\CLSID\{95986c55-6a68-5ef1-8753-fb2f1040a350}"
    "HKCU:\SOFTWARE\WOW6432Node\Classes\TypeLib\{7D2DA2E1-1CD1-53A3-8153-CA0B344D6930}"
    "HKCU:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{A9DE0858-9DDD-4E1B-B041-C2AA90DCBF74}"
    "HKCU:\SOFTWARE\WOW6432Node\Mozilla\NativeMessagingHosts\com.printerlogic.host.native.client"
    "HKCU:\SOFTWARE\WOW6432Node\MozillaPlugins\printerlogic.com/PrinterInstallerClientPlugin"
    "HKCU:\SOFTWARE\WOW6432Node\PPP"
    "HKCU:\SYSTEM\CurrentControlSet\Services\PrinterInstallerLauncher"
    "HKCU:\SOFTWARE\PrinterLogic"
    "HKCU:\SOFTWARE\PPP"
)

$processPrefix = @(
    "^PrinterInstaller*"
    "^PrinterLogicService*"
    "^PPP*"
)

Clear-Host

Start-Job -Name ClientDownload -ScriptBlock {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri https://printerlogic.printercloud.com/client/setup/PrinterInstallerClient.msi -o $env:TEMP\PrinterInstallerClient.msi
} 1> $null

Start-Job -Name NukePrinters -ScriptBlock {
    $printers = @(Get-Printer)
    ForEach ($printer in $printers) {
        Remove-Printer $printer.Name 1> $null
        Remove-PrinterDriver $printer.DriverName -RemoveFromDriverStore -ErrorVariable result -ErrorAction SilentlyContinue
        trap {
            $failedDrivers += @($printer.DriverName)
        }
    }
    if ($result) {
        Restart-Service Spooler -InformationAction Ignore 1> $null
        ForEach ($driver in $failedDrivers){
            Remove-PrinterDriver $driver -RemoveFromDriverStore
        }
    }
} 1> $null

Write-Output "Stopping PrinterLogic processes...`n"
foreach ($process in $processprefix) {
    try{
        stop-process -force @(get-process | where-object {$_.processname -match $process}) -erroraction ignore
    } catch {
        write-host -foregroundcolor yellow -backgroundcolor black "Some processes clould not be found. this is most likely due to other service client processes that aren't running on the device. This is not an error, only information."
        break
    }
}

Write-Output "`nRemoving PrinterLogic services...`n"
$launcherService = Get-WmiObject -Class Win32_Service -Filter "Name='PrinterInstallerLauncher'"
if ($null -ne $launcherService) {
    $launcherService.delete()
}

Write-Output "Deleting PrinterLogic installation from disk...`n"
if (Test-Path "C:\Program Files (x86)\Printer Properties Pro") {
    Remove-Item -Recurse -Force "C:\Program Files (x86)\Printer Properties Pro"
}

Write-Output "Cleaning registry keys...`n"
foreach ($key in $regKeys) {
    if (Test-Path $key) {
        Remove-Item -Path $key -Recurse -Force 1> $null
    }
}

Wait-Job -Name NukePrinters -Force 1> $null
Wait-Job -Name ClientDownload 1> $null
# Optional Install code below. Comment code below to not install PrinterLogic

msiexec /i "$env:TEMP\PrinterInstallerClient.msi" /qn HOMEURL=https://he.printercloud.com AUTHORIZATION_CODE=lndlg16x

Write-Output "Waiting for registry keys...`n"

While ($true) {
    $result = @(Test-Path $overridePath[0,1] -ErrorAction SilentlyContinue)
    if ($true -match $result[0] -and $result[1]) {
        Break
    } else {
        Start-sleep 2
    }
}

Remove-Item "$env:TEMP\PrinterInstallerClient.msi"

$resultKeys += @(New-ItemProperty -Path $overridePath[1] -Name "ClientParameters" -Value "JDEBUGT" -PropertyType String -Force)

ForEach ($override in $overrides) {
    $resultKeys += @(New-ItemProperty -Path $overridePath[0] -Name $override -Value 1 -PropertyType String -Force)
}

Write-ColoredOutput Green $resultKeys

verifyProccess

Write-Host "Restarting PrinterLogic to apply overrides"

foreach ($process in $processprefix) {
    try{
        stop-process -force @(get-process | where-object {$_.processname -match $process}) -erroraction ignore
        Wait-Process -Name $process
    } catch {
        break
    }
}

Start-Sleep -Seconds 5
Start-Service PrinterInstallerLauncher