set bell-style none

alias em='open -a /Applications/Emacs.app/Contents/MacOS/Emacs'
alias ls='ls -G -B -w -v'

PS1='\[\033[0;37m\][\[\033[0;32m\]\t \[\033[1;36m\]\u\[\033[0;37m\]@\h \[\033[0;32m\]\w$(__git_ps1 " (%s)")\[\033[0;37m\
]\n\$ '

alias pod=perldoc
complete -C perldoc-complete -o nospace -o default perldoc
source ~/.nvm/nvm.sh
nvm use "v0.4.1"
source ~/perl5/perlbrew/etc/bashrc
export WORKON_HOME=$HOME/.virtualenvs
source `which virtualenvwrapper.sh`
source /Users/satojkovic/.pythonbrew/etc/bashrc
source ~/.git-completion.sh

