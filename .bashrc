set bell-style none

# git-completion
if [ -f "$HOME/.git-completion.sh" ]; then
    source ~/.git-completion.sh
    PS1='\[(`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi`)\033[0;37m\][\[\033[0;32m\]\t \[\033[1;36m\]\u\[\033[0;37m\]@\h \[\033[0;32m\]\w$(__git_ps1 " (%s)")\[\033[0;37m\
]\n\$ '
fi

# hub
if [ -f "$HOME/.hub.bash_completion.sh" ]; then
    source ~/.hub.bash_completion.sh
    alias git="hub"
fi

# homebrew
if [ -f `brew --prefix`/etc/bash_completion ]; then
    source `brew --prefix`/etc/bash_completion
fi

# aliases
alias g="git"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ll="ls -l"
alias la="ls -a"
alias lal="ls -al"
alias pod=perldoc
complete -C perldoc-complete -o nospace -o default perldoc

if [ `uname` = "Darwin" ]; then
    export JAVA_HOME=`/usr/libexec/java_home`
    export PATH=$JAVA_HOME/bin:$PATH
    alias em='open -a /Applications/Emacs.app/Contents/MacOS/Emacs'
    alias ls='ls -G -B -w -v'
elif [ `uname` = "Linux" ]; then
    alias ls='ls --color -F'
elif [ `uname` = 'CYGWIN_NT-5.1' ]; then
    alias cs=cygstart.exe
fi

export GTAGSLABEL=exuberant-ctags
export HISTSIZE=300000

# pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
if [ -d "$HOME/.pythonz/pythons/CPython-2.7.5" ]; then
    export PATH=$HOME/.pythonz/pythons/CPython-2.7.5/bin:$PATH
fi

# virtualenv
if [ -d "$HOME/.virtualenvs" ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source `which virtualenvwrapper.sh`
fi

# git prompt
GIT_PROMPT_ONLY_IN_REPO=1
if [ -d "$HOME/.bash-git-prompt" ]; then
    source ~/.bash-git-prompt/gitprompt.sh
fi

# golang
export GOROOT=/usr/local/Cellar/go/1.2.2/libexec
export GOPATH=/Users/satojkovic/projects/go
export PATH=$PATH:/usr/local/Cellar/go/1.2.2/bin:$GOPATH/bin
export DYLD_LIBRARY_PATH=$GOPATH/src/github.com/sjwhitworth/golearn/ext/lib:$DYLD_LIBRARY_PATH

# aliased git completion
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
    || complete -o default -o nospace -F _git g

