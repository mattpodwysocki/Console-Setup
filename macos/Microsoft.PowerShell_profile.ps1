# Solarized Dark
$solarizedDark = Join-Path (Split-Path -Parent -Path $PROFILE) "Set-SolarizedDarkColorDefaults.ps1"
if (Test-Path $solarizedDark) {
	. $solarizedDark
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
function Update-Profile { & $PROFILE }
Set-Alias up Update-Profile

function Set-EnvironmentVariable($name, $value) {
	Set-Item -Force -Path "env:$name" -Value $value;
}
Set-Alias export Set-EnvironmentVariable

#which
function which($name) {
	Get-Command $name | Select-Object -ExpandProperty Definition
}

# Show all options
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

Import-Module posh-git
Import-Module oh-my-posh
Import-Module AzureRM.Netcore
Set-Theme Paradox