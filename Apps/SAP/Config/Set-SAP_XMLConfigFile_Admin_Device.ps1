<#
.SYNOPSIS
  Edits registry entires to set device's XML Configuration File on Server setting in SAP Logon.
.DESCRIPTION
  Creates or modifies "HKEY_LOCAL_MACHINE\Software\Wow6432Node\SAP\SAPLogon\Options\LandscapeFileOnServer" and "HKEY_LOCAL_MACHINE\Software\SAP\SAPLogon\Options\LandscapeFileOnServer" (REG_EXPAND_ SZ) key to server location of XML config.
.PARAMETER <Parameter_Name>
  None
.INPUTS
  None
.OUTPUTS
  Registry entries
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  4/3/2024
  Purpose/Change: Initial script development
  Resource: https://me.sap.com/notes/2336740

  
.EXAMPLE
  .\Set-SAP_XMLConfigFile_Admin_Device.ps1
#>

# Set Config XML for "64bit OS" and "64bit version of SAP GUI for Windows"
# Set variables to indicate value and key to set
$RegistryPath = 'HKLM:\Software\Wow6432Node\SAP\SAPLogon\Options'
$Name         = 'LandscapeFileOnServer'
$Value        = '\\ad.he-equipment.com\sysvol\ad.he-equipment.com\scripts\SAP\Config_Logon_Environments\Admin\SAPUILandscape_Admin.xml'
# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType ExpandString -Force

# ------------------------------------------------------------------------------------------------------------

# Set Config XML for "64bit OS" and "64bit SAP GUI for Windows"
# Set variables to indicate value and key to set
$RegistryPath = 'HKLM:\Software\SAP\SAPLogon\Options'
$Name         = 'LandscapeFileOnServer'
$Value        = '\\ad.he-equipment.com\sysvol\ad.he-equipment.com\scripts\SAP\Config_Logon_Environments\Admin\SAPUILandscape_Admin.xml'
# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType ExpandString -Force