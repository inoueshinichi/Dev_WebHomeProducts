#!/bin/sh

echo "[Check \$DJANGO_PROJECT_NAME] $DJANGO_PROJECT_NAME"
echo "[Check \$WSGI_UNIX_SOCKET_FILE] $WSGI_UNIX_SOCKET_FILE"
# exec gunicorn $DJANGO_PROJECT_NAME.wsgi --bind="unix:$WSGI_UNIX_SOCKET_FILE"

echo "[Check \$HOST_WEB_DOMAIN] $HOST_WEB_DOMAIN"
echo "[Ckeck \$EXPORT_APP_HTTP_PORT] $EXPORT_APP_HTTP_PORT"

# exec gunicorn $DJANGO_PROJECT_NAME.wsgi --bind="http://$HOST_WEB_DOMAIN:$EXPORT_APP_HTTP_PORT"
exec gunicorn $DJANGO_PROJECT_NAME.wsgi --bind="0.0.0.0:$EXPORT_APP_HTTP_PORT"