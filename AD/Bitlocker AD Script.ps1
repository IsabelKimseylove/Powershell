$computername = Read-Host "What is the computer name?"
$objComputer = Get-ADComputer $computername
$Bitlocker_Object = Get-ADObject -Filter {objectclass -eq 'msFVE-RecoveryInformation'} -SearchBase $objComputer.DistinguishedName -Properties 'msFVE-RecoveryPassword'
Write-Host $Bitlocker_Object


