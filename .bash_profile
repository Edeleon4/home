# EDITOR=nano sudo visudo
# Change the following line: (:i to insert + esc to go back + :w to save + :q to quit)
# Defaults     env_reset
# to:
# Defaults     env_reset,timestamp_timeout=960 # in minutes


export PATH=$PATH:/usr/bin

export TEST_MODE=true

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export JAVA_HOME=$(/usr/libexec/java_home)

export MYSQL_HOME=/usr/local/mysql
alias start_mysql='sudo $MYSQL_HOME/bin/mysqld_safe &'
alias stop_mysql='sudo $MYSQL_HOME/bin/mysqladmin shutdown'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Bash
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # dark background
alias ls='ls -laghFG'
alias ll='ls -laghFG'
alias l='ls -laghFG'
alias xcode='open -a xcode'
alias text='open -a TextEdit'
alias pre='open -a Preview'
alias cd..='cd ..'
alias docs='cd ~/Documents'
alias current='cd ~/Documents/current/' 

# Commom Mac programs
alias reload='source ~/.bash_profile'
alias xcode='open -a xcode'
alias mate='open -a TextMate'

alias text='open -a TextEdit'
alias pre='open -a Preview'
alias pwdfailed='syslog -k Time ge -24h | egrep -e "sshd|ftpd|afp|vnc"'

# Grep
alias grep='grep -n'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

# Git
export PS1="\[\033[38m\]\u\[\033[32m\] \w \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "
# export PS1="\[\033[38m\]\u\[\033[32m\] \w \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first $"
git config --global color.ui true
git config --global format.pretty oneline
git config --global core.autocrl input
git config --global core.fileMode true
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias push='git pull origin master && git push origin master'
alias pull='git pull origin master'
alias clone='git clone $1'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Finder: show hiddeh files
# defaults write com.apple.finder AppleShowAllFiles TRUE
# killall Finder

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
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }
setjdk 1.7
# Android
export ANDROID_SDK=/Applications/android-sdks/
export ANDROID_ROOT=$ANDROID_SDK
export ANDROID_HOME=$ANDROID_SDK

export ANDROID_NDK=/Applications/android-ndk-r8c
export NDK_ROOT=$ANDROID_NDK

export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Python 
export PYTHONPATH="/usr/local/lib/python2.7/site-packages"

# Go
export GOPATH="$HOME/Documents/Classes/6.824/workspace/src/github.com/edeleon4/labs/"


export PATH=$PATH:$GOPATH/bin
export CUDA_HOME=/Developer/NVIDIA/CUDA-8.0 ## This is the default location on macOS
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$CUDA_HOME/lib:$DYLD_LIBRARY_PATH"
export PATH="$CUDA_HOME/bin:$PATH"


_fab_completion() {
    COMPREPLY=()

    # Fab in the path?
    /usr/bin/which -s fab || return 0

    # Fabfile in this folder?
    [[ -e fabfile.py ]] || return 0

    local cur="${COMP_WORDS[COMP_CWORD]}"

    tasks=$(fab --shortlist)
    COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
}

complete -F _fab_completion fab
export HISTTIMEFORMAT="%d/%m/%y %T "
PATH=/opt/local/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave

export PATH
