#!/bin/bash

# Install rpm package from rpmforge
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
sudo rpm -ivh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm 

# Install HTOP
sudo yum -y install htop

