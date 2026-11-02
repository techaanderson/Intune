
$spid = "f1346770-5b25-470b-88bd-d5744ab7952c"
write-output "Checking if Enterprise App exists"
$lookforsp = get-mgserviceprincipal -filter "AppID eq '$spid'"

if (!$lookforsp) {
    write-output "Enterprise App does not exist, creating"
    $ServicePrincipalId = @{
        "AppId" = "$spid"
    }
   $appregid = New-MgServicePrincipal -BodyParameter $ServicePrincipalId
    write-output "Enterprise App created"
}

##Get app ID
Write-Output "Getting App ID"
if ($lookforsp) {
    $ownerid = $lookforsp.id
}
else {
    $ownerid = $appregid.id
}
write-output "App ID is $ownerid"
##Create device group
write-output "Creating Device Group"
$groupuri = "https://graph.microsoft.com/beta/groups"
$groupjson = @"
{
    "description": "Autopilot DevicePrep Group",
    "displayName": "$DisplayName",
    "mailEnabled": false,
    "mailNickname": "$DisplayName",
    "securityEnabled": true
}
"@
$group = Invoke-MgGraphRequest -Uri $groupuri -Method Post -Body $groupjson -ContentType "application/json" -OutputType PSObject
$groupid = $group.id
write-output "Device Group Created"
##Set owner
write-output "Setting Owner"
$owneruri = "https://graph.microsoft.com/beta/groups/$groupid/owners/`$ref"
$ownerjson = @"
{
    "@odata.id": "https://graph.microsoft.com/beta/directoryObjects/$ownerid"
}
"@
Invoke-MgGraphRequest -uri $owneruri -Method Post -Body $ownerjson -ContentType "application/json" -OutputType PSObject
write-output "Owner set"
