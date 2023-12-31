# Makefile for Django + AWS Elastic Beanstalk

# Configuration
VENV_NAME ?= eb-virt
PYTHON = python
PIP = pip

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : help
help : Makefile
    @sed -n 's/^##//p' $<

## all: Sets up virtual environment and installs dependencies.
all: venv

## venv: Creates virtual environment and installs Django.
venv: $(VENV_NAME)/bin/activate
$(VENV_NAME)/bin/activate: requirements.txt
    test -d $(VENV_NAME) || virtualenv $(VENV_NAME)
    ${PYTHON} -m pip install -Ur requirements.txt
    @echo "Virtual environment created. To activate, run 'source $(VENV_NAME)/bin/activate'"

## test: Runs Django tests.
test: 
    $(PYTHON) manage.py test

## run: Starts the Django development server.
run:
    $(PYTHON) manage.py runserver

## deploy: Deploys the application to AWS Elastic Beanstalk.
deploy:
    eb deploy

## clean: Removes virtual environment and temporary files.
clean:
    rm -rf $(VENV_NAME)
    find . -type f -name '*.pyc' -delete
    find . -type d -name '__pycache__' -delete

## requirements: Generates a requirements.txt file.
requirements:
    $(PIP) freeze > requirements.txt

.PHONY: all venv test run deploy clean requirements
