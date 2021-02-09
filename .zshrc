# READING LIST:
# https://thorsten-hans.com/5-types-of-zsh-aliases
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# https://wiki.archlinux.org/index.php/Neovim#Replacing_vi_and_vim_with_neovim
export EDITOR=nvim
export VISUAL=nvim

# Path to your oh-my-zsh installation.
export ZSH="/Users/<USER>/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gaffer"

# direnv
eval "$(direnv hook zsh)"

# brew suggestions
#   zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

#   nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.dot_files/zsh_custom


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Color
export TERM=xterm-256color

# ELIXIR
# iex command history
export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_BUILD_DOCS="yes"

# ALIAS
# avatarify

# aws

# git
alias gri="git rebase -i "
alias gpf="git push --force-with-lease --no-verify"
alias ignoreiex="git update-index --assume-unchanged .iex.exs"
alias gip="git add -A -p"
alias kill-git-branches='git branch | grep -v "master" | xargs git branch -D'

# kube
alias k='kubectl'
# complete -F __start_kubectl k
# source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
# echo "[[ $commands[kubectl] ]] && source <(kubectl completion zsh)" >> ~/.zshrc # add autocomplete permanently to your zsh shell

alias kugres="kubectl exec -it postgresql-juno-0 bash"
alias kuju="kubectl exec -it juno-0 entrypoint -- iex -S mix"
alias kucrb="kubectl exec -it cash-accounts-crb-0"
alias kes="kubectl edit sts"

# elixir
alias i="iex -S mix"
alias phx="iex -S mix phx.server"
alias mt="mix test --trace --only"

# docker
alias dc="docker-compose"
alias d="docker"
# credit daniel <3
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dra="docker ps -a -q | xargs docker rm"
alias dsa="docker ps -a -q | xargs docker stop"

# REPOS

# util
alias trubkal="trubka -b localhost:9092"
alias :q=exit
alias uuid="uuidgen | tr \"[:upper:]\" \"[:lower:]\" | tr -d '[:space:]' | pbcopy && pbpaste"
alias c='clear'

# dot files
alias cd_tst_css='cd ~/Library/Application Support/Firefox/Profiles'

# env
alias xenv='export $(cat .env | xargs)'
alias xe='export $(cat .env | xargs)'
alias da='direnv allow'
alias last-commit-sha="git rev-parse HEAD | tr -d '[:space:]' | pbcopy && pbpaste"

# tmux
alias tad='tmux attach -t dev'
alias tnd='tmux new -t dev'

# vim
alias v='nvim'
alias v.='nvim .'
alias vr='nvim -R .'
alias vr.='nvim -R .'
alias vm='nvim -M .'
alias vm.='nvim -M .'

# functions
function grl {
  grep -H -r $1 * | less
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
