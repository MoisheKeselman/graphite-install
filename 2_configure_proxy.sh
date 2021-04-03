#!/bin/bash

# install packages
sudo apt install gunicorn -y
sudo apt install nginx -y

# install nginx
sudo touch /var/log/nginx/graphite.access.log
sudo touch /var/log/nginx/graphite.error.log
sudo chmod 640 /var/log/nginx/graphite.*
sudo chown www-data:www-data /var/log/nginx/graphite.*

# copy config
sudo cp files/nginx-conf /etc/nginx/sites-available/graphite

# enable config
sudo ln -s /etc/nginx/sites-available/graphite /etc/nginx/sites-enabled
sudo rm -f /etc/nginx/sites-enabled/default

# reload service
sudo service nginx reload
