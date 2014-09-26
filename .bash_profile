if [ -f $HOME/.bashrc ]; then
    source ${HOME}/.bashrc
fi

export PATH=$PATH:/opt/local/bin:/opt/local/sbin

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
