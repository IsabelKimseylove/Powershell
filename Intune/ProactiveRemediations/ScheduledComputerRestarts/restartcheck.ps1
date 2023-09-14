$lastboottime = net statistics workstation | select-string "Statistics"
$cleanboottime = [datetime]($lastboottime -split "since")[2]

$rebootperiod = (Get-Date).Addhours(-22)

if ($cleanboottime -ge $rebootperiod) {
    Write-Output "Inside reboot period"
    Exit 0
}else{
    Write-Output "Needs reboot"
    Exit 1

}

