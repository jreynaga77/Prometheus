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

echo Descomprimiendo

tar -xvf prometheus-2.7.1.linux-amd64.tar.gz

echo Moving the configuration file and set the owner to the prometheus user:

cd prometheus-2.7.1.linux-amd64/
sudo mv console* /etc/prometheus
sudo mv prometheus.yml /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus

echo Move the binaries and set the owner:

sudo mv prometheus /usr/local/bin/
sudo mv promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

echo Create the service file:

sudo $vim /etc/systemd/system/prometheus.service

[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target



echo Start Prometheus and make sure it automatically starts on boot:

sudo systemctl start prometheus
sudo systemctl enable prometheus

exit
