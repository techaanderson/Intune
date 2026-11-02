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


$groupid = "xxxxx-xxxxx-xxxxx"
$appname = "Rarlab WinRAR"
$locale = {en-US}


    write-host "Single app selected, retrieving details for $appname"
    $uri = "https://graph.microsoft.com/beta/deviceAppManagement/mobileAppCatalogPackages?filter=productDisplayName eq '$appname'"
    $apps = getallpagination -url $uri
$app = $apps | Sort-Object versionDisplayName -Descending | where-object locales -EQ $locale | Select-Object * -First 1

$appid = $app.id

##Convert to mobile app
write-host "Converting to mobile app"
$converturi = "https://graph.microsoft.com/beta/deviceAppManagement/mobileApps/convertFromMobileAppCatalogPackage(mobileAppCatalogPackageId='$appid')"

$converted = (Invoke-MgGraphRequest -uri $converturi -Method GET -OutputType PSObject) | Select-Object * -ExcludeProperty "@odata.context", id, largeIcon, createdDateTime, lastModifiedDateTime, owner, notes, size

$posturi = "https://graph.microsoft.com/beta/deviceAppManagement/mobileApps"

$convertedjson = $converted | ConvertTo-Json

$deployedapp = Invoke-MgGraphRequest -Method POST -Uri $posturi -Body $convertedjson -ContentType "application/json"


$deployedid = $deployedapp.id
$assignurl = "https://graph.microsoft.com/beta/deviceAppManagement/mobileApps/$deployedid/assign"

$json = @"

    {
	"mobileAppAssignments": [
		{
			"@odata.type": "#microsoft.graph.mobileAppAssignment",
			"intent": "Required",
			"settings": {
				"@odata.type": "#microsoft.graph.win32CatalogAppAssignmentSettings",
				"deliveryOptimizationPriority": "notConfigured",
				"installTimeSettings": null,
				"notifications": "showAll",
				"restartSettings": null
			},
			"target": {
				"@odata.type": "#microsoft.graph.groupAssignmentTarget",
				"groupId": "$groupid"
			}
		}
	]
}
"@

Invoke-MgGraphRequest -Method POST -Uri $assignurl -Body $json -ContentType "application/json"

