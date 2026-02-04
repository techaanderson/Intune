<#
.SYNOPSIS
  Edits registry entires to set Device default theme for SAP GUI for Windows.
.DESCRIPTION
  Setup values for both 32-bit and 64-bit SAP GUI default view.
.PARAMETER <Parameter_Name>
  None
.INPUTS
  None
.OUTPUTS
  Registry entries
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  08/25/2018
  Purpose/Change: Initial script development
# Resource: https://launchpad.support.sap.com/#/notes/0002524801
  The HKEY_CURRENT_USER registry values have a higher priority than the registry values under HKEY_LOCAL_MACHINE.
  The registry key and values under SAP GUI Administration for Setting SAP Signature, Blue Crystal and Belize Theme Color 
  [HKEY_LOCAL_MACHINE\SOFTWARE\SAP\General\Appearance\] and 
  [HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\SAP\General\Appearance\] (on 64-Bit OS)
  are copied at startup of SAP Logon (SAP GUI) from HKEY_LOCAL_MACHINE to HKEY_CURRENT_USER without overwriting existing values.
  Default computer selected SAP Theme is located here: HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\SAP\General\Appearance\SelectedTheme (REG_DWORD)
  This will not change the users theme if they have logged into SAP before and changed it manually. To change user logged in you will
  have to edit the SelectedTheme REG_DWORD located here: HKEY_CURRENT_USER\Software\SAP\General\Appearance
  Possible Values (Invalid Value → Belize Theme will be used):
    0x1 (Dec=1) = SAP Signature Theme
    0X20 (Dec=32) = Classic Theme
    0X40 (Dec=64) = Corbu Theme
    0X80 (Dec=128) = Blue Crystal (MS Windows 7 and higher)
    0X100 (Dec=256) = Belize Theme
    0X200 (Dec=512) = Belize High Contrast Black Theme
    0X400 (Dec=1024) = Belize High Contrast White Theme
    0X800 (Dec=2048) = Signature High Contrast Theme

.EXAMPLE
  .\Set-SAP_Theme_Device.ps1
#>

# Set Default computer selected SAP Theme to "SAP Signature Theme"
# Located here: HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\SAP\General\Appearance = SelectedTheme (REG_DWORD)
$RegistryPath = 'HKLM:\Software\Wow6432Node\SAP\General\Appearance'
$Name         = 'SelectedTheme'
$Value        = '1'
# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWord -Force