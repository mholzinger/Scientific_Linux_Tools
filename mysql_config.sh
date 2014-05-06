#!/bin/bash

mysqlhost=$( hostname -f )

# prompt for an admin password up front 
echo -n "Assign a password for mysql admin and press [ENTER]: "
read NEW_PASSWORD

# Install MySQL Client and Server software
sudo yum groupinstall "MySQL Database server"
sudo yum -y groupinstall "MySQL Database client"

# To install MySQL system tables and Setup MySQL to start on boot
sudo /usr/bin/mysql_install_db --user=mysql
sudo chkconfig --level 2345 mysqld on
sudo service mysqld start

# Set Admin password
/usr/bin/mysqladmin -u root password $NEW_PASSWORD
/usr/bin/mysqladmin -u root -h $mysqlhost password $NEW_PASSWORD

# Log into host (do stuff)
mysql -u root -p

