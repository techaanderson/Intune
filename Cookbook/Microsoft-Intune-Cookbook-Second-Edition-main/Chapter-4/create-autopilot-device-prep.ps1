$name = " Autopilot Device Preparation Policy"
$description = "Device Preparation Policy for Autopilot"
$createurl = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies"
$appid = "00000000-0000-0000-0000-000000000000"
$scriptid = "00000000-0000-0000-0000-000000000000"
$devicegroupid = "00000000-0000-0000-0000-000000000000" 
$usergroupid = "00000000-0000-0000-0000-000000000000" 
$json = @"
    {
	"description": "$description",
	"name": "$name",
	"platforms": "windows10",
	"roleScopeTagIds": [
		"0"
	],
	"settings": [
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
				"choiceSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
					"children": [],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "5874c2f6-bcf1-463b-a9eb-bee64e2f2d82"
					},
					"value": "enrollment_autopilot_dpp_deploymentmode_0"
				},
				"settingDefinitionId": "enrollment_autopilot_dpp_deploymentmode",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "5180aeab-886e-4589-97d4-40855c646315"
				}
			}
		},
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
				"choiceSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
					"children": [],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "e0af022f-37f3-4a40-916d-1ab7281c88d9"
					},
					"value": "enrollment_autopilot_dpp_deploymenttype_0"
				},
				"settingDefinitionId": "enrollment_autopilot_dpp_deploymenttype",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "f4184296-fa9f-4b67-8b12-1723b3f8456b"
				}
			}
		},
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
				"choiceSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
					"children": [],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "1fa84eb3-fcfa-4ed6-9687-0f3d486402c4"
					},
					"value": "enrollment_autopilot_dpp_jointype_0"
				},
				"settingDefinitionId": "enrollment_autopilot_dpp_jointype",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "6310e95d-6cfa-4d2f-aae0-1e7af12e2182"
				}
			}
		},
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
				"choiceSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
					"children": [],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "bf13bb47-69ef-4e06-97c1-50c2859a49c2"
					},
					"value": "enrollment_autopilot_dpp_accountype_1"
				},
				"settingDefinitionId": "enrollment_autopilot_dpp_accountype",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "d4f2a840-86d5-4162-9a08-fa8cc608b94e"
				}
			}
		},
		{
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
				"settingDefinitionId": "enrollment_autopilot_dpp_timeout",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "6dec0657-dfb8-4906-a7ee-3ac6ee1edecb"
				},
				"simpleSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationIntegerSettingValue",
					"settingValueTemplateReference": {
						"settingValueTemplateId": "0bbcce5b-a55a-4e05-821a-94bf576d6cc8"
					},
					"value": 60
				}
			}
		},
		{
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
				"settingDefinitionId": "enrollment_autopilot_dpp_customerrormessage",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "2ddf0619-2b7a-46de-b29b-c6191e9dda6e"
				},
				"simpleSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
					"settingValueTemplateReference": {
						"settingValueTemplateId": "fe5002d5-fbe9-4920-9e2d-26bfc4b4cc97"
					},
					"value": "Contact your organization’s support person for help."
				}
			}
		},
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
				"choiceSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
					"children": [],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "a2323e5e-ac56-4517-8847-b0a6fdb467e7"
					},
					"value": "enrollment_autopilot_dpp_allowskip_1"
				},
				"settingDefinitionId": "enrollment_autopilot_dpp_allowskip",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "2a71dc89-0f17-4ba9-bb27-af2521d34710"
				}
			}
		},
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
				"choiceSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
					"children": [],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "c59d26fd-3460-4b26-b47a-f7e202e7d5a3"
					},
					"value": "enrollment_autopilot_dpp_allowdiagnostics_1"
				},
				"settingDefinitionId": "enrollment_autopilot_dpp_allowdiagnostics",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "e2b7a81b-f243-4abd-bce3-c1856345f405"
				}
			}
		},
		{
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingCollectionInstance",
				"settingDefinitionId": "enrollment_autopilot_dpp_allowedappids",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "70d22a8a-a03c-4f62-b8df-dded3e327639"
				},
				"simpleSettingCollectionValue": [
					{
						"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
						"value": "{\"id\":\"$appid\",\"type\":\"#microsoft.graph.win32LobApp\"}"
					}
				]
			}
		},
		{
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingCollectionInstance",
				"settingDefinitionId": "enrollment_autopilot_dpp_allowedscriptids",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "1bc67702-800c-4271-8fd9-609351cc19cf"
				},
				"simpleSettingCollectionValue": [
					{
						"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
						"value": "$scriptid"
					}
				]
			}
		}
	],
	"technologies": "enrollment",
	"templateReference": {
		"templateId": "80d33118-b7b4-40d8-b15f-81be745e053f_1"
	}
}
"@


$apdppolicy = Invoke-MgGraphRequest -Uri $createurl -Method Post -Body $json -ContentType "application/json" -OutputType PSObject
$policyid = $apdppolicy.id
$settargeturi = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies('$policyid')/setEnrollmentTimeDeviceMembershipTarget"

$settargetjson = @"
{
	"enrollmentTimeDeviceMembershipTargets": [
		{
			"targetId": "$devicegroupid",
			"targetType": "staticSecurityGroup"
		}
	]
}
"@

Invoke-MgGraphRequest -Uri $settargeturi -Method Post -Body $settargetjson -ContentType "application/json" -OutputType PSObject

$assigntargeturi = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies('$policyid')/assign"
$assignjson = @"
{
    "assignments": [
        {
            "target": {
                "@odata.type": "#microsoft.graph.groupAssignmentTarget",
                "groupId": "$usergroupid"
            }
        }
    ]
}
"@
Invoke-MgGraphRequest -Uri $assigntargeturi -Method Post -Body $assignjson -ContentType "application/json" -OutputType PSObject
