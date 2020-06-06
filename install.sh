#!/bin/bash

echo Se crea usuario
sudo useradd --no-create-home --shell /bin/false prometheus

echo Se crea los directorios necesarios

sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

sudo chown prometheus:prometheus /var/lib/prometheus

echo Descargando prometeo

cd /tmp/
wget https://github.com/prometheus/prometheus/releases/download/v2.7.1/prometheus-2.7.1.linux-amd64.tar.gz
Extract the files:
