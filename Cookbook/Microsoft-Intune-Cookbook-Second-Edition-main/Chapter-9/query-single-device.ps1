## Details we are querying

$hostname = "PC-NAME-HERE" 
$query="Process 
| where ProcessName != 'svchost.exe' and UserTimeMilliseconds > 0" 

##Grab the device ID from the hostname
$deviceidurl = 'https://graph.microsoft.com/beta/deviceManagement/managedDevices?$filter=deviceName eq '+"'$hostname'" 
$deviceidresults = Invoke-MgGraphRequest -Uri $deviceidurl -Method GET 
$deviceid = $deviceidresults.value.id

# normalize to CRLF then base64-encode
$normalizedQuery = $query -replace "`r?`n", "`r`n"
$encodedText = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($normalizedQuery))


##Send the query to the device
$devicequeryuri = "https://graph.microsoft.com/beta/deviceManagement/managedDevices/$deviceid/createQuery"                               
$Body = @"
{
"query":"$encodedText"
}
"@
Invoke-MgGraphRequest -Uri $devicequeryuri -Method POST -Body $Body -ContentType "application/json"