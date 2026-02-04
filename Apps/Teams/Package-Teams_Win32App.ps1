# Location of ContentPrepTool
$MicrosoftWin32ContentPrepToolFolder = "C:\GitRepos\AzureDevOps\SysAdmin\Windows\Applications\_Microsoft-Win32-Content-Prep-Tool\Microsoft-Win32-Content-Prep-Tool-1.8.6\Microsoft-Win32-Content-Prep-Tool-1.8.6"
# Variables for prep tool
$setup_folder = "C:\GitRepos\AzureDevOps\SysAdmin\Windows\Applications\Teams\New Teams\Source"
$source_setup_file = "C:\GitRepos\AzureDevOps\SysAdmin\Windows\Applications\Teams\New Teams\Source\Install-Teams.ps1"
$output_folder = "C:\GitRepos\AzureDevOps\SysAdmin\Windows\Applications\Teams\New Teams\IntuneApp"

Set-Location $MicrosoftWin32ContentPrepToolFolder
.\IntuneWinAppUtil.exe -c $setup_folder -s $source_setup_file -o $output_folder