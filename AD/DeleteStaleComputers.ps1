#replace "########" with the DistinguishedName of the OU
$cred = Get-Credential
$stale = (Get-Date).AddDays(-180) # means 180 days since last logon, can be changed to any number
$disabledComputersOU = "########"
Get-ADComputer -Credential $cred -SearchBase $disabledComputersOU -Property Name,lastLogonDate -Filter {lastLogonDate -lt $stale} |
Export-Csv C:\Reports\DeletedComputers.csv -NoTypeInformation
Get-ADComputer -Credential $cred -SearchBase $disabledComputersOU -Property Name,lastLogonDate -Filter {lastLogonDate -lt $stale} |
Remove-ADComputer 
