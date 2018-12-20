.PHONY: build test

build:
	docker build -t dev/mkdocs .
	docker tag dev/mkdocs dev/mkdocs:latest

test:
	bundle && bundle exec rspec
