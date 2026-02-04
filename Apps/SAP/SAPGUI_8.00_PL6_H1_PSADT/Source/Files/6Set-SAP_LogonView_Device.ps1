<#
.SYNOPSIS
  Edits registry entires to set Device default view to "list view"
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
  Creation Date:  10/19/2022
  Purpose/Change: Initial script development
  Resource: https://me.sap.com/notes/2336740

  
.EXAMPLE
  .\Set-SAP_DefaultLogonView.ps1
#>

# #HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\SAP\SAPLogon\Settings (64bit OS when running a 32bit version of SAP GUI for Windows)
# Set variables to indicate value and key to set
$RegistryPath = 'HKLM:\Software\Wow6432Node\SAP\SAPLogon\Settings'
$Name         = 'CurrentNewSapLogonView'
$Value        = '2'
# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType String -Force

# ------------------------------------------------------------------------------------------------------------

# Set variables to indicate value and key to set
$RegistryPath = 'HKLM:\Software\SAP\SAPLogon\Settings'
$Name         = 'CurrentNewSapLogonView'
$Value        = '2'
# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType String -Force