#!/bin/bash
sed -i 's/$this->user="root";/$this->user="'${BK_USER}'";/g' /var/www/html/core/controller/Database.php
sed -i 's/$this->pass="";/$this->pass="'${BK_PASSWORD}'";/g' /var/www/html/core/controller/Database.php
sed -i 's/$this->host="localhost";/$this->host="'${BK_HOST}'";/g' /var/www/html/core/controller/Database.php
sed -i 's/$this->ddbb="bookmedik";/$this->ddbb="'${BK_BD}'";/g' /var/www/html/core/controller/Database.php
mysql -u $BK_USER -p$BK_PASSWORD -h $BK_HOST $BK_BD < /var/www/html/schema.sql
apache2ctl -D FOREGROUND