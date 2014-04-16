#!/bin/bash

# Help from https://library.linode.com/web-servers/nginx/python-uwsgi/centos-5

UWSGI_VER=0.9.6.8
PYV=`python -c "import sys;t='{v[0]}.{v[1]}'.format(v=list(sys.version_info[:2]));sys.stdout.write(t)";`

# Setup python dependencies
easy_install pip

# Install system dependencies for uWSGI:
yum update
yum install python python-devel libxml2 libxml2-devel python-setuptools zlib-devel wget openssl-devel pcre pcre-devel
gcc make autoconf automake

# Download and compile uWSGI:
cd /opt/
wget http://projects.unbit.it/downloads/uwsgi-$UWSGI_VER.tar.gz
tar -zxvf uwsgi-$UWSGI_VER.tar.gz
mv uwsgi-$UWSGI_VER/ uwsgi/
cd uwsgi/
python$PYV setup.py build
make

# Hack to run as sudo (normal user)
cd ..
chmod a+rxw uwsgi/

#  Add user uwsgi to /opt/
useradd -M -r --shell /bin/sh --home-dir /opt/uwsgi uwsgi

# Set the proper file permissions for calling iwsgi
chown -R uwsgi:uwsgi /opt/uwsgi
touch /var/log/uwsgi.log
chown uwsgi /var/log/uwsgi.log

# Configure uWSGI
# wget -O init-rpm.sh http://library.linode.com/assets/701-init-rpm.sh
cp bin/init-rpm.sh /etc/init.d/uwsgi
chmod +x /etc/init.d/uwsgi

# Create an /etc/default/uwsgi file to specify specific settings for your Python application. The MODULE specifies the name of the Python module that contains your wsgi specification. Consider the following example:

# File excerpt:/etc/default/uwsgi

### Other noblank features
cat <<EOF >/etc/default/uwsgi
PYTHONPATH=/srv/www/ducklington.org/application
MODULE=wsgi_configuration_module
EOF

# File:/srv/www/ducklington.org/application/wsgi_configuration_module.py

