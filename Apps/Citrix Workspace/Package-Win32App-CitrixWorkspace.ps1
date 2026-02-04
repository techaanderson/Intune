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
#------------------------------------------------[Declarations]----------------------------------------------------------
#Update the paths as needed
$MicrosoftWin32ContentPrepToolFolder = "C:\GitRepos\AzureDevOps\Packages\applications\_Microsoft-Win32-Content-Prep-Tool\v1.8.7\"
$source_folder = "C:\GitRepos\AzureDevOps\Packages\applications\Citrix Workspace\2507.1 CU 1 LTSR\Source"
$source_setup_file = "CitrixWorkspaceFullInstaller.exe"
$output_folder = "C:\GitRepos\AzureDevOps\Packages\applications\Citrix Workspace\2507.1 CU 1 LTSR\IntunePackage"
# ------------------------------------------------[Execution]----------------------------------------------------------
# Create .intunewin file using the IntuneWinAppUtil.exe tool
Set-Location $MicrosoftWin32ContentPrepToolFolder
.\IntuneWinAppUtil.exe -c $source_folder -s $source_setup_file -o $output_folder