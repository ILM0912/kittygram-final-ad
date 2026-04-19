FROM python:3.8-slim

WORKDIR /app

RUN pip install --upgrade pip

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD sh -c "\
    python manage.py migrate --noinput && \
    python manage.py collectstatic --noinput && \
    cp -r /app/collected_static/. /backend_static/static/ && \
    exec gunicorn --bind 0.0.0.0:8000 kittygram_backend.wsgi:application"