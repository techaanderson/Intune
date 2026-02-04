<#
.SYNOPSIS
  Edits registry entires to set User default view to "list view"
.DESCRIPTION
  Close saplogon and create or edit registry keys needed to set default list view for the user. This will only affect the current user.
.PARAMETER <Parameter_Name>
  None
.INPUTS
  None
.OUTPUTS
  Registry entries
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  10/17/2022
  Purpose/Change: Initial script development
  Resource: https://answers.sap.com/questions/11578061/sapgui-list-view---sapgui-740.html
  
.EXAMPLE
  .\Set-SAP_DefaultLogonView_User.ps1
#>

# Close saplogon.exe if open
$processname = "saplogon"
Get-Process -Name $processname -ErrorAction SilentlyContinue | Stop-Process

# -----------------------------------------------------------------------------------------------------------

# Set Config XML for "64bit OS" and "64bit SAP GUI for Windows"
# Set variables to indicate value and key to set
$RegistryPath = 'HKCU:\Software\Wow6432Node\SAP\SAPLogon\Settings'
$Name         = 'CurrentNewSapLogonView'
$Value        = '2'
# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType String -Force

# ------------------------------------------------------------------------------------------------------------

# Set Config XML for "32bit/64bit OS" and "32bit SAP GUI for Windows"
# Set variables to indicate value and key to set
$RegistryPath = 'HKCU:\Software\SAP\SAPLogon\Settings'
$Name         = 'CurrentNewSapLogonView'
$Value        = '2'
# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType String -Force