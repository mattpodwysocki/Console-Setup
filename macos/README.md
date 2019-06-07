# macOS Configuration

As a developer, I started my career in *nix systems and have been very heavily console based for a lot of my activity. This is my basic setup for macOS as a development environment.

## Development Essentials

An essential to a productive development environment is a package manager.  Luckily, the macOS community has [Homebrew](https://brew.sh/) which allows us to be productive pretty quickly.  In addition to installing Homebrew which installs casks, we can also get alternative versions of casks via the [homebrew-cask-versions](https://github.com/Homebrew/homebrew-cask-versions) tap.  You can keep your brew up to date by running the [`cask-upgrade`](cask-upgrade) tool in this repo which will automatically update both your formulas and casks up to date, even if the casks auto update.

[QuickLook](https://en.wikipedia.org/wiki/Quick_Look) is a nice feature in macOS which allows us to view the contents of a file in finder.  This is my installation script for the QuickLook plugins which view images, videos, markdown, json, etc.

```bash
brew cask install \
    qlcolorcode \
    qlimagesize \
    qlmarkdown \
    qlstephen \
    qlvideo \
    quicklook-json \
    quicklookase \
    suspicious-package
```

Below are some of my choices per category to install. A * next to the item indicates it is a cask.

### General Productivity

- amazon-music *
- google-chrome *
- parallels *
- spotify
- vlc *
- youtube-dl

### Code Productivity

- alfred *
- android-studio *
- docker *
- iterm2-beta *
- kubernetes-cli
- minikube *
- neovim
- visual-studio-code-insiders *

### Collaboration Tools

- Discord *
- Gitter *
- Microsoft Teams *
- Slack *
- Skype *

### Languages

- deno
- dotnet-sdk *
- go
- nodejs
- python2
- python3
- ruby
- rust (Installed via rustup)
- zulu * (OpenJDK)

### Shells

- fish
- powershell *
- zsh

### Utilities

- autojump
- colordiff
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
- wget

### Version Control

- git
- git-lfs
- p4v *
- sublime-merge *

In addition, I also need multiple versions of such languages such as Ruby, Node and Python.  For those, I install the following:

- [nvm](https://github.com/creationix/nvm) Node.js
- [pipenv](https://pipenv.readthedocs.io/en/latest/) Python
- [rvm](https://rvm.io/) Ruby

## Shell Configuration

Over the years, I have used a number of shells including Bash, Fish, and Zsh and have finally settled on Zsh as my default shell.  In addition, since I do a lot of automation scripts and .NET work, I also install PowerShell Core which allows me to seamlessly take scripts across from Windows to macOS and Linux.

### ZSH Configuration

Starting off with Zsh, the number one thing to get to supercharge your experience is [Oh My Zsh](https://ohmyz.sh/) which adds many functions, helpers, plugins, and themes to make you more productive.  The [`.zshrc`](.zshrc) configuration file is in this repository which contains my setup including a number of really helpful aliases in my [.aliases](.aliases) file such as directory hopping and making the output just a bit nicer on macOS.

```bash
# Common aliases
alias cat="bat"
alias diff="colordiff"
alias dir="ls -lA"
alias grep="grep --color=always"
alias help="tldr"
alias less="less -R"
alias ls="ls -G"
alias ll="ls -lG"
alias ping="prettyping --nolegend"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop"
alias vs="open -n '/Applications/Visual Studio.app'"

# cd shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
```

### PowerShell Configuration

I also use PowerShell a bit on macOS as well as Windows and Linux for build automation for .NET Core so I can be as cross-platform as possible.  You can easily customize PowerShell with lots of extensions from the [PowerShell Gallery](http://powershellgallery.com/).

By default, I install a number of modules from the PowerShell Gallery including:

- `Get-ChildItemColor` - A colorized version of `Get-ChildItem` cmdlet
- `oh-my-posh` - Theming capabilities for the console
- `posh-git` - Provides git status and git tab completion

In addition, I like syntax highlighting of PowerShell to also be done such as customizing the colors of such things as keywords, comments, strings, parameters and more.  The [cmd-colors-solarized](https://github.com/neilpa/cmd-colors-solarized) repository has two files `Set-SolarizedDarkColorDefaults.ps1` and `Set-SolarizedLightColorDefaults.ps1`.  Unfortunately, with the later releases of PowerShell and Powershell Core, the defaults no longer work and instead you can use my  [`Set-SolarizedDarkColorDefaults.ps1`](../windows/Set-SolarizedDarkColorDefaults.ps1) and [`Set-SolarizedLightColorDefaults.ps1`](../windows/Set-SolarizedLightColorDefaults.ps1) files which corrects the files.

There are a number of customizations I have done to my PowerShell to make it feel like home like adding for utilities such as `thefuck`, and change the prompt to use [Agnoster](https://github.com/agnoster/agnoster-zsh-theme).  I also add some useful aliases too.

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

# General aliases
Set-Alias cat bat
function ping { & prettyping --nolegend $args }
function top { & sudo htop $args }
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

### iTerm2 Configuration

For macOS, I changed my default shell to use [iTerm2](https://www.iterm2.com/) which gives us nice flexibility and customization above and beyond the built-in Terminal.app. Much like Visual Studio Code Insiders, I like living on the edge with Iterm2-Beta installed via [homebrew-cask-versions](https://github.com/Homebrew/homebrew-cask-versions).  I keep most of the defaults except change my font to `Fira Code for Powerline` and change my theme to `Solarized Dark`.
