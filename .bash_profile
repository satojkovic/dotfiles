if [ -f $HOME/.bashrc ]; then
    source ${HOME}/.bashrc
fi

export PATH=$PATH:/opt/local/bin:/opt/local/sbin

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

