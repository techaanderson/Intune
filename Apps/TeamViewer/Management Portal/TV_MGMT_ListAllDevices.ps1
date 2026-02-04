$token = "12333102-cWBdrEQupCYo726o2G9V"
$bearer = "Bearer", $token

$header = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$header.Add("authorization", $bearer)

$devices = (Invoke-RestMethod -Uri "Https://webapi.teamviewer.com/api/v1/devices" -Method Get -Headers $header).devices

$Days = Get-Date $Days -Format s

ForEach ($device in $devices) {
    $ID = $device.device_id
    $Lastseen = $device.last_seen

    if ($Lastseen -ne $null) {

        $LastSeen = ($device.last_seen)
        [datetime]$DateLastSeen = $LastSeen
        $counter ++
        $Lastseen = $null
    }
    Write-Host "Device:"$device.alias
        $object = New-Object PSObject 
        $object | Add-Member -type NoteProperty -Name DeviceAlias -Value $device.alias
        $object | Add-Member -type NoteProperty -Name DateLastSeen -Value $DateLastSeen
        $object | Export-CSV "$psscriptroot\Output\TV_Devices.csv" -NoTypeInformation -append
}