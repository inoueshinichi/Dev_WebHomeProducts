# Web server with Django, React, Node.js
# Frameworks: Django, React, Node.js
# Languages: Python, JavaScript, TypeScript, HTML, CSS


# FROM ubuntu:20.04
FROM python:3.9.18

ARG EMAIL
LABEL auther=$EMAIL

# Reflesh
RUN apt update && apt -y upgrade

# Locale
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
# ENV LC_ALL ja_JP.UTF-8

# Timezone
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install packages & clean data
RUN apt update \
    && apt -y upgrade \
    && apt install -y \
    software-properties-common \
    --no-install-recommends \ 
    locales \
    curl \
    wget \
    build-essential \
    nodejs \
    npm \
    && apt clean \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*

# Install python libraries
# Django 4.2.x LTS : https://www.djangoproject.com/download/
# Python 3.8, 3.9, 3.10, 3.11 : https://docs.djangoproject.com/en/4.2/releases/4.2/
RUN pip install --no-cache-dir --upgrade setuptools wheel pip

RUN pip install \
    Django==4.2.6 \
    psycopg2==2.9.9 \
    django-allauth==0.58.0 \
    python-openid3==2.2.6 \
    requests==2.31.0 \
    requests-oauthlib==1.3.1 \
    gunicorn==21.2.0

# Install javascript libraries

# Port
ARG NAIVE_APP_HTTP_PORT
EXPOSE $NAIVE_APP_HTTP_PORT

# Signal
ARG APP_STOPSIGNAL
STOPSIGNAL $APP_STOPSIGNAL

# Application
ARG DJANGO_PROJECT_DIRECTORY
ARG DJANGO_PROJECT_NAME
WORKDIR /$DJANGO_PROJECT_DIRECTORY/$DJANGO_PROJECT_NAME

# NginxとDjangoの間は, gunicornとUnixソケットで通信する.
# https://qiita.com/str416yb/items/7324b99b9f05b9089b80
RUN mkdir -p /var/run/gunicorn
ARG WSGI_UNIX_SOCKET
# CMD ["gunicorn", "$DJANGO_PROJECT_NAME.wsgi", "--bind=unix:$WSGI_UNIX_SOCKET:$NAIVE_APP_HTTP_PORT"]
CMD ["python", "-u", "manage.py", "runserver", "8000"]