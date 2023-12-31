
# Django Elastic Beanstalk Starter Template

This template provides a basic setup for deploying a Django application to AWS Elastic Beanstalk. It walks you through setting up a Python virtual environment, creating a Django project, configuring it for Elastic Beanstalk, and deploying it using the EB CLI.

## Prerequisites

- AWS account and credentials. [Sign up here](https://aws.amazon.com/)
- Python 3.11 or later
- pip
- virtualenv
- awsebcli

## Setup

### 1. Virtual Environment

First, set up your Python virtual environment:

```bash
# For Unix-based systems
virtualenv ~/eb-virt
source ~/eb-virt/bin/activate

# For Windows
virtualenv ~/eb-virt
~/eb-virt/Scripts/activate
```

### 2. Install Django

Install Django within the virtual environment:

```bash
pip install django
```

Verify the installation:

```bash
pip freeze
```

### 3. Create Django Project

Generate your Django application:

```bash
django-admin startproject ebdjango
cd ebdjango
```

### 4. Run Locally

Test run your site locally:

```bash
python manage.py runserver
```

## Elastic Beanstalk Configuration

### 1. Configure Django for Elastic Beanstalk

Create a `requirements.txt` file:

```bash
pip freeze > requirements.txt
```

Create a `.ebextensions` directory and add a `django.config` file with appropriate settings.

### 2. Deactivate Virtual Environment

Once done, deactivate the virtual environment:

```bash
deactivate
```

## Deploy with EB CLI

### 1. Initialize and Create Environment

Initialize your EB CLI repository and create an Elastic Beanstalk environment:

```bash
eb init -p python-3.11 django-tutorial
eb create django-env
```

### 2. Configure ALLOWED_HOSTS

Modify `ALLOWED_HOSTS` in `settings.py` to include your EB environment's domain.

### 3. Deploy

Deploy your application:

```bash
eb deploy
```

## Updating Your Application

To update your application, make changes locally and then redeploy:

```bash
eb deploy
```

## Add a Database Migration Configuration

To automate database migrations, add a `db-migrate.config` file in `.ebextensions`.

## Clean Up

To terminate your Elastic Beanstalk environment:

```bash
eb terminate django-env
```

## Notes

- For detailed instructions, refer to the [AWS Elastic Beanstalk Documentation](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html).
- This template is a starting point; customize it according to your project's needs.

# Django-Elastic-Beanstalk-Starter-Template
