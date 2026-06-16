# Microsoft 365 Apps in Intune

## Microsoft 365 Apps

### App Information - Microsoft 365 Apps

Name: Microsoft 365 Apps
Description: Install Access, PowerPoint, Excel, OneNote, Outlook, and Word with User based activation
Publisher: Microsoft
Category: Productivity
Show as featured app: yes
Notes: Available: All Office Licensed Users

### Program - Microsoft 365 Apps

Install: setup.exe /configure WH-Office.xml
Uninstall: setup.exe /configure uninstall.xml

### Detection - Microsoft 365 Apps

Registry
Key Path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\O365ProPlusRetail - en-us
Value Name: DisplayVersion
Detection Method: Version Comparison
Greater than or equal to
16.0.20026.20112

## Microsoft 365 Apps + Visio

### App Information - Microsoft 365 Apps + Visio

Name: Microsoft 365 Apps + Visio
Description: Install Access, PowerPoint, Excel, OneNote, Outlook, Word, and Visio with User based activation
Publisher: Microsoft
Category: Productivity
Show as featured app: yes
Notes: Available: All Visio Licensed Users

### Program - Microsoft 365 Apps + Visio

Install: setup.exe /configure WH-Office-Visio.xml
Uninstall: setup.exe /configure uninstall.xml

### Detection - Microsoft 365 Apps + Visio

Registry
Key Path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\O365ProPlusRetail - en-us
Value Name: DisplayVersion
Detection Method: Version Comparison
Greater than or equal to
16.0.20026.20112

Registry
Key Path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\VisioProRetail - en-us
Value Name: DisplayVersion
Detection Method: Version Comparison
Greater than or equal to
16.0.20026.20112
