$ProgramName = "DesktopInfo"
$ProgramPath = "$env:ProgramData\DesktopInfo"
$ProgramVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($ProgramPath).FileVersion

$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $ProgramName }
if($taskExists) {
    if($ProgramVersion -eq "3.11.0"){
        Write-Host "Found it!"
    }
}