#!/bin/sh

python manage.py migrate --noinput

python manage.py collectstatic --noinput

cp -r /app/collected_static/. /backend_static/static/

exec python -m gunicorn --bind 0.0.0.0:8000 kittygram_backend.wsgi:application