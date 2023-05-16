#!/bin/sh

# Log as super user and install common tools
sudo -i
yum install vim -y

# Install and run HTTPS
yum install httpd -y

service httpd start

# Use an index file to test balancer
cp /vagrant/config/index.html /var/www/html/

chmod 755 /var/www/html/index.html
