#Find App
Get-Package -Provider Programs -IncludeWindowsInstaller -Name * | Select-Object Name, Version | Sort-Object Name -Descending