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
    $ProPackageFullName = (Get-AppxProvisionedPackage -Online | Where {$_.Displayname -eq $App}).PackageName
 
    If ($ProPackageFullName) {
        Write-Host "Removing Provisioned Package: $ProPackageFullName"
        Remove-AppxProvisionedPackage -Online -PackageName $ProPackageFullName
    }
 
    Else {
        Write-Verbose "Unable To Find Provisioned Package: $App"
    }
}
 
## End
