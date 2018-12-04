# Linux Configuration

Over the years, I've used many distros of Linux with varying degrees of success from Debian, OpenSUSE, Fedora, Arch, Alpine, Ubuntu and Mint. I have finally settled on [Pop!_OS](https://system76.com/pop) from System76, which is based upon the latest Ubuntu, with the Pop! theme which makes it look really polished as a GNOME desktop.  This is my basic setup for Linux desktop environment laying out both Debian and RPM style installs.

## Development Essentials

For Linux development, I use a mixture of the native package managers for the platform as [Aptitude](https://wiki.debian.org/Aptitude) for Debian based distros, [yum](https://fedoraproject.org/wiki/Yum) for Fedora, and [Zypper](https://en.opensuse.org/SDB:Zypper_usage) for OpenSUSE.  When packages are not available or possibly outdated, I reach for a [LinuxBrew](http://linuxbrew.sh/), a fork of Homebrew written for macOS. 

Here are the some of the installs I do per category:

### Languages
- Go - `brew install go`
- Java replacing `<x>` with whatever the latest version is
    - Debian: `openjdk-<x>-jdk`
    - RPM: `java-<x>-openjdk-devel`
- [Mono](https://www.mono-project.com/download/stable/#download-lin) - `mono-devel`
- [.NET Core](https://docs.microsoft.com/en-us/dotnet/core/linux-prerequisites)
- [Node.js](https://nodejs.org/en/download/package-manager/)
- Python3
    - Debian: `python3-dev python3-pip`
    - RPM: `python3-devel python3-pip`
- Python2
    - Debian: `python-dev python-pip`
    - RPM: `python-devel python-pip`
- Ruby
    - Debian: `ruby-dev`
    - RPM: `ruby-devel`
- [Rust](https://www.rust-lang.org/en-US/install.html)

### Code Productivity
- android-studio
- docker
- kubernetes-cli
- minikube
- MonoDevelop
- Visual Studio Code Insiders
- vim

### Collaboration Tools
- Discord
- Gitter
- Slack
- Skype

### Shells
- fish
- powershell
- zsh

### Utilities
- autojump
- coreutils
- curl
- fd
- fzf
- htop
- httpie
- jq
- prettyping
- ripgrep
- thefuck
- tldr
- tmate
- tmux

### Version Control
- git
- git-lfs
- p4v

In addition, I also need multiple versions of such languages such as Ruby, Node and Python.  For those, I install the following:
- [nvm](https://github.com/creationix/nvm) Node.js
- [pipenv](https://pipenv.readthedocs.io/en/latest/) Python
- [rvm](https://rvm.io/) Ruby

## Shell Configuration

Over the years, I have used a number of shells including Bash, Fish, and Zsh and have finally settled on Zsh as my default shell.  In addition, since I do a lot of automation scripts and .NET work, I also install PowerShell Core which allows me to seamlessly take scripts across from Windows to macOS and Linux.

### ZSH Configuration

Starting off with Zsh, the number one thing to get to supercharge your experience is [Oh My Zsh](https://ohmyz.sh/) which adds many functions, helpers, plugins, and themes to make you more productive.  The [`.zshrc`](.zshrc) configuration file is in this repository which contains my setup including a number of really helpful aliases, with inspiration taken from [Remy Sharp's CLI Improved Blog Post](https://remysharp.com/2018/08/23/cli-improved).

```bash
# Aliases
alias zshconfig="code-insiders ~/.zshrc"
alias ohmyzsh="code-insiders ~/.oh-my-zsh"
alias sourcezsh="source ~/.zshrc"
alias cat="bat"
alias help="tldr"
alias ping="prettyping --nolegend"
alias powershell="pwsh" # Aliasing just because
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop" # alias top and fix high sierra bug
```

### PowerShell Configuration

I also use PowerShell a bit on macOS as well as Windows and Linux for build automation for .NET Core so I can be as cross-platform as possible.  You can easily customize PowerShell with lots of extensions from the [PowerShell Gallery](http://powershellgallery.com/).

By default, I install a number of modules from the PowerShell Gallery including:
- `Get-ChildItemColor` - A colorized version of `Get-ChildItem` cmdlet
- `oh-my-posh` - Theming capabilities for the console
- `posh-git` - Provides git status and git tab completion

In addition, I like syntax highlighting of PowerShell to also be done such as customizing the colors of such things as keywords, comments, strings, parameters and more.  The [cmd-colors-solarized](https://github.com/neilpa/cmd-colors-solarized) repository has two files `Set-SolarizedDarkColorDefaults.ps1` and `Set-SolarizedLightColorDefaults.ps1`.  Unfortunately, with the later releases of PowerShell and Powershell Core, the defaults no longer work and instead you can use my  [`Set-SolarizedDarkColorDefaults.ps1`](../windows/Set-SolarizedDarkColorDefaults.ps1) and [`Set-SolarizedLightColorDefaults.ps1`](../windows/Set-SolarizedLightColorDefaults.ps1) files which corrects the files.

There are a number of customizations I have done to my PowerShell to make it feel like home like adding for utilities such as `thefuck`, and change the prompt to use [Agnoster](https://github.com/agnoster/agnoster-zsh-theme).

```powershell
# Ensure posh-git is loaded
Import-Module -Name posh-git

# Ensure oh-my-posh is loaded
Import-Module -Name oh-my-posh

# Default the prompt to agnoster oh-my-posh theme
Set-Theme Agnoster

# Install thefuck
$env:TF_SHELL = "powershell"
Invoke-Expression "$(thefuck --alias)"
```

In addition, there are a number of keyboard shortcuts I like to use using the `PSReadLine` module.  This allows us to create pretty rich interactions with the console. For examples on usage, check out the [`PSReadline` Usage](https://github.com/lzybkr/PSReadLine#usage).  For now we're just interested in a better history and Emacs mode.
```powershell
# Customize PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
# History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
# Bash-like completion
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
```

You can find my PowerShell Profiles here:
- [Microsoft PowerShell + PowerShell Core + VSCode](Microsoft.PowerShell_profile.ps1)

## Gnome Terminal Configuration

For at least Pop!_OS, I keep the default shell which is a Pop!_OS themed [GNOME Terminal](https://help.gnome.org/users/gnome-terminal/stable/). It has everything I need for Linux development using the GNOME Desktop.  The only thing I change is to add a theme, such as `Solarized Dark` and a font such as `Fira Code for Powerline`.
