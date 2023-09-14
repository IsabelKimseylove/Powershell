if(Test-Path "C:\Program Files (x86)\Common Files\Adobe\OOBE_Enterprise\RemoteUpdateManager\RemoteUpdateManager.exe"){
    Write-Output "Adobe Installed"
    Exit 1
}else{
    Write-Warning "Adobe not installed"
    Exit 0
}