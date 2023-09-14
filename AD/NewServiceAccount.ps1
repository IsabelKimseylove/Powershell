$cred = Get-Credential
$GMSANAME = Read-Host "What is the group managed service account name?"
$DNSHOST = Read-Host "What is the DNS Host?"
$Principals = Read-Host "What computer will the GMSA be used on? Ex: SERVERNAME$"
$Description = Read-Host "What will this account be used for?"
New-ADServiceAccount -Credential $cred -Name $GMSANAME -DNSHostName $DNSHOST -PrincipalsAllowedToRetrieveManagedPassword $Principals -Description $Description -Enabled $True 

Write-Host "

Run this script on client computer

Add-WindowsFeature RSAT-AD-PowerShell
Install-ADServiceAccount $GMSANAME
Test-ADServiceAccount $GMSANAME"