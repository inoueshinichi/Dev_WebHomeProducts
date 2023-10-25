# Web server with Django, React, Node.js
# Frameworks: Django, React, Node.js
# Languages: Python, JavaScript, TypeScript, HTML, CSS


FROM python:3.11-alpine3.17

LABEL auther="inoue.shinichi.1800@gmail.com"

# Django 4.2.x LTS : https://www.djangoproject.com/download/
# Python 3.8, 3.9, 3.10, 3.11 : https://docs.djangoproject.com/en/4.2/releases/4.2/

ENV PORT 8000
EXPOSE 8000

# Redis kvs
ARG REDIS_KVS_DOMAIN
ARG REDIS_KVS_PORT


CMD ["sh", "/usr/local/bin/start.sh"]