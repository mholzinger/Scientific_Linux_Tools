#!/bin/bash

# Grab SL version before adding repository
SLVER=$(cat /etc/redhat-release | sed -e 's#[^0-9]##g' | cut -c1)

### Add Nginx repo Scientific Linux
cat <<EOF >/etc/yum.repos.d/nginx.repo
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/$SLVER/\$basearch/
gpgcheck=0
enabled=1
EOF

### Install latest Nginx repo
yum update
yum install nginx
chkconfig nginx on
/etc/init.d/nginx start


