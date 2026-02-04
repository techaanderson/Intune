## Download the latest release of PSAppDeployToolkit from GitHub
$githubRepository = "psappdeploytoolkit/psappdeploytoolkit"
$filenamePatternMatch = "PSAppDeployToolkit*.zip"
$psadtReleaseUri = "https://api.github.com/repos/$githubRepository/releases/latest"
$psadtDownloadUri = ((Invoke-RestMethod -Method GET -Uri $psadtReleaseUri).assets | Where-Object name -like $filenamePatternMatch ).browser_download_url
$zipExtractionPath = Join-Path $env:USERPROFILE "Downloads" "PSAppDeployToolkit"
$zipTempDownloadPath = Join-Path -Path $([System.IO.Path]::GetTempPath()) -ChildPath $(Split-Path -Path $psadtDownloadUri -Leaf)

## Download to a temporary folder
Invoke-WebRequest -Uri $psadtDownloadUri -Out $zipTempDownloadPath
## Remove any Zone.Identifier alternate data streams to unblock the file (if required)
Unblock-File -Path $zipTempDownloadPath
## Extract the contents of the zip file to a subfolder under the current user's Downloads folder
Expand-Archive -Path $zipTempDownloadPath -DestinationPath $zipExtractionPath -Force

Write-Host ("File: {0} extracted to Path: {1}" -f $psadtDownloadUri, $zipExtractionPath) -ForegroundColor Yellow