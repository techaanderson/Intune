#Display .Net 4 version
(Get-ItemProperty "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full").version


#Is .Net version 4.8 or higher
#(Get-ItemProperty "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full").Release -ge 528040
$registryPath = "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full"
$version = (Get-ItemProperty -Path $registryPath -ErrorAction SilentlyContinue).Release
if ($version -ge "528040") {
    Write-Output "Found .NET 4.8+"
    exit 0
} else {
    exit 1
}


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