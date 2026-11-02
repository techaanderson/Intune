$name = "Platform SSO"
$description = "Platform SSO"
$groupid = "00000000-0000-0000-0000-000000000000"
$posturl = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies"


$json = 
@"
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
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
								"settingDefinitionId": "com.apple.extensiblesso_extensionidentifier",
								"simpleSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
									"value": "com.microsoft.CompanyPortalMac.ssoextension"
								}
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
													"value": "com.apple.extensiblesso_platformsso_authenticationmethod_1"
												},
												"settingDefinitionId": "com.apple.extensiblesso_platformsso_authenticationmethod"
											},
											{
												"@odata.type": "#microsoft.graph.deviceManagementConfigurationGroupSettingCollectionInstance",
												"groupSettingCollectionValue": [
													{
														"children": [
															{
																"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
																"settingDefinitionId": "com.apple.extensiblesso_platformsso_tokentousermapping_accountname",
																"simpleSettingValue": {
																	"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
																	"value": "preferred_username"
																}
															},
															{
																"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
																"settingDefinitionId": "com.apple.extensiblesso_platformsso_tokentousermapping_fullname",
																"simpleSettingValue": {
																	"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
																	"value": "name"
																}
															}
														]
													}
												],
												"settingDefinitionId": "com.apple.extensiblesso_platformsso_tokentousermapping"
											},
											{
												"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
												"choiceSettingValue": {
													"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
													"children": [],
													"value": "com.apple.extensiblesso_platformsso_useshareddevicekeys_true"
												},
												"settingDefinitionId": "com.apple.extensiblesso_platformsso_useshareddevicekeys"
											}
										]
									}
								],
								"settingDefinitionId": "com.apple.extensiblesso_platformsso"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
								"settingDefinitionId": "com.apple.extensiblesso_registrationtoken",
								"simpleSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
									"value": "{{DEVICEREGISTRATION}}"
								}
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "com.apple.extensiblesso_screenlockedbehavior_0"
								},
								"settingDefinitionId": "com.apple.extensiblesso_screenlockedbehavior"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
								"settingDefinitionId": "com.apple.extensiblesso_teamidentifier",
								"simpleSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
									"value": "UBF8T346G9"
								}
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "com.apple.extensiblesso_type_1"
								},
								"settingDefinitionId": "com.apple.extensiblesso_type"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingCollectionInstance",
								"settingDefinitionId": "com.apple.extensiblesso_urls",
								"simpleSettingCollectionValue": [
									{
										"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
										"value": "https://login.microsoftonline.com"
									},
									{
										"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
										"value": "https://login.microsoft.com"
									},
									{
										"@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
										"value": "https://sts.windows.net"
									}
								]
							}
						]
					}
				],
				"settingDefinitionId": "com.apple.extensiblesso_com.apple.extensiblesso"
			}
		}
	],
	"technologies": "mdm,appleRemoteManagement"
}
"@

$policy = Invoke-MgGraphRequest -Method POST -Uri $posturl -Body $json -ContentType "application/json" -OutputType PSObject
$policyid = $policy.id

$assignurl = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies('$policyid')/assign"

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

Invoke-MgGraphRequest -Method POST -Uri $assignurl -Body $assignjson -ContentType "application/json" -OutputType PSObject