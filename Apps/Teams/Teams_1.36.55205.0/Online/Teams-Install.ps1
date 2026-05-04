$exePath = "$($PSScriptRoot)\teamsbootstrapper.exe"
Start-Process -FilePath $exePath -ArgumentList "-p" -Wait -WindowStyle Hidden