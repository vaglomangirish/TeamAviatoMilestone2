echo 'starting installation process' >> /var/log/sga-teamaviato-StormClustering-install.log
cd '/home/ec2-user/stormclustering'

echo 'Activating virtualenv for StormClustering Microservice' >> /var/log/sga-teamaviato-StormClustering-install.log
pip install virtualenv >> /var/log/sga-teamaviato-StormClustering-install.log
virtualenv env >> /var/log/sga-teamaviato-StormClustering-install.log
source env/bin/activate >> /var/log/sga-teamaviato-StormClustering-install.log
pip install Flask >> /var/log/sga-teamaviato-StormClustering-install.log
pip install nose >> /var/log/sga-teamaviato-StormClustering-install.log
pip install BeautifulSoup4 >> /var/log/sga-teamaviato-StormClustering-install.log
pip install Flask-SQLAlchemy >> /var/log/sga-teamaviato-StormClustering-install.log
echo 'Running Flask Server' >> /var/log/sga-teamaviato-StormClustering-install.log
export FLASK_APP=stormclustering.py
flask run --host=0.0.0.0 --port=64000 >> /var/log/sga-teamaviato-StormClustering-server.log 2>&1 &