if [ -f $HOME/.bashrc ]; then
    source ${HOME}/.bashrc
fi

export PATH=$PATH:/opt/local/bin:/opt/local/sbin

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/satojkovic/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
