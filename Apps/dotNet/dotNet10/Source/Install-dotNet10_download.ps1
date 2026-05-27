# Download and Install .NET v10.0.8

$path = "C:\IS-Files"
$dotNetEXE = "$path\windowsdesktop-runtime-10.0.8-win-x64.exe"
$url = "https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/10.0.8/windowsdesktop-runtime-10.0.8-win-x64.exe"

# Create working folder if not there
If (!(test-path $path)) {
      New-Item -ItemType Directory -Force -Path $path
}

# Force use of TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Download EXE
Invoke-WebRequest -Uri $url -OutFile $dotNetEXE -UseBasicParsing

# Run .exe just downloaded
Start-Process -FilePath $dotNetEXE -ArgumentList '/q /norestart' -Wait