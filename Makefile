ubuntu-dev:
	docker build --rm . -t drahosp/ubuntu-dev

all: ubuntu-dev
