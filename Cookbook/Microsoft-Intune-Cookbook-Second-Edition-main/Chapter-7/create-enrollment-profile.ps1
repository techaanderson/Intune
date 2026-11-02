##Set Variables
$name = "macOS Enrollment"
$description = "Corporate Managed macOS Devices"

##Set Token Retrieval URL
$settingsurl = "https://graph.microsoft.com/beta/deviceManagement/depOnboardingSettings/"

##Get Token ID
$tokenid = (Invoke-MgGraphRequest -Method GET -Uri $settingsurl -OutputType PSObject).value.id
write-host "Token ID: $tokenid"

##Set Profile URL
$url = "https://graph.microsoft.com/beta/deviceManagement/depOnboardingSettings/$tokenid/enrollmentProfiles"

##Populate JSON
$json = @"
{
	"@odata.type": "#microsoft.graph.depMacOSEnrollmentProfile",
	"accessibilityScreenDisabled": true,
	"appleIdDisabled": true,
	"applePayDisabled": true,
	"autoUnlockWithWatchDisabled": true,
	"chooseYourLockScreenDisabled": true,
	"configurationEndpointUrl": "",
	"configurationWebUrl": true,
	"description": "$description",
	"diagnosticsDisabled": true,
	"displayName": "$name",
	"displayToneSetupDisabled": true,
	"dontAutoPopulatePrimaryAccountInfo": false,
	"enableAuthenticationViaCompanyPortal": false,
	"enabledSkipKeys": [
		"Location",
		"TOS",
		"Biometric",
		"Payment",
		"Siri",
		"Privacy",
		"AppleID",
		"DisplayTone",
		"ScreenTime",
		"Diagnostics",
		"Restore",
		"TermsOfAddress",
		"Intelligence",
		"Registration",
		"FileVault",
		"iCloudDiagnostics",
		"iCloudStorage",
		"Appearance",
		"Accessibility",
		"UnlockWithWatch",
		"EnableLockdownMode",
		"Wallpaper"
	],
	"enableRestrictEditing": true,
	"fileVaultDisabled": true,
	"iCloudDiagnosticsDisabled": true,
	"iCloudStorageDisabled": true,
	"id": "",
	"isMandatory": true,
	"locationDisabled": true,
	"primaryAccountFullName": "{{username}}",
	"primaryAccountUserName": "{{partialupn}}",
	"privacyPaneDisabled": true,
	"profileRemovalDisabled": true,
	"registrationDisabled": true,
	"requireCompanyPortalOnSetupAssistantEnrolledDevices": false,
	"requiresUserAuthentication": true,
	"restoreBlocked": true,
	"screenTimeScreenDisabled": true,
	"siriDisabled": true,
	"skipPrimarySetupAccountCreation": false,
	"supervisedModeEnabled": true,
	"supportDepartment": "IT Department",
	"supportPhoneNumber": "IT Department",
	"termsAndConditionsDisabled": true,
	"touchIdDisabled": true,
	"waitForDeviceConfiguredConfirmation": true
}
"@

##Create Profile
write-host "Creating Profile"
$macosprofile = Invoke-MgGraphRequest -Method POST -Uri $url -Body $json -ContentType "application/json" -OutputType PSObject
write-host "Profile Created"

##Get Profile ID
$profileid = $macosprofile.id
write-host "Profile ID: $profileid"

##Set Default Profile URL
$defaulturl = "https://graph.microsoft.com/beta/deviceManagement/depOnboardingSettings/$tokenid/enrollmentProfiles/$profileid/setDefaultProfile"

##Set Default Profile
write-host "Setting Default Profile"
Invoke-MgGraphRequest -Method POST -Uri $defaulturl -ContentType "application/json" -OutputType PSObject
write-host "Default Profile Set"