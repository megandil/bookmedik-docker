FROM debian
RUN apt-get update && apt-get install -y apache2 libapache2-mod-php7.4 php7.4 php7.4-mysql mariadb-client && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY bookmedik /var/www/html/
RUN rm /var/www/html/index.html
ENV BK_USER=mysql
ENV BK_PASS=mysql
ENV BK_HOST=mariadb
ENV BK_BD=bookmedik
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
EXPOSE 80
CMD ["docker-entrypoint.sh"]