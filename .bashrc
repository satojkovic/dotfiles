set bell-style none

if [ -f "$HOME/.git-completion.sh" ]; then
	source ~/.git-completion.sh
	PS1='\[\033[0;37m\][\[\033[0;32m\]\t \[\033[1;36m\]\u\[\033[0;37m\]@\h \[\033[0;32m\]\w$(__git_ps1 " (%s)")\[\033[0;37m\
]\n\$ '
fi

if [ `uname` = "Darwin" ]; then
	alias em='open -a /Applications/Emacs.app/Contents/MacOS/Emacs'
	alias ls='ls -G -B -w -v'
elif [ `uname` = "Linux" ]; then
	alias ls='ls --color -F'
fi

alias pod=perldoc
complete -C perldoc-complete -o nospace -o default perldoc

if [ -d "$HOME/.nvm" ]; then
	source ~/.nvm/nvm.sh
	nvm use "v0.4.1"
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
