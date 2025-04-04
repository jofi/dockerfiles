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

function rocky-dev {
id=$(uuidgen | cut -c 1-4)
name=dev-$USER-$id
docker run -ti --rm \
  --name $name --hostname $name \
  -v "$HOME/:$HOME/" \
  -v "$HOME/:/home/dev/" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -w $PWD -u dev \
  dev/rocky "$@"
}

function mkdocs-dev {
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

