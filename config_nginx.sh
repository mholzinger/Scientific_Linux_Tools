#!/bin/bash

# Grab SL version before adding repository
SLVER=$(cat /etc/redhat-release | sed -e 's#[^0-9]##g' | cut -c1)

### Add Nginx repo Scientific Linux
sudo bash -c 'cat <<EOF >/etc/yum.repos.d/nginx.repo
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/$SLVER/\$basearch/
gpgcheck=0
enabled=1
EOF'

### Install latest Nginx repo
sudo yum update
sudo yum install -y nginx
sudo chkconfig nginx on
sudo /etc/init.d/nginx start


