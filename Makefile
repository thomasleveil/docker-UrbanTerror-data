.PHONY: build shell

DOCKER_IMAGE = tomdesinto/urbanterror-data:4.2.023

build:
	docker build --rm --tag "$(DOCKER_IMAGE)" .
	
shell:
	docker run --rm --tty --interactive "$(DOCKER_IMAGE)" /bin/bash -l
