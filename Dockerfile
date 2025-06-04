FROM python:3.13-alpine as BASE

WORKDIR /server

COPY requirements.txt /.


CMD ["python", "manage.py", "runserver", "0.0.0.0:3000"]