$token = "12333102-cWBdrEQupCYo726o2G9V"
$bearer = "Bearer",$token
$header = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$header.Add("authorization", $bearer)

# Recover group ID [NAME]
$request = Invoke-RestMethod -Uri "https://webapi.teamviewer.com/api/v1/groups?name=GROUPNAME" -Method Get -Headers $header
$GroupID = $request.groups.id
# Retrieve all the devices of the group [NAME]
$request = Invoke-RestMethod -Uri "https://webapi.teamviewer.com/api/v1/devices?groupid=$GroupID" -Method Get -Headers $header

$data = @{        
    policy_id = "inherit";
};
$json = $data | ConvertTo-Json;
$contentType = "application/json" 

ForEach($item in $request.devices)
{
    # We switch to inherit mode
    if($Item.policy_id -notlike "inherit"){
        $Item.alias
        $DeviceID = $Item.device_id
        # Apply the strategy
        $request = Invoke-RestMethod -Uri "https://webapi.teamviewer.com/api/v1/devices/$DeviceID" -ContentType $contentType -Method Put -Headers $header -Body $Json
        $x++
    }

}
write-host $x