# Define the group ID. This is likely a placeholder and should be replaced with a valid ID.
$groupid = "00000000000000000000"
Write-Output "Group ID: $groupid"

$policyname = "Edge Baseline"
$policydescription = "Edge Baseline - Selected Defaults"

# Define the URL for the Microsoft Graph API endpoint for device management templates
$uri = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies"
Write-Output "URI: $uri"

# Define the JSON data for the request
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
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
				"choiceSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
					"children": [
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingCollectionInstance",
							"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~extensions_extensioninstallblocklist_extensioninstallblocklistdesc",
							"settingInstanceTemplateReference": {
								"settingInstanceTemplateId": "26c1a943-562d-4286-b5ff-4b491b9515bc"
							},
							"simpleSettingCollectionValue": [
								{
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
									"value": "*"
								}
							]
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "e9f334db-ca88-4b09-9ccf-d7b9b3142210"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~extensions_extensioninstallblocklist_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~extensions_extensioninstallblocklist",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "fb2f16e0-2804-45a0-9982-fe709d59fef8"
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
						"settingValueTemplateId": "03f73d3f-e150-45b3-9d2e-bac7ab998e54"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edgev88.0.705.23~policy~microsoft_edge~httpauthentication_basicauthoverhttpenabled_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev88.0.705.23~policy~microsoft_edge~httpauthentication_basicauthoverhttpenabled",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "905d4bdc-0216-4ad9-a5b8-6254fa8c914b"
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
							"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~httpauthentication_authschemes_authschemes",
							"settingInstanceTemplateReference": {
								"settingInstanceTemplateId": "7e9d11fe-3d61-4a22-8ed8-6480473faec5"
							},
							"simpleSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
								"settingValueTemplateReference": {
									"settingValueTemplateId": "53d26350-fd8d-4a2e-9ef0-a6cd77217dea"
								},
								"value": "ntlm,negotiate"
							}
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "52012daa-f831-48ad-a327-5c1be8810e16"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~httpauthentication_authschemes_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~httpauthentication_authschemes",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "ed7bb376-0861-4ed0-9a65-49c770373d2e"
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
						"settingValueTemplateId": "f312fe01-d3f1-4716-ac3a-1ead051efef0"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~nativemessaging_nativemessaginguserlevelhosts_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~nativemessaging_nativemessaginguserlevelhosts",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "9bcc84e8-0053-493a-a87e-08d84e0967fa"
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
						"settingValueTemplateId": "e7a7bf01-efb1-4f11-8904-a3fb36b589bf"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edgev92~policy~microsoft_edge~privatenetworkrequestsettings_insecureprivatenetworkrequestsallowed_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev92~policy~microsoft_edge~privatenetworkrequestsettings_insecureprivatenetworkrequestsallowed",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "45407a86-95c9-4968-af31-4038faabcc1c"
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
						"settingValueTemplateId": "6de4eabb-5e3d-45e0-a74c-6f9d810182c4"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~smartscreen_smartscreenenabled_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~smartscreen_smartscreenenabled",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "b8ed5ae9-d2aa-45ee-9a54-022ad4e0966b"
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
						"settingValueTemplateId": "86f52c99-3b8f-4196-b481-8ce9c6c5adfd"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edgev80diff~policy~microsoft_edge~smartscreen_smartscreenpuaenabled_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev80diff~policy~microsoft_edge~smartscreen_smartscreenpuaenabled",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "2a7c641e-09a9-4746-aea3-a773ff63ac28"
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
						"settingValueTemplateId": "953e6274-422c-4fd4-be5b-9a33ec2fd86b"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~smartscreen_preventsmartscreenpromptoverride_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~smartscreen_preventsmartscreenpromptoverride",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "94294557-f4af-49da-b7c8-9ef4a7d9319b"
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
						"settingValueTemplateId": "5ed5e40a-f8d0-4bb7-a3b2-40af75098591"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~smartscreen_preventsmartscreenpromptoverrideforfiles_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~smartscreen_preventsmartscreenpromptoverrideforfiles",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "32bab315-ed28-4b2f-8925-cfdead92ab2d"
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
						"settingValueTemplateId": "13542032-04ea-4bcb-9ea5-e59123d31d2e"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edgev96~policy~microsoft_edge~typosquattingchecker_typosquattingcheckerenabled_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev96~policy~microsoft_edge~typosquattingchecker_typosquattingcheckerenabled",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "7a2df044-f9ff-4f9e-9bc8-175f4429525f"
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
						"settingValueTemplateId": "3614b1ed-85ca-4556-a093-21cacb4d03c0"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edgev92~policy~microsoft_edge_internetexplorerintegrationreloadiniemodeallowed_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev92~policy~microsoft_edge_internetexplorerintegrationreloadiniemodeallowed",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "7f882cda-1391-45a0-bea9-611d19c2cbb1"
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
						"settingValueTemplateId": "b165ab66-5a07-42be-b42e-9607190c4053"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_sslerroroverrideallowed_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_sslerroroverrideallowed",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "165783d7-e9e4-4f8d-851c-017162497b81"
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
						"settingValueTemplateId": "8478b691-af31-4b41-ba55-7818ceb947bd"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edgev117~policy~microsoft_edge_internetexplorerintegrationzoneidentifiermhtfileallowed_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev117~policy~microsoft_edge_internetexplorerintegrationzoneidentifiermhtfileallowed",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "57a25f73-fd61-40d7-a8a3-f8b976a5a0e3"
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
								"settingValueTemplateReference": {
									"settingValueTemplateId": "90dcb447-496d-4868-8037-bc4bb0b1dd68"
								},
								"value": "device_vendor_msft_policy_config_microsoft_edgev128~policy~microsoft_edge_dynamiccodesettings_dynamiccodesettings_0"
							},
							"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev128~policy~microsoft_edge_dynamiccodesettings_dynamiccodesettings",
							"settingInstanceTemplateReference": {
								"settingInstanceTemplateId": "6edbc641-3108-46b4-8c7a-b8ab340a652b"
							}
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "1ff75ff2-8c0f-45e7-9133-a2d6b915e782"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edgev128~policy~microsoft_edge_dynamiccodesettings_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev128~policy~microsoft_edge_dynamiccodesettings",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "7c825904-acd9-40cf-82cb-5d14eb0c7367"
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
						"settingValueTemplateId": "0758a458-c64b-409e-bd31-57768aba3b5b"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edgev128.1~policy~microsoft_edge_applicationboundencryptionenabled_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev128.1~policy~microsoft_edge_applicationboundencryptionenabled",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "c57a423b-54ba-4369-9d38-41ebda91aa8a"
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
						"settingValueTemplateId": "4c1ece3a-5e11-4aeb-a82c-69f227293394"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edgev95~policy~microsoft_edge_browserlegacyextensionpointsblockingenabled_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev95~policy~microsoft_edge_browserlegacyextensionpointsblockingenabled",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "9a678b14-190d-42af-990f-8e7124c9af78"
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
						"settingValueTemplateId": "a759b657-83f4-43ac-a8a6-2c040d5df842"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_siteperprocess_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_siteperprocess",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "f826b165-0b22-4d05-b1e1-d0470a78bf4a"
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
						"settingValueTemplateId": "672fda68-bd24-46f5-9ec5-98b7fbb64607"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edgev96~policy~microsoft_edge_internetexplorermodetoolbarbuttonenabled_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev96~policy~microsoft_edge_internetexplorermodetoolbarbuttonenabled",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "84e05adb-804f-434d-9849-a59a61bdf9ef"
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
						"settingValueTemplateId": "91954c3e-3694-4c56-9448-8ff680e5877d"
					},
					"value": "device_vendor_msft_policy_config_microsoft_edgev111~policy~microsoft_edge_sharedarraybufferunrestrictedaccessallowed_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edgev111~policy~microsoft_edge_sharedarraybufferunrestrictedaccessallowed",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "83e120ac-df8e-47ae-9a2d-d3c327018405"
				}
			}
		}
	],
	"technologies": "mdm",
	"templateReference": {
		"templateId": "c66347b7-8325-4954-a235-3bf2233dfbfd_3"
	}
}
"@
Write-Output "JSON: $json"

# Invoke a POST request to the Microsoft Graph API with the JSON data
$policy = Invoke-MgGraphRequest -Method POST -Uri $uri -Body $json -ContentType "application/json" -OutputType PSObject

# Extract the policy ID from the response
$policyid = $policy.id
Write-Output "Policy ID: $policyid"

# Define the URL for the assignment endpoint of the Microsoft Graph API
$assignuri = "https://graph.microsoft.com/beta/deviceManagement/configurationpolicies/$policyid/assign"
Write-Output "Assignment URL: $assignuri"

# Define the JSON data for the assignment request
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
Write-Output "Assignment JSON: $assignjson"

# Invoke a POST request to the Microsoft Graph API with the assignment JSON data
Invoke-MgGraphRequest -Method POST -Uri $assignuri -Body $assignjson -ContentType "application/json"