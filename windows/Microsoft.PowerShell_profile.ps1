$env:PYTHONIOENCODING="utf-8"
$PSDefaultParameterValues["Out-File:Encoding"]="utf8"

# Solarized Dark
$solarizedDark = Join-Path (Split-Path -Parent -Path $PROFILE) "Set-SolarizedDarkColorDefaults.ps1"
if (Test-Path $solarizedDark) {
	. $solarizedDark
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# Ensure that Get-ChildItemColor is loaded
Import-Module Get-ChildItemColor

# Set l and ls alias to use the new Get-ChildItemColor cmdlets
Set-Alias l Get-ChildItemColor -Option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope

# Helper function to set location to the User Profile directory
function Set-UserProfile { Set-Location ~ }
Set-Alias ~ Set-UserProfile -Option AllScope

# Set edit as alias to open VS Code Insiders
$env:EDITOR = "code-insiders --wait"
function edit {
    & "code-insiders" --disable-gpu -g @args
}

# Handy alias to edit PS Profile
function Edit-Profile { code-insiders $PROFILE }
Set-Alias ep Edit-Profile

# Update PS Profile for current session
function Update-Profile { . $PROFILE }
Set-Alias up Update-Profile

function Open-Explorer($path = $pwd) { explorer.exe $path }
Set-Alias explorer Open-Explorer

function Set-EnvironmentVariable($name, $value) {
	Set-Item -Force -Path "env:$name" -Value $value;
}
Set-Alias export Set-EnvironmentVariable

# PowerShell overrides and other aliases
Set-Alias -Name curl -Value curl.exe -Option AllScope
Set-Alias -Name wget -Value wget.exe -Option AllScope
Set-Alias -Name cat -Value bat.exe -Option AllScope
Set-Alias -Name pgrep -Value Get-Process -Option AllScope

# FZF
function Set-Preview {
    fzf.exe --preview 'bat --color \"always\" {}'
}
Set-Alias -Name preview -Value Set-Preview -Option AllScope

function New-Link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}
Set-Alias ln New-Link

# kill process
function pkill($name) {
	Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

#which
function which($name) {
	Get-Command $name | Select-Object -ExpandProperty Definition
}

# Sets Visual Studio Environment Variables
function Set-VisualStudio {
    Push-Location "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools"
    cmd /c "VsDevCmd.bat&set" |
    ForEach-Object {
        if ($_ -Match "=") {
            $v = $_.Split("="); Set-Item -Force -Path "ENV:\$($v[0])"  -Value "$($v[1])"
        }
    }
    Pop-Location
    Write-Host "`nVisual Studio 2017 Command Prompt variables set." -ForegroundColor Yellow
}
Set-Alias vs Set-VisualStudio

# Customize PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
# History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
# Bash-like completion
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

# Ensure posh-git is loaded
Import-Module -Name posh-git

# Ensure oh-my-posh is loaded
Import-Module -Name oh-my-posh

# Default the prompt to agnoster oh-my-posh theme
Set-Theme Agnoster

# Install thefuck
$env:TF_SHELL = "powershell"
Invoke-Expression "$(thefuck --alias)"