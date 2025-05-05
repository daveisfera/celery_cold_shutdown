#!/usr/bin/env sh

docker exec celery_cold_shutdown python3 manage.py migrate
