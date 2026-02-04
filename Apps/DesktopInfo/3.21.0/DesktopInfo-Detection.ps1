<#
.DESCRIPTION
    This script checks if DesktopInfo application is installed and verifies its version.
.NOTES
	Author: Aaron Anderson
#>

# Specify the path to the application's main executable
$PackageName = "DesktopInfo"
$ProgramPath = "$env:ProgramData\$PackageName"
$filePath = "$ProgramPath\DesktopInfo.exe"
$expectedVersion = "3.21.0"

# Check if the file exists
if (Test-Path $filePath) {
    # Get the file version information
    $fileVersion = (Get-Item $filePath).VersionInfo.FileVersion

    # Compare the detected version with the expected version
    if ($fileVersion -ge $expectedVersion) {
        Write-Host "Application version detected: $fileVersion"
        exit 0 # Success, application with correct version detected
    } else {
        Write-Host "Application version detected: $fileVersion, expected: $expectedVersion"
        exit 1 # Failure, incorrect version
    }
} else {
    Write-Host "Application executable not found at $filePath"
    exit 1 # Failure, application not found
}