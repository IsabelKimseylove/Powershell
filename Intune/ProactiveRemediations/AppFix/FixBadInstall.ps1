$RootPath = "HKLM:\Software\Microsoft\IntuneManagementExtension\Win32Apps"
#Get the user profiles for each logged on user
$UserWin32Profiles = Get-ChildItem -Path $RootPath -Exclude 00000000-0000-0000-0000-000000000000,OperationalState,Reporting

foreach($userProfile in $UserWin32Profiles){
$EnforcementState = $userprofile.PSPath + "\*\EnforcementStateMessage"
$badInstallPath = (Get-ItemProperty -Path $EnforcementState -Name "EnforcementStateMessage" | Where-Object {$_.EnforcementStateMessage -like '*EnforcementState":5000*'} -ErrorAction SilentlyContinue).PSParentPath
Remove-Item -Path $badInstallPath -Recurse
}
Restart-Service -Name IntuneManagementExtension