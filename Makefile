# grasping environment
conda?=miniconda
user=$(shell id -u)

# deployment settings
gunicorn?=$(shell which gunicorn)
devPort?=8000
prodPort?=8000
hostname?=0.0.0.0
projectDir=$(PWD)

.PHONY: build deploy

build-dir:
	mkdir -p build

init:
	./scripts/install-conda.sh $(conda)
	
requirements:
	pip install -r requirements.txt

start-dev:
	python app/manage.py runserver 0:$(devPort) 

#### Deployment section ####
build: build-dir
	sed -e 's#<gunicorn_path>#$(gunicorn)#' \
		-e 's#<project_dir>#$(projectDir)/app#' \
		-e 's#<hostname>#$(hostname)#' \
		-e 's#<port>#$(prodPort)#' \
		deploy/app.service > build/app.service

deploy:
ifeq ($(user),0)
	sudo cp build/app.service /etc/systemd/system/app.service
	sudo systemctl enable app.service
	sudo systemctl start app.service
else
	@echo "Please run as sudo to install"
endif

restart:
ifeq ($(user),0)
	sudo systemctl restart app.service
else
	@echo "Please run as sudo to restart"
endif
#### Deployment section ####