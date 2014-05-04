#!/bin/bash

ARCH=x86_64
SLVer=6

Major=0.5
Minor=3-1
Rel=$Major.$Minor

# rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

wget http://packages.sw.be/rpmforge-release/rpmforge-release-$Rel.el$SLVer.rf.$ARCH.rpm
sudo rpm -ihv rpmforge-release*.rpm

sudo yum install -y htop

# remove rpmforge to prevent issue in the future
sudo yum remove -y rpmforge-release.$ARCH

