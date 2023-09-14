try
{   
    $results = Get-LocalUser -Name "orgadmin"
    if (($results -eq "User kuowadmin was not found")){
    
        Write-Host "No Admin" 
        exit 1
    }
    else{
        Write-Host "Admin Exists"
        exit 0
    }    
}
catch{
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}
