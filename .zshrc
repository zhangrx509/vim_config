# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/renxuan/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z extract thefuck tmux)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

# alias ohmyzsh="mate ~/.oh-my-zsh"

alias qdb="/home/renxuan/qnx700/host/linux/x86_64/usr/bin/ntoaarch64-gdb"
alias tmux='tmux-next -2'
alias asimov_remote='ssh -p 33 root@10.111.3.26'
alias lion_remote='ssh -p 23 ironman@10.111.3.26'
alias asp='cat ~/Documents/asimov_pw | xsel'
alias lsp='cat ~/Documents/lion_pw | xsel'
alias asc='cat ~/Documents/asimov_pw | xsel; ssh root@172.20.1.12'
alias lsc='cat ~/Documents/lion_pw | xsel; ssh ironman@172.20.1.1'
alias asftp='cat ~/Documents/asimov_pw | xsel; sftp root@172.20.1.12'
alias lsftp='cat ~/Documents/lion_pw | xsel; sftp ironman@172.20.1.1'
alias mesftp='cat ~/Documents/me_pw | xsel; sftp NIO@ftpclient1.mobileye.com'
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias aup="cangen can0 -g 640 -I 505 -L 8&"
alias adown="kill \$(ps aux | grep \"cangen can0 -g 640 -I 505 -L 8\" | awk '{print \$2}')"
alias gerrit-restart='ssh restarter@gerrit-ad ./gerrit_restart'
alias areset="ssh mypi '~/switch_asimov.sh r'"
alias cat="bat"
alias pi_eth1_reset="ssh mypi 'sudo ifconfig eth1 down;sudo ifconfig eth1 up'"
eval "$(thefuck --alias)"

function atopi() {
  if [[ -z $2 ]]; then
    dstip=10.111.3.192
  else
    dstip=$2
  fi
  if [[ -z $1 ]]; then
    sudo iptables -t nat -A OUTPUT -d 172.20.1.12 -j DNAT --to-destination $dstip
  else
    if [[ $1 -eq 0 ]]; then
      sudo iptables -t nat -F OUTPUT
    else
      sudo iptables -t nat -A OUTPUT -d 172.20.1.12 -j DNAT --to-destination $dstip
    fi
  fi
}

function upcan() {
  if [[ -z $2 ]]; then
    bitrate=500000;
  else
    bitrate=$2;
  fi
  canif=can$1
  sudo ip link set $canif type can bitrate $bitrate
  sudo ifconfig $canif txqueuelen 20000
  sudo ifconfig $canif up
}

function ascp() {
  cat ~/Documents/asimov_pw | xsel;
  if [[ -z $2 ]]; then
    dir=/root;
  else
    dir=$2;
  fi
  scp $1 root@172.20.1.12:$dir;
}

function lscp() {
  cat ~/Documents/lion_pw | xsel;
  if [[ -z $2 ]]; then
    dir=/home/ironman;
  else
    dir=$2;
  fi
  scp $1 ironman@172.20.1.1:$dir;
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# python virtualenv
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh
# qnx env
#source ~/qnx700/qnxsdp-env-zsh.sh

# zmv
autoload zmv
# python path
export PYTHONPATH=/usr/local/lib/python2.7/dist-packages

