# Adds Users to AD from CSV file. 

Import-Module activedirectory

$Users = Import-csv C:\Users\Administrators\Desktop\New_Users.csv

foreach($User in $Users)
{
    $NewUser     = "$($User.SamAccountName)"
    $GivenName   = "$($User.GivenName)"
    $Surname     = "$($User.Surname)"

    New-ADUser -Name $NewUser -GivenName $GivenName -Surname $Surname

}
