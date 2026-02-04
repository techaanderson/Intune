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
 
ForEach ($App in $AppsList) {
    $PackageFullName = (Get-AppxPackage $App).PackageFullName
    $ProPackageFullName = (Get-AppxProvisionedPackage -Online | Where {$_.Displayname -eq $App}).PackageName
 
    If ($PackageFullName) {
        Write-Verbose "Removing Package: $App"
        Remove-AppxPackage -Package $PackageFullName
    }
 
    Else {
        Write-Host "Unable To Find Package: $App"
    }
 
    If ($ProPackageFullName) {
        Write-Verbose "Removing Provisioned Package: $ProPackageFullName"
        Remove-AppxProvisionedPackage -Online -PackageName $ProPackageFullName
    }
 
    Else {
        Write-Verbose "Unable To Find Provisioned Package: $App"
    }
}