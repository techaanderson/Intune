##Set variables
$name = "Windows Update Quality Policy"
$description = "Enables Quality Updates with HotPatch for Autopatch"
$groupid = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
$url = "https://graph.microsoft.com/beta/deviceManagement/windowsQualityUpdatePolicies"


##Populate JSON
write-host "Populating JSON"
$json = @"
{
	"description": "$description",
	"displayName": "$name",
	"hotpatchEnabled": true,
	"roleScopeTagIds": []
}
"@
write-host "JSON populated"


##Create policy
write-host "Creating policy"
$updatepolicy = Invoke-MgGraphRequest -Uri $url -Method Post -Body $json -OutputType PSObject -ContentType "application/json"
write-host "Policy created"

$updatepolicyid = $updatepolicy.id
write-host "Policy ID is $updatepolicyid"

##Set Assignment URL and JSON
$assignurl = "https://graph.microsoft.com/beta/deviceManagement/windowsQualityUpdatePolicies/$updatepolicyid/assign"
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

##Assign
write-host "Assigning policy"
Invoke-MgGraphRequest -Uri $assignurl -Method Post -Body $assignjson -OutputType PSObject -ContentType "application/json"
write-host "Policy assigned"