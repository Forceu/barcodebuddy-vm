#!/bin/bash

echo "Welcome to BarcodeBuddy Image" > /etc/issue
echo '' >> /etc/issue
ifconfig eth0 | awk '/inet addr/ {print $2}' | cut -f2 -d: >> /etc/issue
ifconfig eth1 | awk '/inet addr/ {print $2}' | cut -f2 -d: >> /etc/issue
echo '' >> /etc/issue
echho "Login: root/barcode" >> /etc/issue
echo '' >> /etc/issue
docker pull f0rc3/barcodebuddy-docker:latest
docker run -d -v bbconfig:/config -p 80:80 -p 443:443 f0rc3/barcodebuddy-docker:latest
sleep 5
docker container prune -f
