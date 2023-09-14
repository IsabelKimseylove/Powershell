$lastboottime = net statistics workstation | select-string "Statistics"
$cleanboottime = [datetime]($lastboottime -split "since")[2]

$rebootperiod = (Get-Date).Addhours(-22)

if ($cleanboottime -ge $rebootperiod) {
    Write-Output "Inside reboot period"
}else{
    
shutdown.exe /g /t 300 /c "This computer will reboot in 5 minutes for weekly maintenance. Please save all work." /d p:4:1 /f

}
