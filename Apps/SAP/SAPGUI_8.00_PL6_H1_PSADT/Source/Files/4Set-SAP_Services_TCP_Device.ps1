<#
.SYNOPSIS
  Add ports to Windows services file for SAP
.DESCRIPTION
  Checks for entires in "C:\windows\system32\drivers\etc\services" file and adds them if they are not there.
.PARAMETER <Parameter_Name>
  None
.INPUTS
  None
.OUTPUTS
  Registry entries
.NOTES
  Version:        1.0
  Author:         Aaron Anderson
  Creation Date:  08/25/2018
  Purpose/Change: Initial script development
  
.EXAMPLE
  .\Set-SAP_Services_TCP_Device.ps1
#>

If ((Get-Content "$($env:windir)\system32\Drivers\etc\services" ) -notcontains "sapmsECQ 3601/tcp")  
 {Add-Content -Encoding UTF8  "$($env:windir)\system32\Drivers\etc\services" "sapmsECQ 3601/tcp" }
If ((Get-Content "$($env:windir)\system32\Drivers\etc\services" ) -notcontains "sapmsECP 3601/tcp")  
 {Add-Content -Encoding UTF8  "$($env:windir)\system32\Drivers\etc\services" "sapmsECP 3601/tcp" }
If ((Get-Content "$($env:windir)\system32\Drivers\etc\services" ) -notcontains "sapmsPIP 3601/tcp")  
 {Add-Content -Encoding UTF8  "$($env:windir)\system32\Drivers\etc\services" "sapmsPIP 3601/tcp" }
If ((Get-Content "$($env:windir)\system32\Drivers\etc\services" ) -notcontains "sapmsPIQ 3601/tcp")  
 {Add-Content -Encoding UTF8  "$($env:windir)\system32\Drivers\etc\services" "sapmsPIQ 3601/tcp" }
If ((Get-Content "$($env:windir)\system32\Drivers\etc\services" ) -notcontains "sapmsETA 3601/tcp")  
 {Add-Content -Encoding UTF8  "$($env:windir)\system32\Drivers\etc\services" "sapmsETA 3601/tcp" }