# syntax = docker/dockerfile:1.5
FROM python:3.9.22-slim-bookworm

WORKDIR /usr/src/app

ENV PYTHONPATH=/usr/src/app

RUN --mount=type=cache,target=/var/cache/apt/,sharing=locked --mount=type=cache,target=/var/lib/apt/lists/,sharing=locked \
  apt-get update && apt-get install -y --no-install-recommends gcc libpq-dev libstdc++-12-dev

COPY --link requirements.txt /usr/src/app/
RUN --mount=type=cache,target=/root/.cache/pip \
  pip3 install --require-hashes -r requirements.txt

COPY --link . /usr/src/app/
