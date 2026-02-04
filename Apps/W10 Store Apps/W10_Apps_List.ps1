$Appx = Get-AppxPackage | select name
$appx | Out-File -FilePath C:\temp\Appx.txt
$AppxPro = Get-AppxProvisionedPackage -online | select packagename
$AppxPro | Out-File -FilePath C:\temp\AppxPro.txt