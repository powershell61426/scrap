param(
    [string] $serverFile = 'servers.txt',
    [int] $throttleLimit = 10,
    [int] $numProcesses = 5
)

$gatherInformation = {
    param ([int] $procLimit = 5)
    @{
        Date = Get-Date
        FreeSpace = (Get-PSDrive c).Free
        PageFaults = (Get-WmiObject `
            Win32_PerfRawData_PerfOS_Memory).PageFaultsPersec
        TopCPU = Get-Process |
                Sort-Object CPU -Descending |
                Select-Object -First $procLimit
        TopWS = Get-Process |
                Sort-Object WS -Descending |
                Select-Object -First $procLimit
        }
}
$servers = Import-CSV $serverfile |
    foreach{$_.Name}
Invoke-Command -ThrottleLimit $throttleLimit -ComputerName $servers `
                -Credential $cred `
                -ScriptBlock $gatherInformation `
                -ArgumentList $numProcesses