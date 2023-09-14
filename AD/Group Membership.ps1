$groupName = Read-Host "What is the group name?"
$outfilePath = Read-Host "File path for export, do not include file name and extension"
$fullPath = $outfilePath+$groupName+".csv"

get-adgroupmember -identity "$groupName"  | export-csv -path $fullPath -NoTypeInformation