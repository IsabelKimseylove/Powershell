$WingetSystemPath = Get-ChildItem -Path 'C:\Program Files\WindowsApps' -Filter 'Microsoft.DesktopAppInstaller_*x64*' | Sort-Object -Property 'LastWriteTime' -Descending | Select-Object -First 1 -ExpandProperty 'FullName'
if ((Test-Path -Path $wingetSystemPath\winget.exe)){
Write-Host "Winget programs installed, running update" 
    exit 1
}else{
    Write-Host "No winget programs installed"
    exit 1
    }    

