# Path to your oh-my-zsh installation.
export ZSH="/Users/matthewp/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  osx
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR="code-insiders"

# ZSH completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Brew command not found like apt-get not found
if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /usr/local/etc/profile.d/z.sh ] && . /usr/local/etc/profile.d/z.sh

export PATH=$PATH:$HOME/.cargo/bin
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/.fastlane/bin
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export PATH=$PATH:$HOME/.deno/bin

export JAVA_HOME="$(/usr/libexec/java_home)"
export ANDROID_HOME=/Users/matthewp/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Adds NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Because we all have bad days
eval "$(thefuck --alias)"

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

# add support for ctrl+o to open selected file in VS Code Insiders
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code-insiders {})+abort'"
