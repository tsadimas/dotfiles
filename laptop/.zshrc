# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/argiris/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="refined"
#ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
plugins=(
  git
  fzf-zsh
  docker
  zsh-syntax-highlighting
  alias-tips
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

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

export PATH=$PATH:~/go/bin:~/opt/Postman/
alias c=clear
alias cat=ccat
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=2000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/argiris/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/argiris/google-cloud-sdk/path.zsh.inc' ]; then source '/home/argiris/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/argiris/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/argiris/google-cloud-sdk/completion.zsh.inc'; fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

alias ds8='export FLASK_PORT=8888 STORAGE_API=localhost:5000 TRIE_DB_PORT=5432; gunicorn app:app --worker-class gevent -b 0.0.0.0:8888'
alias ds9='export FLASK_PORT=9999 STORAGE_API=localhost:6000 TRIE_DB_PORT=5433; gunicorn app:app --worker-class gevent -b 0.0.0.0:9999'
alias ds7='export FLASK_PORT=7777 STORAGE_API=localhost:7000 TRIE_DB_PORT=5434; gunicorn app:app --worker-class gevent -b 0.0.0.0:7777'
alias stor5='FLASK_APP=application.py FLASK_SETTINGS=settings.cfg ./manage.py runserver --port 5000'
alias stor6='FLASK_APP=application.py FLASK_SETTINGS=settings_1.cfg ./manage.py runserver --port 6000'
alias stor7='FLASK_APP=application.py FLASK_SETTINGS=settings_2.cfg ./manage.py runserver --port 7000'
alias ddr='docker-compose down; sudo service docker restart'
alias viber='bash -c "QT_SCALE_FACTOR=0.5 /opt/viber/Viber" %u'
alias lc='colorls -lA --sd'
alias cl='colorls'


start-ssh-agent() {
sshfile=~/.ssh-agent-environment
#
if [ -n "$SSH_AUTH_SOCK" ]; then
  ssh-add -l &>/dev/null
  [[ $? != 2 ]] && unset sshfile && return 0
fi
#
if [ -e "$sshfile" ]; then
  . $sshfile &>/dev/null
  ssh-add -l &>/dev/null
  [[ $? != 2 ]] && unset sshfile && return 0
fi
#
ssh-agent -s > $sshfile && . $sshfile &>/dev/null
unset sshfile
}

start-ssh-agent &>/dev/null
