# Delete User SAP configuration files
$SAPAppDataPath = "$env:APPDATA\SAP" #C:\Users\aanderson\AppData\Roaming\SAP
if (Test-Path $SAPAppDataPath) {
    Remove-Item "$SAPAppDataPath\*" -Recurse -Force -ErrorAction 0
}

$SAPAppDataPath = "$env:LOCALAPPDATA\SAP" #C:\Users\aanderson\AppData\Local\SAP
if (Test-Path $SAPAppDataPath) {
    Remove-Item "$SAPAppDataPath\*" -Recurse -Force -ErrorAction 0
}