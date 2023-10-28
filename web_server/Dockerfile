# Nginx web server with staging building of certbot

# SSL証明書と秘密鍵を踏み台イメージからコピー
# COPY --from=builder /etc/letsencrypt/live/$HOST_WEB_DOMAIN/fullchain.pem /etc/letsencrypt/live/$HOST_WEB_DOMAIN
# COPY --from=builder /etc/letsencrypt/live/$HOST_WEB_DOMAIN/privkey.pem /etc/letsencrypt/live/$HOST_WEB_DOMAIN

FROM nginx:1.25.3

ARG EMAIL
LABEL author=$EMAIL

# Refresh repository
RUN apt update -y && apt upgrade -y && apt clean -y

# Locale
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
# ENV LC_ALL ja_JP.UTF-8

# Timezone
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# Install Certbot
RUN apt-get install -y \
    certbot \
    python3-certbot-nginx

# Setting nginx
ARG NAIVE_WEB_HTTP_PORT
EXPOSE $NAIVE_WEB_HTTP_PORT
ARG NAIVE_WEB_HTTPS_PORT
EXPOSE $NAIVE_WEB_HTTPS_PORT
ARG HOST_WSGI_DOMAIN
ARG EXPORT_WSGI_HTTP_PORT
ENV WSGI_HTTP_SERVER=http://$HOST_WSGI_DOMAIN:$EXPORT_WSGI_HTTP_PORT

COPY ./nginx.conf.tmp /etc/nginx/nginx.conf.tmp
COPY ./html/ /usr/share/nginx/html/

# ShellScript
COPY ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["sh", "/usr/local/bin/start.sh"]