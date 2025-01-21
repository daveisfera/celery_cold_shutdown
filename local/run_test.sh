#!/usr/bin/env sh

docker exec celery python3 manage.py shell -c "from mysite.celery import long_task; long_task.delay(8)"
docker exec celery /usr/src/app/local/kill.sh
