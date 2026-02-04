[CmdletBinding()]
param(
        [Parameter(Mandatory = $True)] [int32]$StaleDays
        #[Parameter(Mandatory = $True)] [String] $Token = ""
)

$token = "12333102-cWBdrEQupCYo726o2G9V"

$bearer = "Bearer", $token
$counter = 0

$header = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$header.Add("authorization", $bearer)

$devices = (Invoke-RestMethod -Uri "Https://webapi.teamviewer.com/api/v1/devices" -Method Get -Headers $header).devices


$Days = ((Get-Date).AddDays(-$staleDays))
$Days = Get-Date $Days -Format s


ForEach ($device in $devices) {

        if ($device.online_state -eq "Offline") {

                $ID = $device.device_id

                $Lastseen = $device.last_seen

                if ($Lastseen -ne $null) {

                        $LastSeen = ($device.last_seen)
                        [datetime]$DateLastSeen = $LastSeen

                        if ($DateLastSeen -le $Days) {

                                $counter ++

                                #Invoke-WebRequest -Uri "Https://webapi.teamviewer.com/api/v1/devices/$ID" -Method Delete -Headers $header -UseBasicParsing
                                #Write-Host "Deleting Device:"$device.alias -ForegroundColor Yellow
                                Write-Host "StaleDevice:"$device.alias
                                $object = New-Object PSObject 
                                $object | Add-Member -type NoteProperty -Name DeviceAlias -Value $device.alias
                                $object | Add-Member -type NoteProperty -Name DateLastSeen -Value $DateLastSeen
                                $object | Export-CSV "$psscriptroot\Output\TV_Stale_Devices.csv" -NoTypeInformation -append

                        }$Lastseen = $null
                }
        }
}