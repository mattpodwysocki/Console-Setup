# Enable defender
Set-ItemProperty -Path hklm:"\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 0 -Type DWord

# Disable Indexing
Set-Service -Name WSearch -StartupType Automatic
Start-Service -Name WSearch