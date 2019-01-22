# Path to the bash it configuration
export BASH_IT="/home/matthewp/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source "$BASH_IT"/bash_it.sh

export EDITOR="code-insiders"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh
[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh

# Go development
export GOPATH=$HOME/.go
export GOROOT=$(brew --prefix golang)/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.deno/bin
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

# OPAM configuration
. /home/matthewp/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Because we all have bad days
eval $(thefuck --alias)

alias sourceconfig="source ~/.bashrc"
alias bashconfig="$EDITOR ~/.bashrc"
alias cat="bat"
alias help="tldr"
alias nuget="mono /usr/local/bin/nuget.exe"
alias ping="prettyping --nolegend"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop"

# add support for ctrl+o to open selected file in VS Code Insiders
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code-insiders {})+abort'"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
