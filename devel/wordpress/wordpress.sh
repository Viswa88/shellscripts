#!/bin/bash

source ../functions.sh

sudo apt-get install php5 php5-mysql
create_dir_if_it_does_not_exist /opt/wordpress
cd /opt/wordpress
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
cd wordpress
mv wp-config-sample.php wp-config.php
vim wp-config.php


# cp -r --preserve=mode,ownership /opt/wordpress/wordpress/* /var/www/