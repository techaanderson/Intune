#Requires -version 7
<#
.SYNOPSIS
  Get users devices from Intune.
.DESCRIPTION
  Retrieve list of users devices from Intune.
.INPUTS
  List of users UPN either from AD or otherwise.
.OUTPUTS
  CSV
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  7/1/2024
  Changes:
    - 
.EXAMPLE
  .\Get-Intune_Devices_UserList.ps1
#>


#---------------------------------------------------------[Initialisations]--------------------------------------------------------

# Install Prerequisites  --------------------------------------------------------------------
Write-Host "Prerequisites:" -ForegroundColor Cyan -BackgroundColor Black
# Verify Microsoft.Graph Module is installed
Write-Host "Verifying Microsoft.Graph Module" -ForegroundColor Yellow -BackgroundColor Black
$RequiredModule = Get-InstalledModule -Name Microsoft.Graph -ErrorAction SilentlyContinue
if (!$RequiredModule) {
    Write-Host "Installing Microsoft.Graph Module..."
    Install-Module -Name Microsoft.Graph -Scope CurrentUser -RequiredVersion 2.5 -Force
}else {
    Write-Host "Microsoft.Graph is already installed"
}

# Connect ----------------------------------------------------------------------------------
# Connect to MS Graph with correct scopes
Write-Host "Connecting to Microsoft Graph" -ForegroundColor Cyan -BackgroundColor Black
$scopes = @(
    "DeviceManagementConfiguration.Read.All",
    "DeviceManagementManagedDevices.Read.All"
)
Connect-MgGraph -Scopes $scopes -NoWelcome

#-----------------------------------------------------------[Execution]------------------------------------------------------------
$dc = "cs1-dc-vm01.ad.he-equipment.com"

### Security Group of Users --------------------------------
#$securityGroup = "TeamViewer Licensed Users"
#$users = Get-ADGroupMember -Server $dc -Identity $SecurityGroup | Get-ADUser | Select-Object name,samaccountname,userprincipalname | Sort-Object UserPrincipalName

### OU of Users --------------------------------------------
$ou = "OU=FIM_ToBeDeletedAccounts,OU=USERS,OU=HE,DC=ad,DC=he-equipment,DC=com"
$users = Get-ADUser -Server $dc -Filter * -SearchBase $ou -Properties UserPrincipalName

## Retrieve all managed devices by UPN of primary user
$data = foreach ($user in $users){
  $UPN = $user.UserPrincipalName
  Get-MgDeviceManagementManagedDevice -Filter "userPrincipalName eq '$UPN'" | Select-Object UserPrincipalName,UserDisplayName,DeviceName,Manufacturer,Model,LastSyncDateTime,OperatingSystem,OSVersion,SerialNumber,ManagedDeviceName,AzureAdDeviceId,AzureAdRegistered,ComplianceState,DeviceEnrollmentType,EnrolledDateTime,IsSupervised,ManagedDeviceOwnerType
}
#$outputcsv = "C:\Users\aanderson\OneDrive - H&E Equipment Services\Documents\_MyDocs\_Temp\$securityGroup-ManagedDevices.csv"
$outputcsv = "C:\Users\aanderson\OneDrive - H&E Equipment Services\Documents\_MyDocs\_Temp\DisabledUsers-ManagedDevices.csv"
$data | Export-Csv -Path $outputcsv

# ### ONE USER -------------------------------------
# $UPN = "aanderson@he-equipment.com"
# Get-MgDeviceManagementManagedDevice -Filter "userPrincipalName eq '$UPN'" | Select-Object UserPrincipalName,UserDisplayName,DeviceName,Manufacturer,Model,LastSyncDateTime,OperatingSystem,OSVersion,SerialNumber,ManagedDeviceName,AzureAdDeviceId,AzureAdRegistered,ComplianceState,DeviceEnrollmentType,EnrolledDateTime,IsSupervised,ManagedDeviceOwnerType
# # Export
# Get-MgDeviceManagementManagedDevice -Filter "userPrincipalName eq '$UPN'" | Select-Object UserPrincipalName,UserDisplayName,DeviceName,Manufacturer,Model,LastSyncDateTime,OperatingSystem,OSVersion,SerialNumber,ManagedDeviceName,AzureAdDeviceId,AzureAdRegistered,ComplianceState,DeviceEnrollmentType,EnrolledDateTime,IsSupervised,ManagedDeviceOwnerType | Export-Csv -Path "C:\Temp\IntuneOutputExample.csv"