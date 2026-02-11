#requires -version 7
<#
.SYNOPSIS
    Retire devices in Intune using their serial numbers from a CSV file.
.DESCRIPTION
    This script connects to Microsoft Graph, retrieves managed devices, and retires devices based on serial numbers provided in a CSV file.
    
    The CSV file should have a column named 'SerialNumber' containing the serial numbers of the devices to be retired.
    
    Ensure you have the necessary permissions to perform device management actions in Intune.
    
    Requires the Microsoft.Graph PowerShell module to be installed.
.INPUTS
    CSV file containing serial numbers of devices to be retired. The file should have a column named 'SerialNumber'.
    Example: C:\Path\To\serial_numbers.csv
.OUTPUTS
    Outputs the status of each device retirement attempt to the console.
    - Success: "✅ Retired device with Serial Number: <serial_number>"
    - Failure: "❌ No device found with Serial Number: <serial_number>"
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  6/4/2025
  Purpose/Change: Initial script development

  
.EXAMPLE
    .\Retire-IntuneDevice_SerialNumber.ps1
    This will execute the script, connecting to Microsoft Graph and retiring devices based on the serial numbers provided in the specified CSV file.
    
    Ensure that the Microsoft.Graph module is installed and you have the necessary permissions to manage devices in Intune.
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

# Install Microsoft Graph module if not already installed
Write-Host "Verifying Microsoft.Graph PowerShell module" -ForegroundColor Cyan -BackgroundColor Black
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph)) {
    Write-Host "Microsoft.Graph module not found. Installing..." -ForegroundColor Yellow -BackgroundColor Black
    Install-Module -Name Microsoft.Graph -Scope CurrentUser -Force
    Write-Host "Installation complete." -ForegroundColor Green -BackgroundColor Black
} else {
    Write-Host "Microsoft.Graph module is already installed." -ForegroundColor Green -BackgroundColor Black
}

# Connect to Microsoft Graph with the required scopes
Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

# Import serial numbers from CSV (expects a column named 'SerialNumber')
$serialNumbers = Import-Csv -Path "C:\Path\To\serial_numbers.csv"

# Get all managed devices
$devices = Get-MgDeviceManagementManagedDevice

#-----------------------------------------------------------[Execution]------------------------------------------------------------

foreach ($entry in $serialNumbers) {
    $serial = $entry.SerialNumber.Trim()
    $device = $devices | Where-Object { $_.SerialNumber -eq $serial }

    if ($device) {
        Invoke-MgDeviceManagementManagedDeviceRetire -ManagedDeviceId $device.Id
        Write-Host "✅ Retired device with Serial Number: $serial" -ForegroundColor Green
    } else {
        Write-Host "❌ No device found with Serial Number: $serial" -ForegroundColor Red
    }
}