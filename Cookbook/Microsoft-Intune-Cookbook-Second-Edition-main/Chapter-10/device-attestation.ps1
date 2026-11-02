$exportpath = "c:\temp\device-attestation.csv"

function getallpagination () {
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


$selectedreport = "TpmAttestationStatus"

$fullreport = $selectedreport + "_00000000-0000-0000-0000-000000000001"

$generateurl = "https://graph.microsoft.com/beta/deviceManagement/reports/cachedReportConfigurations"

        $json = @"
        {
            "filter": "",
            "id": "$fullreport",
            "metadata": null,
            "orderBy": [
            ],
            "select": [
		        "DeviceName",
		        "DeviceId",
		        "UPN",
		        "EnrolledByUser",
		        "AttestationStatus",
		        "AttestationStatusDetail",
		        "OS",
		        "OSVersion",
		        "Ownership",
		        "LastCheckin",
		        "EnrollmentDate",
		        "TpmVersion",
		        "TpmManufacturer",
		        "Model"
                ]
        }
"@

Invoke-MgGraphRequest -Method POST -Uri $generateurl -Body $json -ContentType "application/json"



$url = "https://graph.microsoft.com/beta/deviceManagement/reports/cachedReportConfigurations('$fullreport')"

$reportcheck = (Invoke-MgGraphRequest -uri $url -Method Get -OutputType PSObject).status

while ($reportcheck -ne "Completed") {
    $reportcheck = (Invoke-MgGraphRequest -uri $url -Method Get -OutputType PSObject).status
    Start-Sleep -Seconds 5
}

$reporturl = "https://graph.microsoft.com/beta/deviceManagement/reports/getCachedReport"

$reportjson = @"
{
	"filter": "",
	"Id": "$fullreport",
	"OrderBy": [],
	"Search": "",
    "Select": [
		        "DeviceName",
		        "DeviceId",
		        "UPN",
		        "EnrolledByUser",
		        "AttestationStatus",
		        "AttestationStatusDetail",
		        "OS",
		        "OSVersion",
		        "Ownership",
		        "LastCheckin",
		        "EnrollmentDate",
		        "TpmVersion",
		        "TpmManufacturer",
		        "Model"
        ],
	"Skip": 0,
	"Top": 50
}
"@

$tempfilepath = $env:TEMP + "\attestation.txt"

Invoke-MgGraphRequest -Method POST -Uri $reporturl -Body $reportjson -ContentType "application/json" -OutputFilePath $tempfilepath

$parsedData = get-content $tempfilepath | ConvertFrom-Json
$fullvalues = $parsedData.Values

$allrows = $parsedData.TotalRowCount
$n = 0
while ($n -lt $allrows) {
    $n += 50
    $tempfilepath2 = $env:TEMP + "\attestation-$n.txt"
    $json = @"
{
	"filter": "",
	"Id": "$fullreport",
	"OrderBy": [],
	"Search": "",
    "Select": [
		        "DeviceName",
		        "DeviceId",
		        "UPN",
		        "EnrolledByUser",
		        "AttestationStatus",
		        "AttestationStatusDetail",
		        "OS",
		        "OSVersion",
		        "Ownership",
		        "LastCheckin",
		        "EnrollmentDate",
		        "TpmVersion",
		        "TpmManufacturer",
		        "Model"
        ],
    "skip": $n,
    "top": 50
}
"@
    Invoke-MgGraphRequest -Method POST -Uri $reporturl -Body $json -ContentType "application/json" -OutputFilePath $tempfilepath2
    $tempdata = get-content $tempfilepath2 | ConvertFrom-Json
    $fullvalues += $tempdata.Values

}



        $outputarray = @()
        foreach ($value in $fullvalues) {
            $objectdetails = [pscustomobject]@{
                DeviceName = $value[0]
                DeviceId = $value[1]
                UPN = $value[2]
                EnrolledByUser = $value[3]
                AttestationStatus = $value[4]
                AttestationStatusDetail = $value[5]
                OS = $value[6]
                OSVersion = $value[7]
                Ownership = $value[8]
                LastCheckin = $value[9]
                EnrollmentDate = $value[10]
                TpmVersion = $value[11]
                TpmManufacturer = $value[12]
                Model = $value[13]
            }
        
        
            $outputarray += $objectdetails
        
        }
  


Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$form.Text = "Export or View"
$form.Width = 300
$form.Height = 150
$form.StartPosition = "CenterScreen"

$label = New-Object System.Windows.Forms.Label
$label.Text = "Select an option:"
$label.Location = New-Object System.Drawing.Point(10, 20)
$label.AutoSize = $true
$form.Controls.Add($label)

$exportButton = New-Object System.Windows.Forms.Button
$exportButton.Text = "Export"
$exportButton.Location = New-Object System.Drawing.Point(100, 60)
$exportButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $exportButton
$form.Controls.Add($exportButton)

$viewButton = New-Object System.Windows.Forms.Button
$viewButton.Text = "View"
$viewButton.Location = New-Object System.Drawing.Point(180, 60)
$viewButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $viewButton
$form.Controls.Add($viewButton)

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    # Export code here
    $outputarray | export-csv $exportpath -NoTypeInformation
} elseif ($result -eq [System.Windows.Forms.DialogResult]::Cancel) {
    # View code here
    $outputarray | Out-GridView
}

Remove-Item $tempfilepath
$allrows = $parsedData.TotalRowCount
$n = 0
while ($n -lt $allrows) {
    $n += 50
    $tempfilepath2 = $env:TEMP + "\attestation-$n.txt"
    Remove-Item $tempfilepath2
}