$s = New-PSSession -ComputerName paopaopc -Credential $cred
Invoke-Command -Session $s -ScriptBlock {function Get-Bios {Get-WmiObject Win32_Bios}}
Invoke-Command -Session $s -ScriptBlock {Get-Bios}
Import-PSSession -Session $s -CommandName Get-Bios
