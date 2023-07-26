cls

$domains = @("csgiutil","csgidev")

$allcreds = foreach ($Domain in $domains)
{
    $cred = Get-Credential $Domain

    $obj = New-Object PSObject
    Add-Member -InputObject $obj -MemberType NoteProperty -Name Domain -Value $Domain
    $obj | Add-Member -MemberType NoteProperty -Name Cred -Value $cred


    $Obj
}

 


$list = Get-Content 'C:\Sujin Data\Powershell\scripts\test.txt'
$localpath = 'C:\Sujin Data\rdp'
$store = 'c:\temp'

 


foreach ($computer in $list)
{
    $dname = $computer.Split(".")[1]

    $mycred = ($allcreds | Where-Object {$_.Domain -eq $dname}).cred

    $session = New-PSSession -ComputerName $computer -Credential $mycred

    $action = Copy-Item -Path $localpath -ToSession $session -Destination $store -Recurse

 

    Invoke-Command -ScriptBlock {$action} -Credential $mycred -ComputerName $computer
    
 }  
 