# Bybass Untrusted repository prompt
Set-PSRepository PSGallery -InstallationPolicy Trusted
# Install NuGet
Install-PackageProvider -Name "NuGet" -Force
# Install Module
Install-Module VcRedist
# Import Module
Import-Module VcRedist
# Create a directory for downloaded files
New-Item C:\Downloads\VcRedist -ItemType directory
# Download and install C++
$VcList = Get-VcList | Get-VcRedist -Path "C:\Downloads\VcRedist"
$VcList | Install-VcRedist -Path C:\Downloads\VcRedist