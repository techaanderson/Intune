##Script used to display installed software and the Product code, used for writting install/uninstall scripts.

get-wmiobject Win32_Product | Format-Table IdentifyingNumber, Name