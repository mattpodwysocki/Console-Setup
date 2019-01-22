
set -x EDITOR "code-insiders"

# LinuxBrew
set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH

# Go development
set -x GOPATH $HOME/.go
set -x GOROOT (brew --prefix golang)/libexec
set -x PATH $PATH $GOPATH/bin $GOROOT/bin

# Languages
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH $HOME/.deno/bin
set -x JAVA_HOME (readlink -f /usr/bin/javac | sed "s:/bin/javac::")

# OPAM configuration
. $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

set -x FZF_DEFAULT_OPTS "--bind='ctrl-o:execute(code-insiders {})+abort'"

# Set up aliases
alias sourceconfig="source ~/.config/fish/config.fish"
alias fishconfig="$EDITOR ~/.config/fish/config.fish"
alias cat="bat"
alias help="tldr"
alias nuget="mono /usr/local/bin/nuget.exe"
alias ping="prettyping --nolegend"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop"

rvm default
