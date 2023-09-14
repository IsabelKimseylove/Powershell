#Creates local admin password. Meant to be 

$Password = Convertto-SecureString "TempPassword" -AsPlainText -Force
New-LocalUser "orgadmin" -Password $Password -FullName "orgadmin" -Description "LAPS Admin Account" |
Add-LocalGroupMember -Group "Administrators" -Member "orgadmin"