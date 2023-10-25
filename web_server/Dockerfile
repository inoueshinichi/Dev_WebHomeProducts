# Nginx web server

FROM nginx:1.25.3

ARG EMAIL
LABEL author=$EMAIL

# Refresh repository
RUN apt update && apt upgrade -y

# Install Certbot
# RUN apt install -y \
#     certbot \
#     python2-certbot-nginx \
#     python3-certbot-nginx

# Setting nginx
EXPOSE $NAIVE_WEB_HTTP_PORT
ARG HOST_APP_DOMAIN
ARG EXPORT_APP_HTTP_PORT
ENV APP_HTTP_SERVER=http://$HOST_APP_DOMAIN:$EXPORT_APP_HTTP_PORT

COPY ./nginx.conf.tmp /etc/nginx/nginx.conf.tmp
COPY ./html/ /usr/share/nginx/html/

# Certbot
# ARG HOST_WEB_DOMAIN
# RUN certbot --nginx -d $HOST_WEB_DOMAIN -m EMAIL --agree-tos
    
# ShellScript
COPY ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["sh", "/usr/local/bin/start.sh"]