ubuntu-image:
	cd ubuntu && docker build --rm . -t dev/ubuntu

rocky-image:
	cd rocky && docker build --rm . -t dev/rocky

ruby-minimal-image:
	cd ruby && docker build --rm . -f Dockerfile.ruby-minimal -t dev/ruby-minimal

mkdocs-image:
	cd mkdocs && make build

all: ubuntu-image rocky-image mkdocs-image

# ruby-minimal-image
