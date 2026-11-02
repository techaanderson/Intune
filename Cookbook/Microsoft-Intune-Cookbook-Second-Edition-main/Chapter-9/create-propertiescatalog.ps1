$url = "https://graph.microsoft.com/beta/deviceManagement/inventoryPolicies"
$policyname = "Device Query"
$policydescription = "Device Query Policy"
$groupid = "00000000-0000-0000-0000-000000000000"  # Replace with your actual group ID

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
									"value": "windows_deviceinventory_cpu_processorid_addresswidth_24"
								},
								"settingDefinitionId": "windows_deviceinventory_cpu_processorid_addresswidth"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_cpu_processorid_architecture_24"
								},
								"settingDefinitionId": "windows_deviceinventory_cpu_processorid_architecture"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_cpu_processorid_corecount_24"
								},
								"settingDefinitionId": "windows_deviceinventory_cpu_processorid_corecount"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_cpu_processorid_cpustatus_24"
								},
								"settingDefinitionId": "windows_deviceinventory_cpu_processorid_cpustatus"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_cpu_processorid_logicalprocessorcount_24"
								},
								"settingDefinitionId": "windows_deviceinventory_cpu_processorid_logicalprocessorcount"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_cpu_processorid_manufacturer_24"
								},
								"settingDefinitionId": "windows_deviceinventory_cpu_processorid_manufacturer"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_cpu_processorid_maxclockspeed_24"
								},
								"settingDefinitionId": "windows_deviceinventory_cpu_processorid_maxclockspeed"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_cpu_processorid_model_24"
								},
								"settingDefinitionId": "windows_deviceinventory_cpu_processorid_model"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_cpu_processorid_processorid_24"
								},
								"settingDefinitionId": "windows_deviceinventory_cpu_processorid_processorid"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_cpu_processorid_processortype_24"
								},
								"settingDefinitionId": "windows_deviceinventory_cpu_processorid_processortype"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_cpu_processorid_socketdesignation_24"
								},
								"settingDefinitionId": "windows_deviceinventory_cpu_processorid_socketdesignation"
							}
						]
					}
				],
				"settingDefinitionId": "windows_deviceinventory_cpu_processorid"
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
									"value": "windows_deviceinventory_diskdrive_driveid_description_24"
								},
								"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid_description"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_diskdrive_driveid_diskname_24"
								},
								"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid_diskname"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_diskdrive_driveid_driveid_24"
								},
								"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid_driveid"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_diskdrive_driveid_driveindex_24"
								},
								"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid_driveindex"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_diskdrive_driveid_interfacetype_24"
								},
								"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid_interfacetype"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_diskdrive_driveid_manufacturer_24"
								},
								"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid_manufacturer"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_diskdrive_driveid_model_24"
								},
								"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid_model"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_diskdrive_driveid_partitioncount_24"
								},
								"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid_partitioncount"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_diskdrive_driveid_pnpdeviceid_24"
								},
								"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid_pnpdeviceid"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_diskdrive_driveid_serialnumber_24"
								},
								"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid_serialnumber"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_diskdrive_driveid_sizebytes_24"
								},
								"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid_sizebytes"
							}
						]
					}
				],
				"settingDefinitionId": "windows_deviceinventory_diskdrive_driveid"
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
									"value": "windows_deviceinventory_encryptablevolume_volumeid_encryptionmethod_24"
								},
								"settingDefinitionId": "windows_deviceinventory_encryptablevolume_volumeid_encryptionmethod"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_encryptablevolume_volumeid_encryptionpercentage_24"
								},
								"settingDefinitionId": "windows_deviceinventory_encryptablevolume_volumeid_encryptionpercentage"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_encryptablevolume_volumeid_locked_24"
								},
								"settingDefinitionId": "windows_deviceinventory_encryptablevolume_volumeid_locked"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_encryptablevolume_volumeid_persistentvolumeid_24"
								},
								"settingDefinitionId": "windows_deviceinventory_encryptablevolume_volumeid_persistentvolumeid"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_encryptablevolume_volumeid_protectionstatus_24"
								},
								"settingDefinitionId": "windows_deviceinventory_encryptablevolume_volumeid_protectionstatus"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_encryptablevolume_volumeid_volumeid_24"
								},
								"settingDefinitionId": "windows_deviceinventory_encryptablevolume_volumeid_volumeid"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_encryptablevolume_volumeid_windowsdriveletter_24"
								},
								"settingDefinitionId": "windows_deviceinventory_encryptablevolume_volumeid_windowsdriveletter"
							}
						]
					}
				],
				"settingDefinitionId": "windows_deviceinventory_encryptablevolume_volumeid"
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
									"value": "windows_deviceinventory_osversion_singleton_architecture_24"
								},
								"settingDefinitionId": "windows_deviceinventory_osversion_singleton_architecture"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_osversion_singleton_buildversion_24"
								},
								"settingDefinitionId": "windows_deviceinventory_osversion_singleton_buildversion"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_osversion_singleton_installdatetime_24"
								},
								"settingDefinitionId": "windows_deviceinventory_osversion_singleton_installdatetime"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_osversion_singleton_majorversion_24"
								},
								"settingDefinitionId": "windows_deviceinventory_osversion_singleton_majorversion"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_osversion_singleton_minorversion_24"
								},
								"settingDefinitionId": "windows_deviceinventory_osversion_singleton_minorversion"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_osversion_singleton_osname_24"
								},
								"settingDefinitionId": "windows_deviceinventory_osversion_singleton_osname"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_osversion_singleton_osversion_24"
								},
								"settingDefinitionId": "windows_deviceinventory_osversion_singleton_osversion"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_osversion_singleton_patchversion_24"
								},
								"settingDefinitionId": "windows_deviceinventory_osversion_singleton_patchversion"
							}
						]
					}
				],
				"settingDefinitionId": "windows_deviceinventory_osversion_singleton"
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
									"value": "windows_deviceinventory_systemenclosure_serialnumber_audiblealarmequipped_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_audiblealarmequipped"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_breachdescription_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_breachdescription"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_chassistypes_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_chassistypes"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_extendeddescription_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_extendeddescription"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_lockequipped_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_lockequipped"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_manufacturer_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_manufacturer"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_model_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_model"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_securitybreach_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_securitybreach"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_serialnumber_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_serialnumber"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_sku_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_sku"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_smbiosassettag_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_smbiosassettag"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_status_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_status"
							},
							{
								"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
								"choiceSettingValue": {
									"@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingValue",
									"children": [],
									"value": "windows_deviceinventory_systemenclosure_serialnumber_visiblealarmequipped_24"
								},
								"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber_visiblealarmequipped"
							}
						]
					}
				],
				"settingDefinitionId": "windows_deviceinventory_systemenclosure_serialnumber"
			}
		}
	],
	"technologies": "extensibility"
}
"@

$policy = Invoke-MgGraphRequest -Method POST -Uri $url -Body $json -ContentType "application/json"

$policyid = $policy.id

$assignurl = "https://graph.microsoft.com/beta/deviceManagement/inventoryPolicies('$policyid')/assign"

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

Invoke-MgGraphRequest -Method POST -Uri $assignurl -Body $assignjson -ContentType "application/json"