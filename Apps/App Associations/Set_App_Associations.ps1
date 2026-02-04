#1.Set up a reference computer
#2.Install applications
#3.Set up Default Programs and configure default apps associations
#4.Export the custom default app association by typing following command into POWERSHELL:
Dism /online /export-defaultappassociations:C:\CustomFileAssoc.xml

#Note that you need  POWERSHELL and administrator rights to use dism.exe, it didn't work for me in CMD or DEPLOYMENT AND IMG. TOOLS ENV.
#8.Log into machine, Import the XML by typing following command into POWERSHELL:
Dism /online /import-defaultappassociations:C:\CustomFileAssoc.xml