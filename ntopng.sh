#!/bin/bash						     
#Created by Benjamin Calvet (benjamin.calvet@iutbeziers.fr)  
#At 18:00:32 Saturday 05/03/2016			       


echo -e "Installation de ntopng-2.4:\n"


wget http://downloads.sourceforge.net/project/ntop/ntopng/ntopng-2.4.tar.gz
tar -zxvf ntopng-2.4.tar.gz
mv ntopng-2.4 /opt/ntopng
cd /opt/ntopng
echo -e "Installation des dépendances:\n(Press any key to continue)"
read ok
apt-get update
apt-get install subversion libglib2.0 libxml2-dev libpcap-dev libtool rrdtool librrd-dev autoconf automake autogen redis-server wget libsqlite3-dev libhiredis-dev libgeoip-dev libcurl4-openssl-dev libpango1.0-dev libcairo2-dev libpng12-dev git make gcc build-essentials dh-autoreconf libmysqlclient-dev 
wget https://curl.haxx.se/download/curl-7.47.1.tar.gz
tar -zxvf curl-7.47.1.tar.gz
cd curl-7.47.1
make && make install 
cd ..
chmod +x autogen.sh
bash autogen.sh
echo -e "Autogen OK ? "
read ok
chmod +x configure
bash configure
make

