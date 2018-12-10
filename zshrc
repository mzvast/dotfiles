# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/Users/wangyang65/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(git)

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

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle z
antigen bundle extract
antigen bundle docker
antigen bundle yum
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle lukechilds/zsh-nvm
antigen bundle pyenv

# Load the theme.
antigen theme ys

# Tell antigen that you're done.
antigen apply

# Alias Section
alias fecheck='git diff origin/master --name-only | xargs fecs check --level 2 --reporter=baidu --verbose'

alias build_nm='curl -s http://hz01-sw-up07111.hz01.baidu.com:8011/public/tools/build_nm.sh | bash'

# NODE_PATH
function setnodepath() {
    nodeglobelpath=`npm root -g`
    export NODE_PATH=$nodeglobelpath
}
setnodepath  # 使用 nvm 的用户， 请确保这个命令是在`nvm.sh`之后执行。

# 本地node_modules
export PATH='./node_modules/.bin/':$PATH

# gnu-tar覆盖bsd-tar
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
# Surge Shell
export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152;export all_proxy=socks5://127.0.0.1:6153

# Redmi Cuid
function getcuid(){
    echo "kWcGluxLaKTlKSnzQ0Np3SFjRxUFvxdmIhN63bDpq2QSjRWplSxnsfj8KGVurEUFpSx3piqrtcuuN25IcN2bNA=="
}

# myip
function ip(){
    ifconfig|grep 'inet '|grep -v '127.0'|grep -Eio 'inet.*netmask'|grep -Pio '(\d|\.)+'
}
# cloudflare dns for mac.xrocket.ml
function upip(){
myip=`ifconfig|grep 'inet '|grep -v '127.0'|grep -Eio 'inet.*netmask'|grep -Pio '(\d|\.)+'`
curl -X PUT "https://api.cloudflare.com/client/v4/zones/dcf16276b9ff771bfe7cc71085ecf02e/dns_records/501ae78e08a7ea1c3e81e20221638e62" \
     -H "X-Auth-Email:mzvast@gmail.com" \
     -H "X-Auth-Key: 3a821bc66454d00eee6390910e99a28c6ee9d" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"mac.xrocket.ml","content":"'$myip'","ttl":120,"proxied":false}'
}

# 项目目录alias
alias vrx='cd ~/@Projects/baidu/heicha/avalon-vrx-teacher/avalon-vrx'
alias vrxd='cd ~/@Projects/baidu/heicha/vrxd'
alias edu='cd ~/@Projects/baidu/blueray-mobile/avalon-platform-teacher/avalon-web-platform/'
alias car='cd ~/@Projects/baidu/vr-car/car360-pc'
