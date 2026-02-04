#Removes TV from WMI
$TVFIX = Get-WmiObject Win32_Product | where name -like "*TeamViewer*"
$TVFIX | Remove-WmiObject

#Removes TV from Registry
$RE = 'TeamViewer*'
$Key = 'HKLM:\SOFTWARE\Classes\Installer\Products'
Get-ChildItem $Key -Rec -EA SilentlyContinue | ForEach-Object {
$CurrentKey = (Get-ItemProperty -Path $_.PsPath)
If ($CurrentKey -match $RE){
$CurrentKey|Remove-Item -Force -Recurse -Confirm:$false | Out-Null
}
}