try{

$UninstallerString = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\O365HomePremRetail - fr-fr"  -Name "UninstallString" | Select-Object -Property "UninstallString"
$UninstallCMD = $UninstallerString.UninstallString + 'Display Level= "None"'
& "C:\Windows\SYSTEM32\cmd.exe" /c  $UninstallCMD

$UninstallerString = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\O365HomePremRetail - es-es"  -Name "UninstallString" | Select-Object -Property "UninstallString"
$UninstallCMD = $UninstallerString.UninstallString + 'Display Level= "None"'
& "C:\Windows\SYSTEM32\cmd.exe" /c  $UninstallCMD

$UninstallerString = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\O365HomePremRetail - en-us"  -Name "UninstallString" | Select-Object -Property "UninstallString"
$UninstallCMD = $UninstallerString.UninstallString + 'Display Level= "None"'
& "C:\Windows\SYSTEM32\cmd.exe" /c  $UninstallCMD

$UninstallerString = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\O365HomePremRetail - fr-fr"  -Name "UninstallString" | Select-Object -Property "UninstallString"
$UninstallCMD = $UninstallerString.UninstallString + 'Display Level= "None"'
& "C:\Windows\SYSTEM32\cmd.exe" /c  $UninstallCMD

Exit 0
}catch {
    Exit 1 
}