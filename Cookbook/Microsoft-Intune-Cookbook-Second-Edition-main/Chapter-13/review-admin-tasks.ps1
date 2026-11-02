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

##Set tasks URL
$tasksurl = "https://graph.microsoft.com/beta/devicemanagement/administrativetasks"

##Grab all of the tasks which are not completed and pass to a gridview
$alltasks = getallpagination -url $tasksurl | Where-Object Status -ne "completed" | out-gridview -passthru

foreach ($task in $alltasks) {
   $type = $task.source
   $taskid = $task.id
   
   switch ($type) {
       "multiAdminApproval" {
##Set URL
$url = "https://graph.microsoft.com/beta/deviceManagement/operationApprovalRequests('$taskid')/approve"
##Approval can be Approved or Denied
$approval = "Approved"

##Set JSON
$json = @"
{
	"justification": "$approval"
}
"@

##Send request
write-host "Sending request"
Invoke-MgGraphRequest -uri $url -Method Post -Body $json -ContentType "application/json"
write-host "Request sent"       
}
       "endpointPrivilegeManagementApproval" {

##Set URL
$url = "https://graph.microsoft.com/beta/deviceManagement/elevationRequests('$taskid')/approve"
##Approval can be Approved or Denied
$approval = "Approved"

##Set JSON
$json = @"
{
	"reviewerJustification": "$approval"
}
"@

##Send request
write-host "Sending request"
Invoke-MgGraphRequest -uri $url -Method Post -Body $json -ContentType "application/json"
write-host "Request sent"       
}
       default {
           Write-Host "Unknown task type: $type"
           continue
       }

   }
    
}