#updates explicit list of winget apps 

$WingetSystemPath = Get-ChildItem -Path 'C:\Program Files\WindowsApps' -Filter 'Microsoft.DesktopAppInstaller_*x64*' | Sort-Object -Property 'LastWriteTime' -Descending | Select-Object -First 1 -ExpandProperty 'FullName'
$wingetapps = @()
$wingetapps += "7zip.7zip"


foreach($app in $wingetapps){
try
{   
Start-Process -FilePath $wingetSystemPath\winget.exe -ArgumentList "upgrade --id $app --accept-package-agreements --accept-source-agreements --silent --include-unknown" 


}catch{
    $errMsg = $_.Exception.Message
    Write-Error $errMsg

}

}
