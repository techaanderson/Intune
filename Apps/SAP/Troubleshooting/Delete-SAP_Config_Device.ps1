# Delete "Default" SAP Config files in C:\Windows
$Path = "C:\Windows\saplogon.ini"
if (Test-Path $Path) {
    Remove-Item "$Path" -Force
}
$Path = "C:\Windows\SAPUILandscapeGlobal.xml"
if (Test-Path $Path) {
    Remove-Item "$Path" -Force
}
$Path = "C:\Windows\SAPUILandscape.xml"
if (Test-Path $Path) {
    Remove-Item "$Path" -Force
}