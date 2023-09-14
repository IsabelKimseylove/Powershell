#Uninstall Dell Packages
try{
  $32bitregpath = "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{*}" 
  $64bitregpath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{*}"
  $Uninstallers = @()
  $Uninstallercmd = @()

#Registry uninstall commands
Get-Service | Where-Object {$_.Name -like "Dell*"} | Stop-Service   -ErrorAction SilentlyContinue

try{
  #Get the 32 bit uninstaller path for 32 bit services
  $Uninstallers += Get-ItemProperty -Path $32bitregpath | Where-Object {$_.DisplayName -like "Dell*"} | Select-Object -Property "UninstallString" -ExpandProperty "UninstallString" -ErrorAction SilentlyContinue

  #Get the 64 bit uninstaller path for 64 bit services
  $Uninstallers += Get-ItemProperty -Path $64bitregpath | Where-Object {$_.DisplayName -like "Dell*"} | Select-Object -Property "UninstallString" -ExpandProperty "UninstallString" -ErrorAction SilentlyContinue

  #Create uninstallers list
  foreach($uninstaller in $Uninstallers){

  #Uninstaller
  If($uninstaller -like "*.exe*"){
  $Uninstallercmd +=  $uninstaller.UninstallString + " -silent"
  
  }else{
  $Uninstallercmd += $uninstaller.UninstallString + " /quiet"
  }
}
}catch{
  Write-Output "Dell services could not be uninstalled"
  
  }

  foreach($cmdline in $Uninstallercmd){
    try{
    write-host $cmdline
      & "C:\Windows\SYSTEM32\cmd.exe" /c $cmdline -ErrorAction SilentlyContinue

    }catch{
      $errMsg = $_.Exception.Message
      Write-Error $errMsg

    }
   
  }

  #uninstall power manager bc it's a little shit
  try{
    & "C:\Windows\SYSTEM32\cmd.exe" /c "MsiExec.exe /Uninstall {18469ED8-8C36-4CF7-BD43-0FC9B1931AF8} /quiet" -ErrorAction SilentlyContinue

  }catch{



  }
  
#File Path uninstall commands

try {
Get-ChildItem -Path "C:\ProgramData\Package Cache\{*}\Dell*.exe"
}
catch {

}

 Exit 0
}catch {
Exit 1 
}

