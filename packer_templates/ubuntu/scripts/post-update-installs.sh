#!/bin/sh -eux
export DEBIAN_FRONTEND=noninteractive

ubuntu_version="`lsb_release -r | awk '{print $2}'`";
major_version="`echo $ubuntu_version | awk -F. '{print $1}'`";


# Install apache
apt-get install -y apache2
ufw allow 'Apache Full'
apt-get install -y libapache2-modsecurity
mv /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf

# Install website
cd /var/www/html
git clone https://github.com/Joey-Fuentes/Joe_Fuentes-Website.git
rm index.html
mv Joe_Fuentes-Website/* . || true
mv Joe_Fuentes-Website/.* . || true
rm -rf Joe_Fuentes-Website

reboot
