# Installs Windows Active Directory Domain Services and Management Tools
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools 

# Installs Hyper-V and Management Tools
Install-WindowsFeature Hyper-V -IncludeManagementTools -restart