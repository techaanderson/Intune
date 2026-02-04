$token = Read-Host -Prompt "Paste your account token code here"
$bearer = "Bearer",$token

$header = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$header.Add("authorization", $bearer)

$webrequest = Invoke-RestMethod -Uri "https://webapi.teamviewer.com/api/v1/groups/" -Method Get -Headers $header
$machine = Invoke-RestMethod -Uri "Https://webapi.teamviewer.com/api/v1/devices/" -Method Get -Headers $header

$i=1
$grpArr = @()

ForEach($grp in $webrequest.groups)
{
    Write-Host $i ")" $grp.name " - " $grp.id
    $grpArr += $grp.id;
    ForEach($dev in $machine.devices)
    {
        If($dev.groupid -eq  $grp.id)
        {
            Write-Host "     " $dev.alias
        }
    } 
    $i += 1
}
$ig = Read-Host -Prompt "Select the group you will like to remove"

ForEach ($dgrp in $machine.devices)
{
    if($dgrp.groupid -eq $grpArr[$ig - 1])
    {
        Write-Host "Delete device: " $dgrp.alias
        $item = $dgrp.device_id
        $delete = Invoke-WebRequest -Uri "Https://webapi.teamviewer.com/api/v1/devices/$item" -Method Delete -Headers $header
    }

}
Write-Host "Delete group id: " $grpArr[$ig - 1] 
   $gid = $grpArr[$ig - 1]
   $remove = Invoke-WebRequest -Uri "Https://webapi.teamviewer.com/api/v1/groups/$gid" -Method Delete -Headers $header 