echo 'starting installation process' >> /var/log/sga-teamaviato-StormClustering-install.log
#cd '/home/ec2-user/stormclustering'

rm -r /home/ec2-user/stormClustering
mv /home/ec2-user/StormClustering  /home/ec2-user/stormClustering
cd /home/ec2-user/stormClustering/
chmod 777 stormclustering
cd stormclustering

echo 'Activating virtualenv for StormClustering Microservice' >> /var/log/sga-teamaviato-StormClustering-install.log
pip install virtualenv >> /var/log/sga-teamaviato-StormClustering-install.log
virtualenv env >> /var/log/sga-teamaviato-StormClustering-install.log
source env/bin/activate >> /var/log/sga-teamaviato-StormClustering-install.log
pip install Flask >> /var/log/sga-teamaviato-StormClustering-install.log
pip install nose >> /var/log/sga-teamaviato-StormClustering-install.log
pip install BeautifulSoup4 >> /var/log/sga-teamaviato-StormClustering-install.log
pip install Flask-SQLAlchemy >> /var/log/sga-teamaviato-StormClustering-install.log

export FLASK_APP=stormclustering.py
flask run --host=127.0.0.1 --port=31000 >> /var/log/sga-teamaviato-StormClustering-server.log 2>&1 &