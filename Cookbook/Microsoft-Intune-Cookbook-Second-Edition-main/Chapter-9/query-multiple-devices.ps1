$posturl = "https://graph.microsoft.com/beta/deviceManagement/deviceInventoryQueryRequests/initiateQuery"

##Enter your query here
$body = @"
{
	"query": "Cpu\r\n| project ProcessorType, SocketDesignation, AddressWidth"
}
"@

$query = Invoke-MgGraphRequest -Method POST -Uri $posturl -Body $body -ContentType "application/json"

##Grab the ID
$queryid = $query.id

$checkstatus = "https://graph.microsoft.com/beta/deviceManagement/deviceInventoryQueryRequests/$queryid?$select=id,status,message"


##Loop until query has completed
Do {
    $status = Invoke-MgGraphRequest -Method GET -Uri $checkstatus
    Start-Sleep -Seconds 5
} Until ($status.message -eq "Completed")

$retrieveurl = "https://graph.microsoft.com/beta/deviceManagement/deviceInventoryQueryRequests/$queryid/retrieveResults"

$retrievejson =@"
{
	"skip": "0"
}
"@

##Grab the results
$results = Invoke-MgGraphRequest -Method POST -Uri $retrieveurl -Body $retrievejson -ContentType "application/json"