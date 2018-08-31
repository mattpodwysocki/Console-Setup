# Windows Configuration

As a developer, I started my career in *nix systems and have been very heavily console based for a lot of my activity. This is my basic setup for Windows as a development environment.

## Developer Mode

In order to squeeze the most performance out of a Windows development machine is to play a little unsafe.  That is to disable the Windows Search service, but also the Windows Defender service.  I have two PowerShell scripts that enable this development mode, and one that reverts it that must be run in Administrator mode.

- [`Enable-DeveloperMode.ps1`](https://github.com/mattpodwysocki/Console-Setup/blob/master/windows/Enable-DeveloperMode.ps1) - Disables Defender and Windows Search
- [`Disable-DeveloperMode.ps1`](https://github.com/mattpodwysocki/Console-Setup/blob/master/windows/Disable-DeveloperMode.ps1) - Enables Defender and Windows Search

## Development Essentials

An essential to a productive development environment is a package manager. Just as macOS has Homebrew, Windows has [Chocolatey](https://chocolatey.org/) and [Scoop](https://github.com/lukesampson/scoop) which allows us to be productive within minutes of installation.  Below are some of my choices per category.

### Languages
- dotnetcore-sdk
- go
- nodejs
- python2
- python3
- ruby
- zulu (OpenJDK)

### Version Control
- git
- git-lfs
- p4merge

### System Utilities installed via Scoop Globally
- coreutils
- cURL
- fd
- fzf
- gawk
- grep
- jq
- openssl
- openssh
- ripgrep
- sed
- sudo
- touch
- wget
- which

## Shell Configuration

The shell has been the biggest areas of customization.  Unfortunately, over the years, the Windows console has been neglected, which has given growth to such alternative consoles as [ConEmu](https://conemu.github.io/), [Cmder](https://github.com/cmderdev/cmder), [ConsoleZ](https://github.com/cbucher/console), and [Hyper](https://hyper.is/).  Luckily, with Windows 10, that has been changing with many console improvements which can be followed on the [Microsoft Command-Line Tools for Developers Blog](https://blogs.msdn.microsoft.com/commandline/).

### CMD.exe Configuration

The default colorm scheme of the Windows Console has changed as of Windows 10 Build 16257 as noted in their [blog post](https://blogs.msdn.microsoft.com/commandline/2017/08/02/updating-the-windows-console-colors/). In addition, the Windows Console Team [has released a ColorTool](https://blogs.msdn.microsoft.com/commandline/2017/08/11/introducing-the-windows-console-colortool/) which allows us to use a predefined theme.  After downloading, you can change your default color scheme to Solarized Dark by doing the following:

```
C:\Tools\ColorTool> ColorTool.exe -b solarized_dark
```

I prefer Powerline fonts for the console, in particular Menlo for Powerline, so that I get a decent experience.  To set this, go to the properties window of the console, go to font and select Menlo for Powerline.

### Cmder Configuration

The [Cmder](https://github.com/cmderdev/cmder) is a nice wrapper around [ConEmu](https://conemu.github.io/) and [Clink](https://github.com/mridgers/clink).  For my customization, I usually get rid of most of the profiles, sticking with the plain cmder profile and that's it.  Once again for the color scheme, I use Solarized which can be set via Settings => Features => Colors => Schemes.  I also change the default font from Consolas to "Menlo for Powerline" with a backup to "Source Code Pro for Powerline" via Settings => Main.

### Hyper Configuration

The [Hyper terminal](https://hyper.is/) is a great cross-platform terminal, built on Electron and web technologies.  Best of all, it is easily extensible.  The [Awesome Hyper](https://github.com/bnb/awesome-hyper) repository has a lot of customizations that you can do that allow you to work the way you want to.  

For example, I use the following plugins:
- [`hyper-solarized-dark`](https://www.npmjs.com/package/hyper-solarized-dark) - Solarized Dark Theme
- [`hyperlinks`](https://www.npmjs.com/package/hyperlinks) - Enable hyperlinks
- [`hyper-tabs-enhanced`](https://www.npmjs.com/package/hyper-tabs-enhanced) - Better Tabbed experience
- [`hyper-transparent-dynamic`](https://www.npmjs.com/package/hyper-transparent-dynamic) - Change the opacity

My hyper configuration can be found at [`.hyper.js`](.hyper.js)

## PowerShell Configuration

For most Windows related tasks, I prefer to use PowerShell. You can easily customize PowerShell with lots of extensions from the [PowerShell Gallery](http://powershellgallery.com/).

By default, I install a number of modules from the PowerShell Gallery including:
- `Get-ChildItemColor` - A colorized version of `Get-ChildItem` cmdlet
- `oh-my-posh` - Theming capabilities for the console
- `posh-git` - Provides git status and git tab completion

In addition, I like syntax highlighting of PowerShell to also be done such as customizing the colors of such things as keywords, comments, strings, parameters and more.  The [cmd-colors-solarized](https://github.com/neilpa/cmd-colors-solarized) repository has two files `Set-SolarizedDarkColorDefaults.ps1` and `Set-SolarizedLightColorDefaults.ps1`.  Unfortunately, with the later releases of PowerShell and Powershell Core, the defaults no longer work and instead you can use my  [`Set-SolarizedDarkColorDefaults.ps1`](Set-SolarizedDarkColorDefaults.ps1) and [`Set-SolarizedLightColorDefaults.ps1`](Set-SolarizedLightColorDefaults.ps1) files which corrects the files.

There are a number of customizations I have done to my PowerShell to make it feel more like *nix, such as overriding the default `cURL` and `wget` to use the native binaries instead of `Invoke-WebRequest`, adding for utilities such as `thefuck`, and change the prompt to use [Agnoster](https://github.com/agnoster/agnoster-zsh-theme).

You can find my PowerShell Profiles here:
- [Microsoft PowerShell + PowerShell Core](Microsoft.PowerShell_profile.ps1)
- [VSCode PowerShell](Microsoft.VSCode_profile.ps1)
