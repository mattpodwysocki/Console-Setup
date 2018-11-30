# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  ubuntu
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR="vim"

# Just because
eval $(thefuck --alias)

# Utilities
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute($EDITOR {})+abort'"
[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh
[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh

# Languages
export PATH=$PATH:$HOME/.cargo/bin
export GOPATH=$HOME/go
export GOROOT=/home/linuxbrew/.linuxbrew/opt/go/libexec
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

# Aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias sourcezsh="source ~/.zshrc"
alias cat="bat"
alias help="tldr"
alias nuget="mono /usr/local/bin/nuget.exe"
alias ping="prettyping --nolegend"
alias powershell="pwsh"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
