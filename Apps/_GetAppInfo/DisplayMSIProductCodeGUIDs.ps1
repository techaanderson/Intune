get-wmiobject Win32_Product | Format-Table IdentifyingNumber, Name, LocalPackage -AutoSize

$program = Get-WmiObject -class Win32_Product | ? {$_.Name -eq "TeamViewer"} 
$program.IdentifyingNumber #IdentifyingNumber is the guid