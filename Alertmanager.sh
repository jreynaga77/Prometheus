cd
sudo useradd --no-create-home --shell /bin/false alertmanager

echo Creando directorio

sudo mkdir /etc/alertmanager

echo Descargando Alertmanager

cd /tmp/
wget https://github.com/prometheus/alertmanager\
/releases/download/v0.16.1/alertmanager-0.16.1.linux-amd64.tar.gz

echo Extrayendo archivos

tar -xvf alertmanager-0.16.1.linux-amd64.tar.gz
cd alertmanager-0.16.1.linux-amd64/

echo Moviendo los archivos

sudo mv alertmanager /usr/local/bin/
sudo mv amtool /usr/local/bin/

echo Permisos

sudo chown alertmanager:alertmanager /usr/local/bin/alertmanager
sudo chown alertmanager:alertmanager /usr/local/bin/amtool

sudo mv alertmanager.yml /etc/alertmanager/

echo Set the ownership of the /etc/alertmanager directory:

sudo chown -R alertmanager:alertmanager /etc/alertmanager/

