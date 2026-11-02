# Define the URL for the Microsoft Graph API
$url = "https://graph.microsoft.com/beta/deviceManagement/inventoryPolicies"

Write-Host "URL defined."

# Define the policy name and description
$policyname = "Properties Catalog"
$policydescription = "Battery and BIOS Config"

Write-Host "Policy name and description defined."

# Set the group ID
$EntraGroupID = "xxxxxx-xxxxxxx-xxxxxx"

##Set the JSON
write-host "Setting JSON"
$json = @"
{
	"description": "$policydescription",
	"name": "$policyname",
	"platforms": "windows10",
	"roleScopeTagIds": [
		"0"
	],
	"settings": [
		{
			"@0data.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationGroupSettingCollectionInstance",
				"groupSettingCollectionValue": [
					{
						"children": [
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_battery_instancename_cyclecount_24"
								},
								"settingDefinitionId": "windows_deviceinventory_battery_instancename_cyclecount"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_battery_instancename_designedcapacity_24"
								},
								"settingDefinitionId": "windows_deviceinventory_battery_instancename_designedcapacity"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_battery_instancename_fullchargedcapacity_24"
								},
								"settingDefinitionId": "windows_deviceinventory_battery_instancename_fullchargedcapacity"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_battery_instancename_instancename_24"
								},
								"settingDefinitionId": "windows_deviceinventory_battery_instancename_instancename"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_battery_instancename_manufacturer_24"
								},
								"settingDefinitionId": "windows_deviceinventory_battery_instancename_manufacturer"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_battery_instancename_model_24"
								},
								"settingDefinitionId": "windows_deviceinventory_battery_instancename_model"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_battery_instancename_serialnumber_24"
								},
								"settingDefinitionId": "windows_deviceinventory_battery_instancename_serialnumber"
							}
						]
					}
				],
				"settingDefinitionId": "windows_deviceinventory_battery_instancename"
			}
		},
		{
			"@0data.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationGroupSettingCollectionInstance",
				"groupSettingCollectionValue": [
					{
						"children": [
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_biosinfo_composite_biosname_24"
								},
								"settingDefinitionId": "windows_deviceinventory_biosinfo_composite_biosname"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_biosinfo_composite_manufacturer_24"
								},
								"settingDefinitionId": "windows_deviceinventory_biosinfo_composite_manufacturer"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_biosinfo_composite_releasedatetime_24"
								},
								"settingDefinitionId": "windows_deviceinventory_biosinfo_composite_releasedatetime"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_biosinfo_composite_serialnumber_24"
								},
								"settingDefinitionId": "windows_deviceinventory_biosinfo_composite_serialnumber"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_biosinfo_composite_smbiosversion_24"
								},
								"settingDefinitionId": "windows_deviceinventory_biosinfo_composite_smbiosversion"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_biosinfo_composite_softwareelementid_24"
								},
								"settingDefinitionId": "windows_deviceinventory_biosinfo_composite_softwareelementid"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_biosinfo_composite_softwareelementstate_24"
								},
								"settingDefinitionId": "windows_deviceinventory_biosinfo_composite_softwareelementstate"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_biosinfo_composite_targetoperatingsystem_24"
								},
								"settingDefinitionId": "windows_deviceinventory_biosinfo_composite_targetoperatingsystem"
							}
						]
					}
				],
				"settingDefinitionId": "windows_deviceinventory_biosinfo_composite"
			}
		}
	],
	"technologies": "extensibility"
}
"@
write-host "JSON set."

# Invoke the Microsoft Graph API request and store the response in the $policy variable
$policy = Invoke-MgGraphRequest -Method POST -Uri $url -Body $json -ContentType "application/json" -OutputType PSObject

Write-Host "API request invoked and response stored."

# Extract the policy ID from the response
$policyid = $policy.id

Write-Host "Policy ID extracted from response."

# Define the URL for assigning the policy
$assignurl = "https://graph.microsoft.com/beta/deviceManagement/inventoryPolicies('$policyid')/assign"

Write-Host "Assignment URL defined."

# Define the JSON body for the assignment API request
$assignjson = @"
{
    "assignments": [
        {
            "target": {
                "@odata.type": "#microsoft.graph.groupAssignmentTarget",
                "groupId": "$EntraGroupID"
            }
        }
    ]
}
"@

Write-Host "JSON body for assignment defined."

# Invoke the assignment API request
$assign = Invoke-MgGraphRequest -Method POST -Uri $assignurl -Body $assignjson -ContentType "application/json"

Write-Host "Assignment API request invoked."