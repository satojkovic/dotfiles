if [ -f $HOME/.bashrc ]; then
    source ${HOME}/.bashrc
fi

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/satojkovic/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

##
# Your previous /Users/satojkovic/.bash_profile file was backed up as /Users/satojkovic/.bash_profile.macports-saved_2015-07-13_at_22:33:08
##

