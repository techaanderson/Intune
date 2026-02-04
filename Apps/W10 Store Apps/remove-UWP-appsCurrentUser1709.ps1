## Configure the apps to be removed
$AppsList = "Microsoft.GetHelp",
            "Microsoft.Getstarted",
            “Microsoft.Microsoft3DViewer”,
            “Microsoft.MicrosoftOfficeHub”,
            “Microsoft.MicrosoftSolitaireCollection”,
            “Microsoft.Office.OneNote”,
            “Microsoft.OneConnect”,
            “Microsoft.People”,
            “Microsoft.Print3D”,
            “Microsoft.SkypeApp”,
            “Microsoft.Wallet”,
            “microsoft.windowscommunicationsapps”,
            “Microsoft.Xbox.TCUI”,
            “Microsoft.XboxApp”,
            “Microsoft.XboxGameOverlay”,
            “Microsoft.XboxIdentityProvider”,
            “Microsoft.XboxSpeechToTextOverlay”
 
##Remove the Apps listed above or report if app not present
ForEach ($App in $AppsList)
{
    $PackageFullName = (Get-AppxPackage $App).PackageFullName
 
    If ($PackageFullName) {
        Write-Host "Removing Package: $App"
        Remove-AppxPackage -Package $PackageFullName
    }
 
    Else {
        Write-Host "Unable to find package: $App"
    }
}
 
## End