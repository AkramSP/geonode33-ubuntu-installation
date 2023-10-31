#!/bin/bash

sudo mkdir -p /opt/geonode/
sudo usermod -a -G www-data $USER
sudo chown -Rf $USER:www-data /opt/geonode/
sudo chmod -Rf 775 /opt/geonode/

cd /opt
git clone https://github.com/GeoNode/geonode.git -b 3.3.x geonode

sudo apt install nginx-core
pip install Django==2.2.24

cd /opt/geonode
docker-compose -f docker-compose.yml pull
docker-compose -f docker-compose.yml up -d
