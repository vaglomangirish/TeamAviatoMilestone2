echo 'starting installation process' >> /var/log/sga-teamaviato-StormDetector-install.log
cd '/home/ec2-user/stormdetection'

echo 'Activating virtualenv for StormDetector Microservice' >> /var/log/sga-teamaviato-StormDetector-install.log
pip install virtualenv >> /var/log/sga-teamaviato-StormDetector-install.log
virtualenv env >> /var/log/sga-teamaviato-StormDetector-install.log
source env/bin/activate >> /var/log/sga-teamaviato-StormDetector-install.log
pip install Flask >> /var/log/sga-teamaviato-StormDetector-install.log
pip install nose >> /var/log/sga-teamaviato-StormDetector-install.log
pip install BeautifulSoup4 >> /var/log/sga-teamaviato-StormDetector-install.log
pip install Flask-SQLAlchemy >> /var/log/sga-teamaviato-StormDetector-install.log
#echo 'Running Flask Server' >> /var/log/sga-teamaviato-StormDetector-install.log
export FLASK_APP=stormdetector.py
flask run --host=0.0.0.0 --port=65000 >> /var/log/sga-teamaviato-StormDetector-server.log 2>&1 &