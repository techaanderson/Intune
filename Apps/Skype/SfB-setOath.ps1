<#
    .DESCRIPTION
        This script sets the registry value for Skype for Business 2016 client OAuth to binary value of 1 for the currently 
        logged on user. This is used when user is experiencing the SFB client prompting for exchange credentials after 
        migration to Office 365.

        To sanitize, remove the @he-equipment.com 

#>

[Microsoft.Win32.Registry]::SetValue("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Lync\"+$env:UserName+"@he-equipment.com","OAuthUsed",1,[Microsoft.Win32.RegistryValueKind]::DWord)
[Microsoft.Win32.Registry]::SetValue("HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Lync","AllowAdalForNonLyncIndependentOfLync",1,[Microsoft.Win32.RegistryValueKind]::DWord)
