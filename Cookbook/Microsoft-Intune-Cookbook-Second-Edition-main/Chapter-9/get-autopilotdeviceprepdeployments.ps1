$exportpath = "c:\temp\autopilotdeviceprep.csv"

$url = "https://graph.microsoft.com/beta/deviceManagement/reports/getAutopilotDeploymentStatus"

$json = @"
{
	"orderBy": [
		"EnrollmentTimeInUtc desc"
	],
	"top": 50
}
"@

$tempfilepath = $env:TEMP + "\autopilotdeviceprep.txt"

Invoke-MgGraphRequest -Method POST -Uri $url -Body $json -ContentType "application/json" -OutputFilePath $tempfilepath

$parsedData = get-content $tempfilepath | ConvertFrom-Json
$fullvalues = $parsedData.Values

$allrows = $parsedData.TotalRowCount
$n = 0
while ($n -lt $allrows) {
    $n += 50
    $tempfilepath2 = $env:TEMP + "\autopilotdeviceprep-$n.txt"
    $url = "https://graph.microsoft.com/beta/deviceManagement/reports/getAutopilotDeploymentStatus"
    $json = @"
{
		"orderBy": [
		"EnrollmentTimeInUtc desc"
	],
    "skip": $n,
    "top": 50
}
"@
    Invoke-MgGraphRequest -Method POST -Uri $url -Body $json -ContentType "application/json" -OutputFilePath $tempfilepath2
    $tempdata = get-content $tempfilepath2 | ConvertFrom-Json
    $fullvalues += $tempdata.Values

}

$outputarray = @()
foreach ($value in $fullvalues) {
    $DeviceId                        = $value[0]
    $EnrollmentTimeInUtc             = $value[1]
    $CurrentProvisioningPhase        = $value[2]
    $DeploymentStatus                = $value[3]
    $DeploymentDurationTimeInSeconds = $value[4]
    $Phase                           = $value[5]
    $ResultCode                      = $value[6]
    $DeviceName                      = $value[7]
    $SerialNumber                    = $value[8]
    $UPN                             = $value[9]

    $objectdetails = [pscustomobject]@{
        DeviceId                        = $DeviceId
        EnrollmentTimeInUtc             = $EnrollmentTimeInUtc
        CurrentProvisioningPhase        = $CurrentProvisioningPhase
        DeploymentStatus                = $DeploymentStatus
        DeploymentDurationTimeInSeconds = $DeploymentDurationTimeInSeconds
        Phase                           = $Phase
        ResultCode                      = $ResultCode
        DeviceName                      = $DeviceName
        SerialNumber                    = $SerialNumber
        UPN                             = $UPN
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
    $tempfilepath2 = $env:TEMP + "\appconfigstatus-$n.txt"
    Remove-Item $tempfilepath2
}