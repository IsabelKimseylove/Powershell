#replace "########" with the DistinguishedName of the OU
$cred = Get-Credential
$searchBase = "########"
$disabledComputersOU = "########"
$stale = (Get-Date).AddDays(-60) # means 90 days since last logon, can be changed to any number
Get-ADComputer -Credential $cred -Property Name,lastLogonDate -Filter {lastLogonDate -lt $stale} -SearchBase $searchBase | 
Move-ADObject -Credential $cred -TargetPath $disabledComputersOU
Get-ADComputer -Credential $cred -Searchbase $disabledComputersOU -Filter * | Disable-ADAccount
