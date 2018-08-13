ubuntu-image:
	cd ubuntu && docker build --rm . -t dev/ubuntu

debian-image:
	cd debian && docker build --rm . -t dev/debian

centos-image:
	cd centos && docker build --rm . -t dev/centos

centos6-image:
	cd centos6 && docker build --rm . -t dev/centos6

ruby-minimal-image:
	cd ruby && docker build --rm . -f Dockerfile.ruby-minimal -t dev/ruby-minimal

all: ubuntu-image debian-image centos-image centos6-image

# ruby-minimal-image
