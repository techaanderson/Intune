###########################################################
# New Teams installation
###########################################################

Write-Host "Installing new Teams"
Start-Process -FilePath "$psscriptroot\teamsbootstrapper.exe" -ArgumentList "-p" -wait -NoNewWindow