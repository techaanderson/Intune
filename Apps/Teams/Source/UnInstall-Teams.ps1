###########################################################
# New Teams uninstallation
###########################################################

Write-Host "Installing new Teams"
Start-Process -FilePath "$psscriptroot\teamsbootstrapper.exe" -ArgumentList "-x" -wait -NoNewWindow