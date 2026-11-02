$policyname = "LAPS-24H2"
$policydescription = "LAPS policy for Windows 24H2"

##Create LAPS policy to use new user account
write-host "Populating JSON"
$lapsurl = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies"
$lapsjson = @"
{
	{
	"description": "$policydescription",
	"name": "$policyname",
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
					"children": [
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
							"settingDefinitionId": "device_vendor_msft_laps_policies_passwordagedays_aad",
							"simpleSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationIntegerSettingValue",
								"value": "30"
							}
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "4d90f03d-e14c-43c4-86da-681da96a2f92"
					},
					"value": "device_vendor_msft_laps_policies_backupdirectory_1"
				},
				"settingDefinitionId": "device_vendor_msft_laps_policies_backupdirectory",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "a3270f64-e493-499d-8900-90290f61ed8a"
				}
			}
		},
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
				"choiceSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
					"children": [
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
							"choiceSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
								"children": [],
								"value": "device_vendor_msft_laps_policies_automaticaccountmanagementtarget_1"
							},
							"settingDefinitionId": "device_vendor_msft_laps_policies_automaticaccountmanagementtarget"
						},
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
							"settingDefinitionId": "device_vendor_msft_laps_policies_automaticaccountmanagementnameorprefix",
							"simpleSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
								"settingValueTemplateReference": {
									"settingValueTemplateId": "5db30960-1e02-4100-9e2c-a2212596b054"
								},
								"value": "PRE"
							}
						},
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
							"choiceSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
								"children": [],
								"settingValueTemplateReference": {
									"settingValueTemplateId": "5db30960-1e02-4100-9e2c-a2212596b054"
								},
								"value": "device_vendor_msft_laps_policies_automaticaccountmanagementrandomizename_true"
							},
							"settingDefinitionId": "device_vendor_msft_laps_policies_automaticaccountmanagementrandomizename"
						},
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
							"choiceSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
								"children": [],
								"settingValueTemplateReference": {
									"settingValueTemplateId": "5db30960-1e02-4100-9e2c-a2212596b054"
								},
								"value": "device_vendor_msft_laps_policies_automaticaccountmanagementenableaccount_true"
							},
							"settingDefinitionId": "device_vendor_msft_laps_policies_automaticaccountmanagementenableaccount"
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "5db30960-1e02-4100-9e2c-a2212596b054"
					},
					"value": "device_vendor_msft_laps_policies_automaticaccountmanagementenabled_true"
				},
				"settingDefinitionId": "device_vendor_msft_laps_policies_automaticaccountmanagementenabled",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "0d70f6fb-8f35-4fba-8ada-494b8a478703"
				}
			}
		},
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
				"choiceSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
					"children": [
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
							"settingDefinitionId": "device_vendor_msft_laps_policies_passphraselength",
							"simpleSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationIntegerSettingValue",
								"value": "6"
							}
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "aa883ab5-625e-4e3b-b830-a37a4bb8ce01"
					},
					"value": "device_vendor_msft_laps_policies_passwordcomplexity_8"
				},
				"settingDefinitionId": "device_vendor_msft_laps_policies_passwordcomplexity",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "8a7459e8-1d1c-458a-8906-7b27d216de52"
				}
			}
		},
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
				"settingDefinitionId": "device_vendor_msft_laps_policies_passwordlength",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "da7a1dbd-caf7-4341-ab63-ece6f994ff02"
				},
				"simpleSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationIntegerSettingValue",
					"settingValueTemplateReference": {
						"settingValueTemplateId": "d08f1266-5345-4f53-8ae1-4c20e6cb5ec9"
					},
					"value": 14
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
						"settingValueTemplateId": "68ff4f78-baa8-4b32-bf3d-5ad5566d8142"
					},
					"value": "device_vendor_msft_laps_policies_postauthenticationactions_11"
				},
				"settingDefinitionId": "device_vendor_msft_laps_policies_postauthenticationactions",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "d9282eb1-d187-42ae-b366-7081f32dcfff"
				}
			}
		}
	],
	"technologies": "mdm",
	"templateReference": {
		"templateId": "adc46e5a-f4aa-4ff6-aeff-4f27bc525796_1"
	}
}
"@

# Invoke a POST request to the Microsoft Graph API with the LAPS JSON data
$lapspolicy = Invoke-MgGraphRequest -Method POST -Uri $lapsurl -Body $lapsjson -ContentType "application/json" -OutputType PSObject

# Extract the LAPS policy ID from the response
$lapspolicyid = $lapspolicy.id
Write-Output "LAPS Policy ID: $lapspolicyid"

# Define the URL for the assignment endpoint of the Microsoft Graph API for the LAPS policy
$lapsassignurl = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies/$lapspolicyid/assign"
Write-Output "LAPS Assignment URL: $lapsassignurl"

# Define the JSON data for the LAPS assignment request
$lapsassignjson = @"
{
    "assignments": [
        {
            "target": {
                "@odata.type": "#microsoft.graph.allDevicesAssignmentTarget"
            }
        }
    ]
}
"@
Write-Output "LAPS Assignment JSON: $lapsassignjson"

# Invoke a POST request to the Microsoft Graph API with the LAPS assignment JSON data
Invoke-MgGraphRequest -Method POST -Uri $lapsassignurl -Body $lapsassignjson -ContentType "application/json"