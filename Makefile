ubuntu-image:
	cd ubuntu && docker build --rm . -t dev/ubuntu
	
debian-image:
	cd debian && docker build --rm . -t dev/debian

centos-image:
	cd centos && docker build --rm . -t dev/centos

all: ubuntu-image debian-image centos-image

