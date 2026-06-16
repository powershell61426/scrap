New-PSSession -ComputerName PCName -Credential $cred
Copy-Item "C:\LocalDestination\background.jpg" -Destination "C:\RemoteDestination\background.jpg" -ToSession(Get-PSSession -Id X)
Invoke-Command -Session(Get-PSSession -Id X) -ScriptBlock{ 
    Set-ItemProperty` 
    -Path "HKCU:\Control Panel\Desktop"` 
    -Name Wallpaper` 
    -Value "C:\LocalDestination\background.jpg"`
}