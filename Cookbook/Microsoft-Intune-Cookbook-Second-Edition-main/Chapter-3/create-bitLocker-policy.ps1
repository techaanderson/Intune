##Set the Group ID
$groupid = "00000000000000000000"
$policyname = "BitLocker Encryption Policy"
$policydescription = "This policy enables BitLocker encryption on Windows 10 devices, ensuring that drives are encrypted with 256-bit AES encryption. It allows standard users to encrypt drives and requires recovery information to be stored in Azure AD."

##Set the URL
$uri = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies"


##Populate the JSON
write-host "Populating JSON"
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
					"children": [],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "86da5fa5-67cf-48d1-8215-8787a9900ae6"
					},
					"value": "device_vendor_msft_bitlocker_requiredeviceencryption_1"
				},
				"settingDefinitionId": "device_vendor_msft_bitlocker_requiredeviceencryption",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "20ec1f6e-0d7a-4b6f-9a4f-9ed33e69ce51"
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
									"settingValueTemplateId": "7d348597-0f2a-43db-9fad-8b55c4f89bfe"
								},
								"value": "device_vendor_msft_bitlocker_allowstandarduserencryption_1"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_allowstandarduserencryption"
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "7d348597-0f2a-43db-9fad-8b55c4f89bfe"
					},
					"value": "device_vendor_msft_bitlocker_allowwarningforotherdiskencryption_0"
				},
				"settingDefinitionId": "device_vendor_msft_bitlocker_allowwarningforotherdiskencryption",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "e40531ee-2225-406b-b07b-1c17186c088c"
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
						"settingValueTemplateId": "48278072-3b30-48e9-b654-ad683fdb9aae"
					},
					"value": "device_vendor_msft_bitlocker_configurerecoverypasswordrotation_2"
				},
				"settingDefinitionId": "device_vendor_msft_bitlocker_configurerecoverypasswordrotation",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "48c938a7-afa0-40ef-914f-40b5da5735b4"
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
									"settingValueTemplateId": "7cd99564-6bd0-42c8-be6a-5d92c6c1faaf"
								},
								"value": "device_vendor_msft_bitlocker_encryptionmethodbydrivetype_encryptionmethodwithxtsfdvdropdown_name_7"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_encryptionmethodbydrivetype_encryptionmethodwithxtsfdvdropdown_name"
						},
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
							"choiceSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
								"children": [],
								"settingValueTemplateReference": {
									"settingValueTemplateId": "7cd99564-6bd0-42c8-be6a-5d92c6c1faaf"
								},
								"value": "device_vendor_msft_bitlocker_encryptionmethodbydrivetype_encryptionmethodwithxtsosdropdown_name_7"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_encryptionmethodbydrivetype_encryptionmethodwithxtsosdropdown_name"
						},
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
							"choiceSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
								"children": [],
								"settingValueTemplateReference": {
									"settingValueTemplateId": "7cd99564-6bd0-42c8-be6a-5d92c6c1faaf"
								},
								"value": "device_vendor_msft_bitlocker_encryptionmethodbydrivetype_encryptionmethodwithxtsrdvdropdown_name_4"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_encryptionmethodbydrivetype_encryptionmethodwithxtsrdvdropdown_name"
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "7cd99564-6bd0-42c8-be6a-5d92c6c1faaf"
					},
					"value": "device_vendor_msft_bitlocker_encryptionmethodbydrivetype_1"
				},
				"settingDefinitionId": "device_vendor_msft_bitlocker_encryptionmethodbydrivetype",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "d1625438-8db8-424f-b605-cf001b7a2f97"
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
									"settingValueTemplateId": "54f346c7-008f-421c-bcb5-40f822bb97fe"
								},
								"value": "device_vendor_msft_bitlocker_systemdrivesencryptiontype_osencryptiontypedropdown_name_1"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_systemdrivesencryptiontype_osencryptiontypedropdown_name"
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "54f346c7-008f-421c-bcb5-40f822bb97fe"
					},
					"value": "device_vendor_msft_bitlocker_systemdrivesencryptiontype_1"
				},
				"settingDefinitionId": "device_vendor_msft_bitlocker_systemdrivesencryptiontype",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "d3e31794-1ce6-4572-ab0c-0c0f9200a509"
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
								"value": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication_configurenontpmstartupkeyusage_name_0"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication_configurenontpmstartupkeyusage_name"
						},
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
							"choiceSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
								"children": [],
								"value": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication_configuretpmpinkeyusagedropdown_name_2"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication_configuretpmpinkeyusagedropdown_name"
						},
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
							"choiceSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
								"children": [],
								"value": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication_configuretpmstartupkeyusagedropdown_name_2"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication_configuretpmstartupkeyusagedropdown_name"
						},
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
							"choiceSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
								"children": [],
								"value": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication_configuretpmusagedropdown_name_2"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication_configuretpmusagedropdown_name"
						},
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
							"choiceSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
								"children": [],
								"settingValueTemplateReference": {
									"settingValueTemplateId": "f742e25d-2f09-41f7-9556-6af75960f42b"
								},
								"value": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication_configurepinusagedropdown_name_0"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication_configurepinusagedropdown_name"
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "f742e25d-2f09-41f7-9556-6af75960f42b"
					},
					"value": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication_1"
				},
				"settingDefinitionId": "device_vendor_msft_bitlocker_systemdrivesrequirestartupauthentication",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "a5673a18-196d-49a0-a460-a8f35b807b45"
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
									"settingValueTemplateId": "bdc82022-1c59-49a3-ac69-50e329650297"
								},
								"value": "device_vendor_msft_bitlocker_fixeddrivesencryptiontype_fdvencryptiontypedropdown_name_1"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_fixeddrivesencryptiontype_fdvencryptiontypedropdown_name"
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "bdc82022-1c59-49a3-ac69-50e329650297"
					},
					"value": "device_vendor_msft_bitlocker_fixeddrivesencryptiontype_1"
				},
				"settingDefinitionId": "device_vendor_msft_bitlocker_fixeddrivesencryptiontype",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "85a47676-5027-4b14-9f99-e4625728244a"
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
						"settingValueTemplateId": "ddfd6c77-f32f-480c-a43d-4970185ccf15"
					},
					"value": "device_vendor_msft_bitlocker_fixeddrivesrequireencryption_1"
				},
				"settingDefinitionId": "device_vendor_msft_bitlocker_fixeddrivesrequireencryption",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "7a47b4f2-0d06-46ea-a88a-9809830be5c8"
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
								"value": "device_vendor_msft_bitlocker_removabledrivesconfigurebde_rdvdisablebde_name_0"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_removabledrivesconfigurebde_rdvdisablebde_name"
						},
						{
							"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
							"choiceSettingValue": {
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
								"children": [
									{
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
															"settingValueTemplateId": "3a3ef51b-01c4-4f3b-9e63-5e41d351428b"
														},
														"value": "device_vendor_msft_bitlocker_removabledrivesencryptiontype_rdvencryptiontypedropdown_name_1"
													},
													"settingDefinitionId": "device_vendor_msft_bitlocker_removabledrivesencryptiontype_rdvencryptiontypedropdown_name"
												}
											],
											"settingValueTemplateReference": {
												"settingValueTemplateId": "3a3ef51b-01c4-4f3b-9e63-5e41d351428b"
											},
											"value": "device_vendor_msft_bitlocker_removabledrivesencryptiontype_1"
										},
										"settingDefinitionId": "device_vendor_msft_bitlocker_removabledrivesencryptiontype"
									}
								],
								"settingValueTemplateReference": {
									"settingValueTemplateId": "3a3ef51b-01c4-4f3b-9e63-5e41d351428b"
								},
								"value": "device_vendor_msft_bitlocker_removabledrivesconfigurebde_rdvallowbde_name_1"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_removabledrivesconfigurebde_rdvallowbde_name"
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "3a3ef51b-01c4-4f3b-9e63-5e41d351428b"
					},
					"value": "device_vendor_msft_bitlocker_removabledrivesconfigurebde_1"
				},
				"settingDefinitionId": "device_vendor_msft_bitlocker_removabledrivesconfigurebde",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "5f8b6127-bc7f-469b-b903-ea3d46035448"
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
									"settingValueTemplateId": "06f0b5be-421d-4de1-92d1-b9c9b461fa38"
								},
								"value": "device_vendor_msft_bitlocker_removabledrivesrequireencryption_rdvcrossorg_1"
							},
							"settingDefinitionId": "device_vendor_msft_bitlocker_removabledrivesrequireencryption_rdvcrossorg"
						}
					],
					"settingValueTemplateReference": {
						"settingValueTemplateId": "06f0b5be-421d-4de1-92d1-b9c9b461fa38"
					},
					"value": "device_vendor_msft_bitlocker_removabledrivesrequireencryption_1"
				},
				"settingDefinitionId": "device_vendor_msft_bitlocker_removabledrivesrequireencryption",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "28e5153b-24cb-45fd-b53d-96847b00c9a6"
				}
			}
		}
	],
	"technologies": "mdm",
	"templateReference": {
		"templateId": "46ddfc50-d10f-4867-b852-9434254b3bff_1"
	}
}
"@
write-host "JSON Populated"

# Invoke a POST request to the Microsoft Graph API with the policy JSON data
$policy = Invoke-MgGraphRequest -Method POST -Uri $uri -Body $json -ContentType "application/json" -OutputType PSObject

# Extract the policy ID from the response
$policyid = $policy.id
Write-Output "Policy ID: $policyid"

# Define the URL for the assignment endpoint of the Microsoft Graph API
$assignuri = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies/$policyid/assign"
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