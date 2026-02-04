# # Check for the specific store URL you configured
# $StoreRegPath = "HKCU:\Software\Citrix\Dazzle\Sites"
# $TargetStore = "Womans"
# $InstalledStores = Get-ChildItem -Path $StoreRegPath -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name

# if ($InstalledStores -like "*$TargetStore*") {
#     Write-Host "SUCCESS: Store '$TargetStore' is correctly configured." -ForegroundColor Green
# } else {
#     Write-Warning "WARNING: Citrix is installed, but the '$TargetStore' store was not found."
# }

#--- Additional check to display the configured store name
$TargetStore = "WomansCitrix"
$StoreRegPath = "HKLM:\SOFTWARE\WOW6432Node\Citrix\Dazzle\Sites"
$StoreRegName = "STORE0"
$StoreRegValue = Get-ItemPropertyValue -Path $StoreRegPath -Name $StoreRegName

if ($StoreRegValue -like "*$TargetStore*") {
    Write-Host "SUCCESS: Store '$TargetStore' is correctly configured." -ForegroundColor Green
} else {
    Write-Warning "WARNING: Citrix is installed, but the '$TargetStore' store was not found."
}