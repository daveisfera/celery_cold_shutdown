#!/usr/bin/env sh

docker compose \
  --project-name celery_cold_shutdown \
  -f local.yml \
  down
