<#
.SYNOPSIS
    Packages a Win32 application using the Microsoft Win32 Content Prep Tool.
.DESCRIPTION
    This script takes the source folder, setup file, output path, install command, and detection file as parameters. It builds a provisioning package using the Microsoft Win32 Content Prep Tool and then packages the application for Intune deployment.
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  2025-02-08
  Purpose/Change: Initial script development
  
.EXAMPLE
    .\Package-Win32App.ps1
    This command will execute the script, which will build a provisioning package for the specified application and then package it for Intune deployment.
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------
# Get Path Location of latest Win32ContentPrepTool
$scriptDir = $PSScriptRoot
$root = (Join-Path $scriptDir '..\..' | Resolve-Path)          # root of your folder structure
$prefix = 'v'               # part before the version
$pattern = "$prefix*(\d+(\.\d+){1,3})"  # regex to capture version, e.g. 1.4.4
$latestFolder = Get-ChildItem -Path $root -Recurse -Directory |
Where-Object { $_.Name -match $pattern } |
Select-Object @{
    Name       = 'Folder'
    Expression = { $_.FullName }
}, @{
    Name       = 'Version'
    Expression = {
        if ($_.Name -match $pattern) {
            [version]$matches[1]        # cast captured version to [version]
        }
    }
} |
Sort-Object Version -Descending |
Select-Object -First 1

$latestPath = $latestFolder.Folder   # variable with the folder path
# Location of Win32ContentPrepTool
$MicrosoftWin32ContentPrepToolFolder = $latestPath
Write-Host "Latest version of Microsoft Win32 Content Prep Tool: $MicrosoftWin32ContentPrepToolFolder" -ForegroundColor Cyan

# Variables for prep tool
$version = "3.21.0"
$AppName = "DesktopInfo"
$AppLocation = "$scriptDir\$AppName\$version\"
$source_folder = "$AppLocation\Source"
$source_setup_file = "$source_folder\$($AppName)_$($version).ps1"
$output_folder = "$AppLocation\IntunePackage"
# ------------------------------------------------[Execution]----------------------------------------------------------
# Create .intunewin file using the IntuneWinAppUtil.exe tool
Set-Location $MicrosoftWin32ContentPrepToolFolder
.\IntuneWinAppUtil.exe -c $source_folder -s $source_setup_file -o $output_folder