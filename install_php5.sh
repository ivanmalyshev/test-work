#!/bin/bash


##скрипт установки php5.6 для debian10
##на 8 и 9 версию реализуется так же, но в силу давнего выпуска, загружаемые ключи определяются как not trusted и установку с этих репозиториев не провести.
#судя по всему не лечится, поэтому пришлось выкатываться на дебиан 10

apt-get install apt-transport-https lsb-release ca-certificates -y
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/php.list
apt-get update -y
apt-get install php5.6 php5.6-fpm php5.6-cli -y
sudo a2enmod proxy_fcgi
sudo a2enconf php5.6-fpm
sudo systemctl restart apache2
