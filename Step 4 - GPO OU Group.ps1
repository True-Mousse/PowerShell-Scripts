## Adds Users to AD from CSV file. 
$CSV_File = "C:\Users\Administrators\Desktop\New_Users.csv" # Location of CSV File
$Users = Import-csv $CSV_File # Imports data from CSV 

foreach($User in $Users) # Iterates through rows imported from CSV
{
    $NewUser     = "$($User.SamAccountName)" # User account name
    $GivenName   = "$($User.GivenName)" # First name of user
    $Surname     = "$($User.Surname)" # Last name of user

    New-ADUser -Name $NewUser -GivenName $GivenName -Surname $Surname # Adds username, first name, and last name to AD
}

## Change logon hours from 8AM to 8PM
$File = Get-Content C:\Users\Administrator\Desktop\Users.txt # Location of user file; file must contain usernames from AD 

[byte[]]$hours = @(15,0,255,15,0,255,15,0,255,15,0,255,15,0,255,15,0,255,15,0,255) # Array w/ logon hours set to 8AM - 8PM (binary format)S

foreach($I in $File) # Iterates through array to set logon hours for user
{
    Set-ADUser -Identity $I -Replace @{logonhours = $hours} # Sets logon hours for user
}

## Creates a dynamic VHD of 40GB in size
$VHD_Path = "C:\Users\Administrators\Desktop\VHD_File.vhd" # Location to save VHD File
NEW-VHD -Dynamic $VHD_Path -SizeBytes 40GB 

## Creates Security Group "Marketing" in Active Directory (Shadow Group)
New-ADGroup -Name "Marketing" -groupscope Global  

## Creates Organization Unit "Marketing" in Active Directory
NEW-ADOrganizationalUnit “Marketing”

## Create and link Screen Saver GPO to the Marketing OU
New-GPO -Name "ScreenSaverTimeout" -Comment "Sets timeout to 120 secs" # Creation of GPO 
 
Set-GPRegistryValue -Name "ScreenSaverTimeOut" -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -ValueName ScreenSaveTimeOut -Type String -Value 120 # Changes GP Registry 

New-GPLink -Name "ScreenSaverTimeOut" -Target "ou=Marketing,dc=it305,dc=cmit305,dc=com" # Links GPO to Marketing OU

## Create and set a Fine-Grained Password Policy Object (PSO) for the Marketing Group
## Password Policy Settings: 
##       Minimum Password History: 12
##       Minimum Password Length: 20
##       Complexity: True
New-ADFineGrainedPasswordPolicy -Name "MarketingPSO" -Precedence 10 -Description "The Marketing Group Password Policy" -DisplayName "Marketing Group PSO" -ComplexityEnabled $true -MinPasswordLength 20 -PasswordHistoryCount 12

## Links Fine-Grained Password Object to the Marketing Security Group (Shadow Group)
Add-ADFineGrainedPasswordPolicySubject -Identity "MarketingPSO" -Subjects "Marketing"
