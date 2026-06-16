Start-Service -name WinRM
Set-Item WSMan:\localhost\Client\TrustedHosts -Value PCName -Force
Enable-PSRemoting -SkipNetworkProfileCheck -Force