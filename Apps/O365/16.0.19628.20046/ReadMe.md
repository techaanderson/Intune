### Microsoft 365 Apps in Intune

## Base Install

# App Information
Name: Microsoft 365 Apps
Description: Install Access, PowerPoint, Excel, OneNote, Outlook, and Word with User based activation
Publisher: Microsoft
Category: Productivity
Show as featured app: yes
Notes: Available: All Office Licensed Users

# Program
Install: setup.exe /configure WH-Office.xml
Uninstall: setup.exe /configure uninstall.xml

# Detection
Registry
Key Path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\O365ProPlusRetail - en-us
Value Name: DisplayVersion
Detection Method: Version Comparison
Greater than or equal to
16.0.19628.20046

#--------------------------------------------------------------------------------


## Base+Visio Install

# App Information
Name: Microsoft 365 Apps + Visio
Description: Install Access, PowerPoint, Excel, OneNote, Outlook, Word, and Visio with User based activation
Publisher: Microsoft
Category: Productivity
Show as featured app: yes
Notes: Available: All Visio Licensed Users

# Program
Install: setup.exe /configure WH-Office-Visio.xml
Uninstall: setup.exe /configure uninstall.xml

# Detection
Registry
Key Path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\O365ProPlusRetail - en-us
Value Name: DisplayVersion
Detection Method: Version Comparison
Greater than or equal to
16.0.19628.20046

#--------------------------------------------------------------------------------

## Visio Install

# App Information
Name: Microsoft Visio
Description: Install Visio with User based activation
Publisher: Microsoft
App Version: 16.0.19628.20046+
Category: Productivity
Show as featured app: yes
Notes: Available: All Microsoft Licensed Users

# Program
Install: setup.exe /configure WH-Visio.xml
Uninstall: setup.exe /configure uninstall.xml

# Detection
Registry
Key Path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\VisioProRetail - en-us
Value Name: DisplayVersion
Detection Method: Version Comparison
Greater than or equal to
16.0.19628.20046