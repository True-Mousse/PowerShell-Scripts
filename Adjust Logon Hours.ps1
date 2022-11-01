# Change logon hours from 8AM to 8PM
# User names are pulled from Users.txt file

$File = Get-Content C:\Users\Administrator\Desktop\Users.txt

[byte[]]$hours = @(15,0,255,15,0,255,15,0,255,15,0,255,15,0,255,15,0,255,15,0,255)

foreach($I in $File)

{

    Set-ADUser -Identity $I -Replace @{logonhours = $hours}

}