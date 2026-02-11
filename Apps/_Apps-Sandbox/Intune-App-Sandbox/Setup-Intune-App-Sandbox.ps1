# Run As Administrator

# Install Module
Install-Module -Name Intune-App-Sandbox

# Import Module
Import-Module -Name Intune-App-Sandbox

# Update Module
Update-Module -Name Intune-App-Sandbox
Update-SandboxShell

#Configure Sandbox
Add-SandboxShell

# Get module with name like sandbox
Get-Module -Name *Sandbox* -ListAvailable
Get-Module -Name *Intune* -ListAvailable