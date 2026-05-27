# Install .NET v10.0.8

$path = "C:\IS-Files"
$dotNetEXE = "$path\windowsdesktop-runtime-10.0.8-win-x64.exe"

# Create working folder if not there
If (!(test-path $path)) {
      New-Item -ItemType Directory -Force -Path $path
}

# Copy file to local folder
Copy-Item -Path ".\windowsdesktop-runtime-10.0.8-win-x64.exe" -Destination $dotNetEXE -Force

# Run .exe just downloaded
Start-Process -FilePath $dotNetEXE -ArgumentList '/q /norestart' -Wait