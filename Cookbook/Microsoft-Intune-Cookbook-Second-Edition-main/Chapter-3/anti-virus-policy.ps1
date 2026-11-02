##Set Group ID
$groupid = "0000000000000000000000000"

$policyname = "Anti-Virus Policy"
$policydescription = "Default AV policy"

##Set URL
$policyurl = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies"

##Populate JSON
write-host "Populating JSON"
$policyjson = @"
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
						"settingValueTemplateId": "9ead75d4-6f30-4bc5-8cc5-ab0f999d79f0"
					},
					"value": "device_vendor_msft_policy_config_defender_allowarchivescanning_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowarchivescanning",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "7c5c9cde-f74d-4d11-904f-de4c27f72d89"
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
						"settingValueTemplateId": "905921da-95e2-4a10-9e30-fe5540002ce1"
					},
					"value": "device_vendor_msft_policy_config_defender_allowbehaviormonitoring_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowbehaviormonitoring",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "8eef615a-1aa0-46f4-a25a-12cbe65de5ab"
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
						"settingValueTemplateId": "16fe8afd-67be-4c50-8619-d535451a500c"
					},
					"value": "device_vendor_msft_policy_config_defender_allowcloudprotection_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowcloudprotection",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "7da139f1-9b7e-407d-853a-c2e5037cdc70"
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
						"settingValueTemplateId": "fdf107fd-e13b-4507-9d8f-db4d93476af9"
					},
					"value": "device_vendor_msft_policy_config_defender_allowemailscanning_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowemailscanning",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "b0d9ee81-de6a-4750-86d7-9397961c9852"
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
						"settingValueTemplateId": "3e920b10-3773-4ac5-957e-e5573aec6d04"
					},
					"value": "device_vendor_msft_policy_config_defender_allowfullscanonmappednetworkdrives_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowfullscanonmappednetworkdrives",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "dac47505-f072-48d6-9f23-8d93262d58ed"
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
						"settingValueTemplateId": "366c5727-629b-4a81-b50b-52f90282fa2c"
					},
					"value": "device_vendor_msft_policy_config_defender_allowfullscanremovabledrivescanning_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowfullscanremovabledrivescanning",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "fb36e70b-5bc9-488a-a949-8ea3ac1634d5"
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
						"settingValueTemplateId": "df4e6cbd-f7ff-41c8-88cd-fa25264a237e"
					},
					"value": "device_vendor_msft_policy_config_defender_allowioavprotection_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowioavprotection",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "fa06231d-aed4-4601-b631-3a37e85b62a0"
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
						"settingValueTemplateId": "0492c452-1069-4b91-9363-93b8e006ab12"
					},
					"value": "device_vendor_msft_policy_config_defender_allowrealtimemonitoring_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowrealtimemonitoring",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "f0790e28-9231-4d37-8f44-84bb47ca1b3e"
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
						"settingValueTemplateId": "7b8c858c-a17d-4623-9e20-f34b851670ce"
					},
					"value": "device_vendor_msft_policy_config_defender_allowscanningnetworkfiles_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowscanningnetworkfiles",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "f8f28442-0a6b-4b52-b42c-d31d9687c1cf"
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
						"settingValueTemplateId": "ab9e4320-c953-4067-ac9a-be2becd06b4a"
					},
					"value": "device_vendor_msft_policy_config_defender_allowscriptscanning_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowscriptscanning",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "000cf176-949c-4c08-a5d4-90ed43718db7"
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
						"settingValueTemplateId": "4b6c9739-4449-4006-8e5f-3049136470ea"
					},
					"value": "device_vendor_msft_policy_config_defender_allowuseruiaccess_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowuseruiaccess",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "0170a900-b0bc-4ccc-b7ce-dda9be49189b"
				}
			}
		},
		{
			"@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
			"settingInstance": {
				"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_avgcpuloadfactor",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "816cc03e-8f96-4cba-b14f-2658d031a79a"
				},
				"simpleSettingValue": {
					"@odata.type": "#microsoft.graph.deviceManagementConfigurationIntegerSettingValue",
					"settingValueTemplateReference": {
						"settingValueTemplateId": "37195fb1-3743-4c8e-a0ce-b6fae6fa3acd"
					},
					"value": 50
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
						"settingValueTemplateId": "010779d1-edd4-441d-8034-89ad57a863fe"
					},
					"value": "device_vendor_msft_policy_config_defender_checkforsignaturesbeforerunningscan_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_checkforsignaturesbeforerunningscan",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "4fea56e3-7bb6-4ad3-88c6-e364dd2f97b9"
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
						"settingValueTemplateId": "517b4e84-e933-42b9-b92f-00e640b1a82d"
					},
					"value": "device_vendor_msft_policy_config_defender_cloudblocklevel_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_cloudblocklevel",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "c7a37009-c16e-4145-84c8-89a8c121fb15"
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
						"settingValueTemplateId": "045a4a13-deee-4e24-9fe4-985c9357680d"
					},
					"value": "device_vendor_msft_policy_config_defender_enablelowcpupriority_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_enablelowcpupriority",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "cdeb96cf-18f5-4477-a710-0ea9ecc618af"
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
						"settingValueTemplateId": "ee58fb51-9ae5-408b-9406-b92b643f388a"
					},
					"value": "device_vendor_msft_policy_config_defender_enablenetworkprotection_2"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_enablenetworkprotection",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "f53ab20e-8af6-48f5-9fa1-46863e1e517e"
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
						"settingValueTemplateId": "1b26092f-48c4-447b-99d4-e9c501542f1c"
					},
					"value": "device_vendor_msft_policy_config_defender_disablecatchupfullscan_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_disablecatchupfullscan",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "f881b08c-f047-40d2-b7d9-3dde7ce9ef64"
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
						"settingValueTemplateId": "d263ced7-0d23-4095-9326-99c8b3f5d35b"
					},
					"value": "device_vendor_msft_policy_config_defender_disablecatchupquickscan_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_disablecatchupquickscan",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "dabf6781-9d5d-42da-822a-d4327aa2bdd1"
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
						"settingValueTemplateId": "2d790211-18cb-4e32-b8cc-97407e2c0b45"
					},
					"value": "device_vendor_msft_policy_config_defender_puaprotection_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_puaprotection",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "c0135c2a-f802-44f4-9b71-b0b976411b8c"
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
						"settingValueTemplateId": "6b4e3497-cfbb-4761-a152-de935bbf3f07"
					},
					"value": "device_vendor_msft_policy_config_defender_realtimescandirection_0"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_realtimescandirection",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "f5ff00a4-e5c7-44cf-a650-9c7619ff1561"
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
						"settingValueTemplateId": "70c8f42e-ee6a-4ef1-a070-cb0e9d472581"
					},
					"value": "device_vendor_msft_policy_config_defender_scanparameter_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_scanparameter",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "27ca2652-46f3-4cc7-83f2-bf85ff722d84"
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
						"settingValueTemplateId": "826ed4b6-e04f-4975-9d23-6f0904b0d87e"
					},
					"value": "device_vendor_msft_policy_config_defender_submitsamplesconsent_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_submitsamplesconsent",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "bc47ce7d-a251-4cae-a8a2-6e8384904ab7"
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
						"settingValueTemplateId": "3a9774b2-3143-47eb-bbca-d73c0ace2b7e"
					},
					"value": "device_vendor_msft_defender_configuration_disablelocaladminmerge_0"
				},
				"settingDefinitionId": "device_vendor_msft_defender_configuration_disablelocaladminmerge",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "5f9a9c65-dea7-4987-a5f5-b28cfd9762ba"
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
						"settingValueTemplateId": "ed077fee-9803-44f3-b045-aab34d8e6d52"
					},
					"value": "device_vendor_msft_policy_config_defender_allowonaccessprotection_1"
				},
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_allowonaccessprotection",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "afbc322b-083c-4281-8242-ebbb91398b41"
				}
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
									"settingValueTemplateReference": {
										"settingValueTemplateId": "764256b4-e4d7-46d9-bbc8-003bf23591a1"
									},
									"value": "device_vendor_msft_policy_config_defender_threatseveritydefaultaction_highseveritythreats_quarantine"
								},
								"settingDefinitionId": "device_vendor_msft_policy_config_defender_threatseveritydefaultaction_highseveritythreats",
								"settingInstanceTemplateReference": {
									"settingInstanceTemplateId": "f55b8c9c-d831-460e-a041-e47e29f2aa17"
								}
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "device_vendor_msft_policy_config_defender_threatseveritydefaultaction_severethreats_remove"
								},
								"settingDefinitionId": "device_vendor_msft_policy_config_defender_threatseveritydefaultaction_severethreats"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "device_vendor_msft_policy_config_defender_threatseveritydefaultaction_lowseveritythreats_clean"
								},
								"settingDefinitionId": "device_vendor_msft_policy_config_defender_threatseveritydefaultaction_lowseveritythreats"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "device_vendor_msft_policy_config_defender_threatseveritydefaultaction_moderateseveritythreats_clean"
								},
								"settingDefinitionId": "device_vendor_msft_policy_config_defender_threatseveritydefaultaction_moderateseveritythreats"
							}
						]
					}
				],
				"settingDefinitionId": "device_vendor_msft_policy_config_defender_threatseveritydefaultaction",
				"settingInstanceTemplateReference": {
					"settingInstanceTemplateId": "f6394bc5-6486-4728-b510-555f5c161f2b"
				}
			}
		}
	],
	"technologies": "mdm,microsoftSense",
	"templateReference": {
		"templateId": "804339ad-1553-4478-a742-138fb5807418_1"
	}
}
"@
write-host "JSON Populated"

##Create policy
write-host "Creating Policy"
$policy = Invoke-MgGraphRequest -Method POST -Uri $policyurl -Body $policyjson -ContentType "application/json" -OutputType PSObject
write-host "Policy created"

##Grab ID
$policyid = $policy.id
write-host "Policy ID is $policyid"
##Set assignment URL
$assignurl = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies/$policyid/assign"

##Populate JSON
write-host "Populating assignment JSON"
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
write-host "JSON Populated"

##Assign policy
write-host "Assigning Policy"
Invoke-MgGraphRequest -Method POST -Uri $assignurl -Body $assignjson -ContentType "application/json"
write-host "Policy Assigned"
