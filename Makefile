conda?=miniconda
python?=$(shell which python)
gunicorn?=$(shell which gunicorn)
projectDir=$(PWD)
user=$(shell id -u)

.PHONY: build deploy

build-dir:
	mkdir -p build

init: build-dir
	./scripts/install-conda.sh $(conda)
	
requirements:
	pip install -r requirements.txt

build: build-dir
	sed -e 's#<gunicorn_path>#$(gunicorn)#' \
		-e 's#<project_dir>#$(projectDir)/app#' \
		deploy/app.service > build/app.service

deploy:
ifeq ($(user),0)
	sudo cp build/app.service /etc/systemd/system/app.service
	sudo systemctl enable app.service
	sudo systemctl start app.service
else
	@echo "Please run as sudo to deploy"
endif
