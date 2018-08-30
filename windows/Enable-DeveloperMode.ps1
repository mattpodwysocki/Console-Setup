# Disabkle defender
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1 -Type DWord

# Disable Indexing
Stop-Service -Name WSearch -Force
Set-Service -Name WSearch -StartupType Disabled