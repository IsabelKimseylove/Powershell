<#
Will force intune to attempt to reinstall all attempted apps. Does delete registry keys please read the full script before deploying


#>

$RootPath = "HKLM:\Software\Microsoft\IntuneManagementExtension\Win32Apps"
#Get the user profiles for each logged on user
$UserWin32Profiles = Get-ChildItem -Path $RootPath -Exclude 00000000-0000-0000-0000-000000000000,OperationalState,Reporting
$badInstallCount = 0

foreach($userProfile in $UserWin32Profiles){
$EnforcementState = $userprofile.PSPath + "\*\EnforcementStateMessage"
$badInstallPath = (Get-ItemProperty -Path $EnforcementState -Name "EnforcementStateMessage" | Where-Object {$_.EnforcementStateMessage -like '*EnforcementState":5000*'} -ErrorAction SilentlyContinue).PSParentPath
if($badInstallPath.Length -gt 0){
    $badInstallCount = $badInstallCount +1
}
}
if($badInstallCount -eq 0){
    Write-Output "Compliant"
    Exit 0
}else{
    Write-Warning "Not Compliant"
    Exit 1
}
