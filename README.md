# django-template
My custom django template, using this in case of racing with deadlines

# Getting started
## 1. Prerequisites
Install python distribution (conda), either miniconda or anaconda
```bash
make init conda=miniconda #default
or
make init conda=anaconda

then
export PATH=$PATH:$HOME/miniconda3/bin
or
export PATH=$PATH:$HOME/anaconda/bin
```

## 2. Install requirements
Install requirements with pip (bundled with both of the conda dist)
```bash
make requirements
```

## 3. Starting the DEV server
```bash
make start-dev
```

# Deploying the application
## 1. Build app.service for systemd
```bash
make build
```

## 2. Install and deploy into systemd
```bash
sudo make deploy
```

## 3. Restarting app
Changes to the django code will be automatically reloaded by gunicorn so technically no hard restart is needed to app service. However, just in case:
```bash
sudo make restart
```

### Notes:
If there is an error when using this template in Ubuntu Server, please install the following packages via apt.
```bash
sudo apt-get update && sudo apt-get install build-essential python3-dev
```
