
Stop-Service -Name wuauserv
Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Recurse
Start-Service -name wuauserv
