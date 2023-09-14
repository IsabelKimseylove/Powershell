#replace "########" with the DistinguishedName of the OU
Import-module ActiveDirectory 
$userList= Import-Csv 'C:\temp\updates.csv'
$cred = Get-Credential
$searchBase = "########"
$userList | ForEach-Object {
    $Office = $_.Office
    $StaffEmail = $_.Email
    Get-ADUser -Filter "userPrincipalName -like '$StaffEmail'" -SearchBase $searchBase -Properties Office |
    Set-ADUser -Credential $cred -Office $Office
}




