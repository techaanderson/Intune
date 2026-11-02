##Set Variables
$url = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies"
$name = "macOS Updates"
$description = "Managed updates on macOS devices"
$groupid = "000000-0000-0000-0000-000000000000"

##Populate JSON for Immediate Updates
$json = @"
{
	"description": "$description",
	"name": "$name",
	"platforms": "macOS",
	"roleScopeTagIds": [
		"0"
	],
	"settings": [
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationGroupSettingCollectionInstance",
				"groupSettingCollectionValue": [
					{
						"children": [
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [
										{
											"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
											"settingDefinitionId": "ddm-latestsoftwareupdate_delayindays",
											"simpleSettingValue": {
												"@odata.type": "#microsoft.graph.deviceManagementConfigurationIntegerSettingValue",
												"value": 1
											}
										},
										{
											"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
											"settingDefinitionId": "ddm-latestsoftwareupdate_installtime",
											"simpleSettingValue": {
												"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
												"value": "00:00"
											}
										}
									],
									"value": "ddm-latestsoftwareupdate_enforcelatestsoftwareupdateversion_0"
								},
								"settingDefinitionId": "ddm-latestsoftwareupdate_enforcelatestsoftwareupdateversion"
							}
						]
					}
				],
				"settingDefinitionId": "ddm-latestsoftwareupdate_ddm-latestsoftwareupdate"
			}
		},
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
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
									"value": "softwareupdate_allowstandarduserosupdates_false"
								},
								"settingDefinitionId": "softwareupdate_allowstandarduserosupdates"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationGroupSettingCollectionInstance",
								"groupSettingCollectionValue": [
									{
										"children": [
											{
												"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
												"choiceSettingValue": {
													"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
													"children": [],
													"value": "softwareupdate_automaticactions_download_1"
												},
												"settingDefinitionId": "softwareupdate_automaticactions_download"
											},
											{
												"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
												"choiceSettingValue": {
													"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
													"children": [],
													"value": "softwareupdate_automaticactions_installosupdates_1"
												},
												"settingDefinitionId": "softwareupdate_automaticactions_installosupdates"
											},
											{
												"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
												"choiceSettingValue": {
													"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
													"children": [],
													"value": "softwareupdate_automaticactions_installsecurityupdate_1"
												},
												"settingDefinitionId": "softwareupdate_automaticactions_installsecurityupdate"
											}
										]
									}
								],
								"settingDefinitionId": "softwareupdate_automaticactions"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "softwareupdate_notifications_true"
								},
								"settingDefinitionId": "softwareupdate_notifications"
							}
						]
					}
				],
				"settingDefinitionId": "softwareupdate_softwareupdate"
			}
		}
	],
	"technologies": "mdm,appleRemoteManagement"
}
"@

##Create Policy
write-host "Creating Policy"
$policy = Invoke-MgGraphRequest -Uri $url -Method Post -Body $json -ContentType "application/json" -OutputType PSObject
write-host "Policy Created"

##Get Policy ID
$policyid = $policy.id
write-host "Policy ID: $policyid"

##Populate assignment URL
$assignurl = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies/$policyid/assign"

##Populate assignment JSON
$assignjson = @"
{
	"assignments": [
		{
			"target": {
				"@odata.type": "#microsoft.graph.groupAssignmentTarget",
				"groupId": "$groupid"
			}
		}
	]
}
"@

##Assign Policy
write-host "Assigning Policy"
Invoke-MgGraphRequest -Uri $assignurl -Method Post -Body $assignjson -ContentType "application/json"
write-host "Policy Assigned"
