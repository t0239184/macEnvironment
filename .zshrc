ZSH_DISABLE_COMPFIX=true
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
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
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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


#******************** PATH ********************
# [Server] Apache Tomcat
export CATALINA_HOME=/usr/local/Cellar/tomcat/9.0.17/libexec
export PATH=$CATALINA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar
#export WEBAPP=$CATALINA_HOME/webapps/

# [Database] MySQL
export MYSQL_HOME=/usr/local/Cellar/mysql/8.0.15
export PATH=$MYSQL_HOME/bin:$PATH

# [Package Manager] Brew Cask
export CASK_HOME=/usr/local/Caskroom

# [Version Control]Maven
export MAVEN_HOME=/usr/local/Cellar/maven/3.6.0
export M2_HOME=$MAVEN_HOME
export PATH=$MAVEN_HOME/bin:$PATH

# [Language] Nodejs
#export NODE_HOME=/Users/An/.nvm/versions/node/v8.1.4/
#export PATH=$NODE_HOME/bin:$PATH

# [Language] Ruby
#export RUBY_HOME=/usr/local/Cellar/ruby/2.4.1_1
#export PATH=$RUBY_HOME/bin:$PATH


#[Language] Java
# Set JDK Version for PATH function
function setjdk() {
    if [ $# -ne 0 ]; then
        removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
            if [ -n "${JAVA_HOME+x}" ]; then
                removeFromPath $JAVA_HOME
            fi
        export JAVA_HOME=`/usr/libexec/java_home -v $@`
        export PATH=$JAVA_HOME/bin:$PATH
    fi
}
# Remove JDK Version for PATH function
function removeFromPath() {
    export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}
setjdk 11              # Set JDK Version
#******************* Terminal ********************
# Set ls color
DIR=Gx
SYM_LINK=Gx
SOCKET=Fx
PIPE=dx
EXE=Cx
BLOCK_SP=Dx
CHAR_SP=Dx
EXE_SUID=hb
EXE_GUID=ad
DIR_STICKY=Ex
DIR_WO_STICKY=Ex
export LSCOLORS="$DIR$SYM_LINK$SOCKET$PIPE$EXE$BLOCK_SP$CHAR_SP$EXE_SUID$EXE_GUID$DIR_STICKY$DIR_WO_STICKY"
export CLICOLOR=true

#******************** Alias **********************
alias rm='rm -ri'
alias ls='ls -aF'
alias ll='ls -aFl'
#alias du='ncdu'
#alias df='dfc'
alias quit='exit'
alias youtube-mp3='youtube-dl --embed-thumbnail --add-metadata --extract-audio --audio-format mp3 '
alias youtube-mp4='youtube-dl --embed-thumbnail --add-metadata --format mp4 '
alias vi='vim --noplugin'
#alias wget-website='wget --recursive --no-clobber --page-requisites --html-extension --#convert-links --restrict-file-names=windows --no-parent'
alias tree='tree -a'
#******************** Man Page ********************
export LESS_TERMCAP_mb=$'\E[1;31m'  #begin blinking
export LESS_TERMCAP_md=$'\E[4;32m'  #begin bold
export LESS_TERMCAP_me=$'\E[0m'     #end mode
export LESS_TERMCAP_so=$'\E[0l31m'  #begin standout-mode-info box
export LESS_TERMCAP_se=$'\E[0m'     #end stand-mode
export LESS_TERMCAP_us=$'\E[0;33m'  #begin underline
export LESS_TERMCAP_ue=$'\E[0m'     #end underline

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm #bash_completion


# For zsh syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
