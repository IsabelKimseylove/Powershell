If(Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\O365HomePremRetail - en-us"){
    Write-Warning "Not Compliant"
    Exit 1

}else{
    Write-Output "Compliant"
    Exit 0

}

