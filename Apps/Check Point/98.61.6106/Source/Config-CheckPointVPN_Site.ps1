<#
.SYNOPSIS
    Configures Check Point VPN with specified configuration options.
.DESCRIPTION
    This script configures Check Point VPN using the provided settings.
    Guide: https://sc1.checkpoint.com/documents/RemoteAccessClients_forWindows_AdminGuide/Content/Topics-RA-VPN-for-Win/create.htm?tocpath=Remote%20Access%20Clients%20Command%20Line%7CCLI%20Commands%7C_____4
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  2026-02-09
  Purpose/Change: Initial script development
    
.EXAMPLE
    .\Config-CheckPointVPN_Site.ps1
    This command will execute the script to configure Check Point VPN with predefined settings.
#>

# Configure trac.exe for Check Point VPN Site
$site = "usercheck.womans.org"
$DisplayName = "usercheck.womans.org"
$LoginOption = "Woman's Login"

## Set the location to trac.exe directory
# Execute trac.exe with the specified arguments
$tracPath = "C:\Program Files (x86)\CheckPoint\Endpoint Connect\trac.exe"
& $tracPath create -s $site -di $DisplayName -lo $LoginOption