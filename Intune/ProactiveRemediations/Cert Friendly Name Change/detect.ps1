$cert = Get-ChildItem Cert:\CurrentUser\My | Where-Object { $_.Extensions.format(1) -like "*######*"}

if ($cert.FriendlyName -eq "######") {
    Write-Output "Cert properly named"
    Exit 0
}else{
    Write-Output "Cert not properly named"
    Exit 1

}