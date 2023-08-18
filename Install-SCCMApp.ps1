Function Trigger-AppInstallation
{
 
#$Computername = $env:COMPUTERNAME
#$AppName = "VMWare Tools v11.3.0"
$Method = "Install"
$Application = Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK"  
#| Where-Object {$_.Name -like $AppName})
 
$Args = @{EnforcePreference = [UINT32] 0
#Id = "$($Application.id)"
#IsMachineTarget = $Application.IsMachineTarget
IsRebootIfNeeded = $False
Priority = 'High'
#Revision = "$($Application.Revision)"
 }
 
 
Invoke-CimMethod -Namespace "root\ccm\clientSDK" -ClassName CCM_Application -MethodName $Method -Arguments $Args
 
}

Trigger-AppInstallation

