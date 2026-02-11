#Requires -PSEdition Desktop -Version 5

### Required Modules ###
$requiredModules = @('Microsoft.Graph.Intune', 'AzureAD')
foreach ($module in $requiredModules)
{
    if (-not (Get-Module -Name $module -ListAvailable)) 
    {
        Write-Host -ForegroundColor Red "Missing required module " -NoNewline
        Write-Host $module

        $answer = $null
        while(-not ($answer -imatch "y|yes|n|no")) {

            $answer = Read-Host -Prompt "Install ${module}? [y/n]"

            if ($answer -imatch "y|yes") {
                Install-Module -Name $module -Scope CurrentUser -AllowClobber -Force
            } else {
                Write-Host -ForegroundColor Red "Module not installed: "
                Write-Host $module
                Exit
            }
        }
    }

    Import-Module -Name $module -Force
}

#Connect and change the scheme
Connect-MSGraph -ForceInteractive
Update-MSGraphEnvironment -SchemaVersion beta
Connect-MSGraph

#Which group do you want to check?
$groupName = "AAD_Users_SAP GUI Testers"

$Group = Get-AADGroup -Filter "displayname eq '$groupName'"

####Config Start####

Write-host "Azure Active Directory Group: $($Group.displayName)" -ForegroundColor Green

#Apps
$AllAssignedApps = Get-IntuneMobileApp -Filter "isAssigned eq true" -Select id, displayName, lastModifiedDateTime, assignments -Expand assignments | Where-Object {$_.assignments -match $Group.id}
Write-host "Number of Apps found: $($AllAssignedApps.DisplayName.Count)" -ForegroundColor cyan
Foreach ($Config in $AllAssignedApps) {

Write-host $Config.displayName -ForegroundColor Yellow

}

#Device Compliance
$AllDeviceCompliance = Get-IntuneDeviceCompliancePolicy -Select id, displayName, lastModifiedDateTime, assignments -Expand assignments | Where-Object {$_.assignments -match $Group.id}
Write-host "Number of Device Compliance policies found: $($AllDeviceCompliance.DisplayName.Count)" -ForegroundColor cyan
Foreach ($Config in $AllDeviceCompliance) {

Write-host $Config.displayName -ForegroundColor Yellow

}

#Device Configuration
$AllDeviceConfig = Get-IntuneDeviceConfigurationPolicy -Select id, displayName, lastModifiedDateTime, assignments -Expand assignments | Where-Object {$_.assignments -match $Group.id}
Write-host "Number of Device Configurations found: $($AllDeviceConfig.DisplayName.Count)" -ForegroundColor cyan
Foreach ($Config in $AllDeviceConfig) {

Write-host $Config.displayName -ForegroundColor Yellow

}

#Device Configuration Powershell Scripts
$Resource = "deviceManagement/deviceManagementScripts"
$graphApiVersion = "Beta"
$uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)?`$expand=groupAssignments"
$DMS = Invoke-MSGraphRequest -HttpMethod GET -Url $uri
$AllDeviceConfigScripts = $DMS.value | Where-Object {$_.assignments -match $Group.id}
Write-host "Number of Device Configurations Powershell Scripts found: $($AllDeviceConfigScripts.DisplayName.Count)" -ForegroundColor cyan

Foreach ($Config in $AllDeviceConfigScripts) {

Write-host $Config.displayName -ForegroundColor Yellow

}

#Administrative templates
$Resource = "deviceManagement/groupPolicyConfigurations"
$graphApiVersion = "Beta"
$uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)?`$expand=Assignments"
$ADMT = Invoke-MSGraphRequest -HttpMethod GET -Url $uri
$AllADMT = $ADMT.value | Where-Object {$_.assignments -match $Group.id}
Write-host "Number of Device Administrative Templates found: $($AllADMT.DisplayName.Count)" -ForegroundColor cyan
Foreach ($Config in $AllADMT) {

Write-host $Config.displayName -ForegroundColor Yellow

 

}

####Config End####