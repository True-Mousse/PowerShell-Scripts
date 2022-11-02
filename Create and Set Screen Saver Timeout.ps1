# Creates and links a GPO called ScreenSaverTimeout to the Marketing OU

New-GPO -Name "ScreenSaverTimeout" -Comment "Sets timeout to 120 secs"

Set-GPRegistryValue -Name "ScreenSaverTimeOut" -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -ValueName ScreenSaveTimeOut -Type String -Value 120

New-GPLink -Name "ScreenSaverTimeout" -Target "ou=Marketing,dc=it305,dc=cmit305,dc=com"