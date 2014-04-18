#!/bin/bash

sudo bash -c 'cat > /etc/yum.repos.d/dropbox.repo << EOF
[Dropbox]
name=Dropbox Repository
#baseurl=http://linux.dropbox.com/fedora/$releasever/
baseurl=http://linux.dropbox.com/fedora/16/
gpgkey=http://linux.dropbox.com/fedora/rpm-public-key.asc
EOF'

sudo yum update

# Install dropbox package
sudo yum install -y dropbox

# Run dropbox package
exec /usr/bin/dropbox &

