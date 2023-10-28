#!/bin/bash

# NginxのWebサーバ設定からリバースプロキシーサーバ設定への変更(-i オプションで上書きコマンドをすると2つ目以降の置換が反映されない. なぜ)
sed -e "s/{{HOST_WEB_DOMAIN}}/$HOST_WEB_DOMAIN/g" /etc/nginx/nginx.conf.tmp > /etc/nginx/nginx.conf.tmp1
# echo "[Check \$HOST_WEB_DOMAIN] $HOST_WEB_DOMAIN"
sed -e "s/{{NAIVE_WEB_HTTP_PORT}}/$NAIVE_WEB_HTTP_PORT/g" /etc/nginx/nginx.conf.tmp1 > /etc/nginx/nginx.conf.tmp2
# echo "[Check \$NAIVE_WEB_HTTP_PORT] $NAIVE_WEB_HTTP_PORT"
sed -e "s/{{NAIVE_WEB_HTTPS_PORT}}/$NAIVE_WEB_HTTPS_PORT/g" /etc/nginx/nginx.conf.tmp2 > /etc/nginx/nginx.conf.tmp3
# echo "[Check \$NAIVE_WEB_HTTPS_PORT] $NAIVE_WEB_HTTPS_PORT"
sed -e "s^{{WSGI_HTTP_SERVER}}^$WSGI_HTTP_SERVER^g" /etc/nginx/nginx.conf.tmp3 > /etc/nginx/nginx.conf.tmp4
# echo "[Check \$WSGI_HTTP_SERVER] $WSGI_HTTP_SERVER"
sed -e "s/{{MAX_REQUEST_BODY_SIZE}}/$MAX_REQUEST_BODY_SIZE/g" /etc/nginx/nginx.conf.tmp4 > /etc/nginx/nginx.conf.tmp5
# echo "[Check \$MAX_REQUEST_BODY_SIZE] $MAX_REQUEST_BODY_SIZE"
sed -e "s^{{WSGI_UNIX_SOCKET}}^$WSGI_UNIX_SOCKET^g" /etc/nginx/nginx.conf.tmp5 > /etc/nginx/nginx.conf



# Let's EncryptでSSL証明書(デジタル署名＋公開鍵)を発行. CertbotコマンドによるSSL証明書を取得. 
# nginxは起動していないので、standaloneモードで実行.
# SSL証明書の取得時に"/usr/share/nginx/html/.well-known/acme-challenge/"にアクセスする必要がある.# https://qiita.com/mttt/items/aa2ba3a0677a803d0436
# https://qiita.com/s-katsumata/items/629222b24113d7a49b79

# nginx起動
# nginx

# certbot certonly --webroot -w /usr/share/nginx/html -d $HOST_WEB_DOMAIN -m $EMAIL --agree-tos --non-interactive

# SSL証明証の発行. Webサーバーにインストールは、まだしない.
# certbot certonly --standalone -w /usr/share/nginx/html -d $HOST_WEB_DOMAIN -m $EMAIL --agree-tos --non-interactive

# SSL証明書のインストール?
# certbot enhance --standalone -w /usr/share/nginx/html --non-interactive

# SSL証明書の更新シミュレーション(本番は、cronで定期実行させる)
# certbot renew --dry-run
# certbot renew

# nginxを停止する
# nginx -s stop # ←直ちに停止
# nginx –s quit	←リクエスト処理が完了した後停止

# 設定ファイルをログで確認
echo '[Check Nginx configuration file]'
cat /etc/nginx/nginx.conf

# PID1としてnginxを起動する
exec nginx -g "daemon off;"