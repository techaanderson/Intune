<#
.SYNOPSIS
  Clones the Microsoft Win32 Content Prep Tool repository from GitHub to a specified folder.
.DESCRIPTION
  This script retrieves the latest release version of the Microsoft Win32 Content Prep Tool from GitHub, constructs the destination path based on the version, and clones the repository to that location.
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  2025-02-08
  Purpose/Change: Initial script development
  
.EXAMPLE
    .\Download-Win32ContentPrepTool.ps1
    This command will execute the script, which will clone the latest version of the Microsoft Win32 Content Prep Tool repository into a folder named with the version number in the same directory as the script.
#>

#----------------------------------------------------------[Declarations]----------------------------------------------------------
# Set the script directory to the current script's location
$scriptDir = $PSScriptRoot
Write-Host "Script directory: $scriptDir" -ForegroundColor Cyan
# Get the latest release tag and Extract the version number from the tag name
$apiUrl = "https://api.github.com/repos/microsoft/Microsoft-Win32-Content-Prep-Tool/releases/latest"
$release = Invoke-RestMethod -Uri $apiUrl
$version = $release.tag_name -replace '^v', ''  # Remove 'v' prefix if present
Write-Host "Latest version of Microsoft Win32 Content Prep Tool: $version" -Foreground Cyan
# Set the clone URL and destination path for the repository
$cloneUrl = "https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool.git"
$folderName = "v$version"
$destinationPath = Join-Path -Path $scriptDir -ChildPath $folderName
Write-Host "Cloning Microsoft Win32 Content Prep Tool version $version into: $destinationPath" -Foreground Cyan

#----------------------------------------------------------[Execution]----------------------------------------------------------
# Clone the repository using the latest version tag and store it in the specified folder
Write-Host "Cloning the Microsoft Win32 Content Prep Tool repository..." -ForegroundColor Yellow
git clone $cloneUrl $destinationPath
Write-Host "Cloned $cloneUrl into: $destinationPath" -ForegroundColor Green