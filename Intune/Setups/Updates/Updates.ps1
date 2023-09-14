try {
    #Install all updates
  Install-Module PSWindowsUpdate -Force
  Import-Module PSWindowsUpdate
  Get-WindowsUpdate -AcceptAll -Install -AutoReboot
  }
  catch {
    Write-Host "Updates Unsuccessful"
  }