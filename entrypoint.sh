#!/bin/sh

echo "Waiting for MySQL at $HOST:3306..."
while ! nc -z "$HOST" 3306; do
  sleep 1
done
echo "MySQL is up - running migrations"

python manage.py migrate
python manage.py runserver 0.0.0.0:8080