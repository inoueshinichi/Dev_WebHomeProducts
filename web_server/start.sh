#!/bin/bash

# NginxのWebサーバ設定からリバースプロキシーサーバ設定への変更(-i オプションで上書きコマンドをすると2つ目以降の置換が反映されない. なぜ)
sed -e "s/{{HOST_WEB_DOMAIN}}/$HOST_WEB_DOMAIN/g" /etc/nginx/nginx.conf.tmp > /etc/nginx/nginx.conf.tmp1
# echo "[Check \$HOST_WEB_DOMAIN] $HOST_WEB_DOMAIN"
sed -e "s/{{NAIVE_WEB_HTTP_PORT}}/$NAIVE_WEB_HTTP_PORT/g" /etc/nginx/nginx.conf.tmp1 > /etc/nginx/nginx.conf.tmp2
# echo "[Check \$NAIVE_WEB_HTTP_PORT] $NAIVE_WEB_HTTP_PORT"
sed -e "s/{{NAIVE_WEB_HTTPS_PORT}}/$NAIVE_WEB_HTTPS_PORT/g" /etc/nginx/nginx.conf.tmp2 > /etc/nginx/nginx.conf.tmp3
# echo "[Check \$NAIVE_WEB_HTTPS_PORT] $NAIVE_WEB_HTTPS_PORT"
sed -e "s^{{APP_HTTP_SERVER}}^$APP_HTTP_SERVER^g" /etc/nginx/nginx.conf.tmp3 > /etc/nginx/nginx.conf.tmp4
# echo "[Check \$APP_HTTP_SERVER] $APP_HTTP_SERVER"
sed -e "s/{{MAX_REQUEST_BODY_SIZE}}/$MAX_REQUEST_BODY_SIZE/g" /etc/nginx/nginx.conf.tmp4 > /etc/nginx/nginx.conf
# echo "[Check \$MAX_REQUEST_BODY_SIZE] $MAX_REQUEST_BODY_SIZE"


# 設定ファイルをログで確認
echo '[Check Nginx configuration file]'
cat /etc/nginx/nginx.conf

# PID1としてNginxを起動する
exec nginx -g "daemon off;"