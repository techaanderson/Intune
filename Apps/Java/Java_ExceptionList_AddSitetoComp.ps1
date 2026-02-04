$computer = Read-Host -Prompt 'Input computer name'
$site = Read-Host -Prompt 'Input site address. E.g. http://rentalman.wynnesystems.com'
Add-Content -Path "\\$computer\C$\Windows\Sun\Java\Deployment\exception.sites" -Value "`r`n$site"