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
  drahosp/ubuntu-dev "$@"
}

# Docker overrides
if [[ -a /.dockerenv  ]]; then
  export PATH=$HOME/.linuxbrew/bin:$PATH
fi

