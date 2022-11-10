# **PowerShell Scripts** #

The scripts have beeen divided due to the system restarts required when installing the necessary items. 

*For Example:*
Running "Step 1 - Rename the Host System.ps1" will require a system restart since Windows Active Directory
cannont be installed due to the pending system name change.

**# Special Note #**

- Hyper-V is also installed to be able to use the New-VHD cmdlet

- A Marketing Security Group is created to shadow the Marketing Organizational Unit (OU)
	- Reason: GPOs cannot be applied directly to OUs
	
- Users **MUST** be added to both OUs & Security Groups 
