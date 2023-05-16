#!/bin/sh

# Log as super user and install common tools
sudo -i
yum install vim -y

# Install and run HTTPS
yum install httpd -y

cp /vagrant/config/proxy.conf /etc/httpd/conf.d

service httpd start
