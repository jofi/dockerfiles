# Source this in your dotfiles as needed

# Docker VMs
alias dev=ubuntu-dev

function ubuntu-dev {
id=$(uuidgen | cut -c 1-4)
name=dev-$USER-$id
docker run -ti --rm \
  --name $name --hostname $name \
  -v "$HOME/:$HOME/" \
  -v "$HOME/:/home/dev/" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -w $PWD -u dev \
  dev/ubuntu "$@"
}

function debian-dev {
id=$(uuidgen | cut -c 1-4)
name=dev-$USER-$id
docker run -ti --rm \
  --name $name --hostname $name \
  -v "$HOME/:$HOME/" \
  -v "$HOME/:/home/dev/" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -w $PWD -u dev \
  dev/debian "$@"
}

function centos-dev {
id=$(uuidgen | cut -c 1-4)
name=dev-$USER-$id
docker run -ti --rm \
  --name $name --hostname $name \
  -v "$HOME/:$HOME/" \
  -v "$HOME/:/home/dev/" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -w $PWD -u dev \
  dev/centos "$@"
}

function centos6-dev {
id=$(uuidgen | cut -c 1-4)
name=dev-$USER-$id
docker run -ti --rm \
  --name $name --hostname $name \
  -v "$HOME/:$HOME/" \
  -v "$HOME/:/home/dev/" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -w $PWD -u dev \
  dev/centos6 "$@"
}

function mkdocs {
  id=$(uuidgen | cut -c 1-4)
    name=mkdocs-$USER-$id
    docker run -ti --rm \
    --name $name --hostname $name \
    -v "$HOME/:$HOME/" \
    -v "$HOME/:/home/dev/" \
    -v "/var/run/docker.sock:/var/run/docker.sock" \
    -p 8000:8000 \
    -w $PWD -u dev \
    dev/mkdocs "$@"
}


# Docker overrides
if [[ -a /.dockerenv  ]]; then
  export PATH=$HOME/.linuxbrew/bin:$PATH
fi

