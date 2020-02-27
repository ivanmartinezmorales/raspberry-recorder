#!/usr/bin/env bash

echo "Hi there, you've chosen to set up a new Raspberry pi to record NDVI images."
echo "First I'm going to update everything... Please wait."

clear
sudo apt-get -y update

echo -e "\nUpgrading packages..."
sudo apt-get -y upgrade

echo "setting up photograph taking process"
######################### APPENDING CRONTAB ###################################
sudo touch /var/spool/cron/crontabs/root
touch /home/pi/bin/crontab_replacement

echo "@reboot python repeat-photo.py >> /home/pi/bin/crontab_replacement"

echo "Created root crontab... loading crontab info"
cat /home/pi/bin/crontab_replacement
echo "end of crontab file"

sudo crontab -u root /home/pi/bin/crontab_replacement
####################### END CRONTAB APPENDMENT ###############################
echo "reboot entry entered"

