

if(Test-Path "C:\Program Files (x86)\Common Files\Adobe\OOBE_Enterprise\RemoteUpdateManager\RemoteUpdateManager.exe"){

$RUMUpdater = "C:\Program Files (x86)\Common Files\Adobe\OOBE_Enterprise\RemoteUpdateManager\RemoteUpdateManager.exe"
Start-Process -FilePath $RUMUpdater -ArgumentList "--action=install"



}else{

Write-Output "Adobe RUM not installed"


}