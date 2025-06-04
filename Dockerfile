FROM python:3.13-alpine AS base
LABEL maintainer="codeBuddha"

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /server

COPY requirements.txt /server/


RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt
RUN mkdir -p /server/media

RUN adduser -D -s /bin/sh jam
RUN chown -R jam /server
USER jam


EXPOSE 9000

CMD ["python", "manage.py", "runserver", "0.0.0.0:9000"]