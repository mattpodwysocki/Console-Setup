export PATH="/usr/local/sbin:$PATH"

export ZSH="/Users/matthewp/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
  git
  osx
  vscode
  sudo
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='code-insiders'

# ZSH completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Brew command not found like apt-get not found
if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /usr/local/etc/profile.d/z.sh ] && . /usr/local/etc/profile.d/z.sh
eval "$(thefuck --alias)"

# GO Development
export GOROOT=$(brew --prefix golang)/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

export PATH=$PATH:$HOME/.dotnet/tools
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.fastlane/bin
export PATH=$PATH:$HOME/.fluttersdk/bin

#export JAVA_HOME="$(/usr/libexec/java_home)"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
export ANDROID_HOME=/Users/matthewp/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_AVD_HOME=/Users/matthewp/.android/avd
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# opam configuration
test -r /Users/matthewp/.opam/opam-init/init.zsh && . /Users/matthewp/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Adds NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Aliases
alias zshconfig='$EDITOR~/.zshrc'
alias ohmyzsh='$EDITOR ~/.oh-my-zsh'
alias sourcezsh='source ~/.zshrc'
[ -f ~/.aliases ] && source ~/.aliases

# add support for ctrl+o to open selected file in VS Code Insiders
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute($EDITOR {})+abort'"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"