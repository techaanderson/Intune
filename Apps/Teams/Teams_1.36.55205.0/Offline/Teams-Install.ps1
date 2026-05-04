$url = “https://go.microsoft.com/fwlink/?linkid=2187327”
$output = “$env:TEMP\MSTeams-x64.msix”
Invoke-WebRequest -Uri $url -OutFile $output
Start-Process msiexec.exe -ArgumentList “/i $output /quiet /norestart” -NoNewWindow -Wait