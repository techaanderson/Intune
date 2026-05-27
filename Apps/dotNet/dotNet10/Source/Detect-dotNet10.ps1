#Is .Net version 10.0.8 or higher
#(Get-ItemProperty "HKLM:\SOFTWARE\dotnet\Setup\InstalledVersions\x64\sharedhost").Version -ge 10.0.8
$registryPath = "HKLM:\SOFTWARE\dotnet\Setup\InstalledVersions\x64\sharedhost"
$version = (Get-ItemProperty -Path $registryPath -ErrorAction SilentlyContinue).Version
if ($version -eq "10.0.8") {
    Write-Output "Found .NET 10.0.8"
    exit 0
} else {
    exit 1
}