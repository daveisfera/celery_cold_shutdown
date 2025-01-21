#!/usr/bin/env sh

docker exec celery python3 manage.py migrate
