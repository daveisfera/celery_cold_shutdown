#!/usr/bin/env sh

docker exec celery_cold_shutdown python3 manage.py shell -c "from mysite.celery import long_task; long_task.delay(8)"
docker exec celery_cold_shutdown /usr/src/app/local/kill.sh
