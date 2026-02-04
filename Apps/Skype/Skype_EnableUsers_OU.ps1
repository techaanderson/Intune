#########################################
# Assign Skype/Lync Pool to users in OU #
#     Created by: Aaron Anderson        #
#     Edited on: May 8th 2018           #
#########################################
#Resource
#https://docs.microsoft.com/en-us/powershell/module/skype/Enable-CsUser?view=skype-ps

#Install and import Skype for Business Server 2015 Management Shell or run on noclync13fe01

#Queries AD OU for users not enabledcls, Adds users to lync13pool01.ad.he-equipment.com registrar pool using their samaccountname@he-equipment.com for their SIP
Get-CsAdUser -OU "OU=RentalIncStaging,OU=BRANCHES,OU=HE,DC=ad,DC=he-equipment,DC=com" -Filter {Enabled -ne $True} | Enable-CsUser -RegistrarPool "lync13pool01.ad.he-equipment.com" -SipAddressType SamAccountName -SipDomain he-equipment.com