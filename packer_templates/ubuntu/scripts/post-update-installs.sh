#!/bin/sh -eux
export DEBIAN_FRONTEND=noninteractive

ubuntu_version="`lsb_release -r | awk '{print $2}'`";
major_version="`echo $ubuntu_version | awk -F. '{print $1}'`";


# Install apache
apt-get install apache2
ufw allow 'Apache Full'
apt-get install libapache2-modsecurity
mv /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf

reboot
