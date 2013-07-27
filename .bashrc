set bell-style none

if [ -f "$HOME/.git-completion.sh" ]; then
    source ~/.git-completion.sh
    PS1='\[(`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi`)\033[0;37m\][\[\033[0;32m\]\t \[\033[1;36m\]\u\[\033[0;37m\]@\h \[\033[0;32m\]\w$(__git_ps1 " (%s)")\[\033[0;37m\
]\n\$ '
fi

if [ -f "$HOME/.hub.bash_completion.sh" ]; then
    source ~/.hub.bash_completion.sh
    alias git="hub"
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    source `brew --prefix`/etc/bash_completion
fi

if [ `uname` = "Darwin" ]; then
    export JAVA_HOME=`/usr/libexec/java_home`
    export PATH=$JAVA_HOME/bin:$PATH
    export HADOOP_HOME=/usr/local/hadoop
    export PATH=$HADOOP_HOME/bin:$PATH
    export MAVEN_HOME=/usr/local/maven
    export PATH=$MAVEN_HOME/bin:$PATH
    export MAHOUT_HOME=/usr/local/mahout
    export PATH=$MAHOUT_HOME/bin:$PATH
    alias em='open -a /Applications/Emacs.app/Contents/MacOS/Emacs'
    alias ls='ls -G -B -w -v'
    export PYTHONPATH=/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python:$PYTHONPATH
elif [ `uname` = "Linux" ]; then
    alias ls='ls --color -F'
fi

if [ -d "$HOME/perl5" ]; then
    source ~/perl5/perlbrew/etc/bashrc
fi

if [ -d "$HOME/.virtualenvs" ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source `which virtualenvwrapper.sh`
fi

if [ -d "$HOME/.pythonbrew" ]; then
    source /Users/satojkovic/.pythonbrew/etc/bashrc
fi

export GTAGSLABEL=exuberant-ctags
alias g="git"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ll="ls -l"
alias la="ls -a"
alias lal="ls -al"
alias pod=perldoc
complete -C perldoc-complete -o nospace -o default perldoc
if [ `uname` = 'CYGWIN_NT-5.1' ]; then
	alias cs=cygstart.exe
fi

if [ -d "$HOME/.rvm" ]; then
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

export HISTSIZE=300000


