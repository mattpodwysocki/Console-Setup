export ZSH="/home/matthewp/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(
  git
  ubuntu
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nano

# CLI
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval $(thefuck --alias)
[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh

# Go Development
export GOROOT=$(brew --prefix golang)/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# Languages
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.deno/bin

# Aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias sourcezsh="source ~/.zshrc"
[ -f $HOME/.aliases ] && source ~/.aliases

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
