function getallpagination () {
    <#
.SYNOPSIS
This function is used to grab all items from Graph API that are paginated
.DESCRIPTION
The function connects to the Graph API Interface and gets all items from the API that are paginated
.EXAMPLE
getallpagination -url "https://graph.microsoft.com/v1.0/groups"
 Returns all items
.NOTES
 NAME: getallpagination
#>
[cmdletbinding()]
    
param
(
    $url
)
    $response = (Invoke-MgGraphRequest -uri $url -Method Get -OutputType PSObject)
    $alloutput = $response.value
    
    $alloutputNextLink = $response."@odata.nextLink"
    
    while ($null -ne $alloutputNextLink) {
        $alloutputResponse = (Invoke-MGGraphRequest -Uri $alloutputNextLink -Method Get -outputType PSObject)
        $alloutputNextLink = $alloutputResponse."@odata.nextLink"
        $alloutput += $alloutputResponse.value
    }
    
    return $alloutput
    }


# Define the number of days to disable and remove devices
$daystodisable = 90
$daystoremove = 120

# Disable devices that have not logged on within the specified number of days
$dt = (Get-Date).AddDays(-$daystodisable)
$devicesuri = "https://graph.microsoft.com/beta/devices"
$Devices = getallpagination -url $devicesuri | Where-Object {($_.ApproximateLastSignInDateTime -le $dt) -and ($_.AccountEnabled -eq $true)}
foreach ($Device in $Devices) {
    $deviceid = $Device.Id
    Write-Host "Disabling device with ID: $deviceid"
    $deviceuri = "https://graph.microsoft.com/beta/devices/$deviceid"
    $devicejson = @"
    {
        "@odata.type": "#microsoft.graph.device",
        "accountEnabled": false
    }
"@
Invoke-MgGraphRequest -Uri $deviceuri -Method PATCH -Body $devicejson -ContentType "application/json"
    Write-Host "Device disabled successfully"
}


# Delete disabled devices that have not logged on within the specified number of days
$dt = (Get-Date).AddDays(-$daystoremove)
$devicesuri = "https://graph.microsoft.com/beta/devices"
$Devices = getallpagination -url $devicesuri | Where-Object {($_.ApproximateLastSignInDateTime -le $dt) -and ($_.AccountEnabled -eq $false)}
foreach ($Device in $Devices) {
    $deviceid = $Device.Id
    Write-Host "Removing device with ID: $deviceid"
    $deviceuri = "https://graph.microsoft.com/beta/devices/$deviceid"
    Invoke-MgGraphRequest -Uri $deviceuri -Method DELTE

    Write-Host "Device removed successfully"
}

