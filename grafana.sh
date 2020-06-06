echo Instalando Grafana

sudo apt-get install libfontconfig

cd /tmp/
wget https://dl.grafana.com/oss/release/grafana_5.4.3_amd64.deb
sudo dpkg -i grafana_5.4.3_amd64.deb

echo Start Grafana:

sudo systemctl start grafana-server

echo Ensure Grafana starts at boot:

sudo systemctl enable grafana-server

exit 
