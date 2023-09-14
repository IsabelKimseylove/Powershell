try {
Get-Service | Where-Object {$_.Name -like "Dell*"} | Stop-Service
Get-AppxPackage -AllUsers -PackageTypeFilter Bundle | Where-Object {$_.PublisherId -like "htrsf667h5kn2"} | Remove-AppxPackage -AllUsers -Confirm
Get-AppxPackage -AllUsers -PackageTypeFilter Bundle | Where-Object {$_.PublisherId -like "9j0h69dmw0fzc"} | Remove-AppxPackage -AllUsers -Confirm
Get-AppxPackage -AllUsers | Where-Object {$_.PublisherId -like "htrsf667h5kn2"} | Remove-AppxPackage -AllUsers -Confirm
Get-AppxPackage -AllUsers | Where-Object {$_.PublisherId -like "9j0h69dmw0fzc"} | Remove-AppxPackage -AllUsers -Confirm
}
catch {
    Write-Error
}