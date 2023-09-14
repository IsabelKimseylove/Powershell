$service = Get-Service | Where-Object {$_.Name -like "Dell*"} -ErrorAction SilentlyContinue
$32bitregpath = "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{*}" 
$64bitregpath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{*}"


$Uninstallers = @()
#Get the 32 bit uninstaller path for 32 bit services
$Uninstallers += Get-ItemProperty -Path $32bitregpath | Where-Object {$_.DisplayName -like "Dell*"} | Select-Object -Property "UninstallString" -ErrorAction SilentlyContinue

#Get the 64 bit uninstaller path for 64 bit services
$Uninstallers += Get-ItemProperty -Path $64bitregpath | Where-Object {$_.DisplayName -like "Dell*"} | Select-Object -Property "UninstallString" -ErrorAction SilentlyContinue

If (($service.Length -eq 0) -and ($Uninstallers.count -eq 0)){
Write-Output "Compliant"
   Exit 0
}else{

Write-Warning "Not Compliant"
   Exit 1
}
