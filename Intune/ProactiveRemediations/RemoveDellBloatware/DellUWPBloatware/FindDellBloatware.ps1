$service = Get-Service | Where-Object {$_.Name -like "Dell*"} -ErrorAction SilentlyContinue
$dellstoreware = Get-AppxPackage -AllUsers | Where-Object {$_.PublisherId -like "htrsf667h5kn2"}
$moredellsoftware = Get-AppxPackage -AllUsers | Where-Object {$_.PublisherId -like "9j0h69dmw0fzc"}


If (($service.Length -eq 0) -and ($dellstoreware.count -eq 0) -and ($moredellsoftware.count -eq 0)){
Write-Output "Compliant"
   Exit 0
}else{

Write-Warning "Not Compliant"
   Exit 1
}
