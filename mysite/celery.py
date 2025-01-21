import os
import time

from celery import Celery

# set the default Django settings module for the 'celery' program.
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mysite.settings")

app = Celery("mysite")

# Using a string here means the worker doesn't have to serialize
# the configuration object to child processes.
# - namespace='CELERY' means all celery-related configuration keys
#   should have a `CELERY_` prefix.
app.config_from_object("django.conf:settings", namespace="CELERY")

# Load task modules from all registered Django app configs.
app.autodiscover_tasks()


@app.task(queue="celery")
def long_task(value: int):
    print("Value: {}".format(value), flush=True)
    time.sleep(value)
    print("Done: {}".format(value), flush=True)


@app.task(bind=True)
def debug_task(self):
    print("Request: {0!r}".format(self.request))
