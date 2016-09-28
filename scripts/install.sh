echo 'starting installation process' >> /var/log/sga-teamaviato-StormDetector-install.log
#cd '/home/ec2-user/stormdetection'

mv /home/ec2-user/StormDetector  /home/ec2-user/stormDetector
rm -r /home/ec2-user/StormDetector
cd /home/ec2-user/stormDetector/
chmod 777 stormdetection
cd stormdetection

echo 'Activating virtualenv for StormDetector Microservice' >> /var/log/sga-teamaviato-StormDetector-install.log
pip install virtualenv >> /var/log/sga-teamaviato-StormDetector-install.log
virtualenv env >> /var/log/sga-teamaviato-StormDetector-install.log
source env/bin/activate >> /var/log/sga-teamaviato-StormDetector-install.log
pip install Flask >> /var/log/sga-teamaviato-StormDetector-install.log
pip install nose >> /var/log/sga-teamaviato-StormDetector-install.log
pip install BeautifulSoup4 >> /var/log/sga-teamaviato-StormDetector-install.log
pip install Flask-SQLAlchemy >> /var/log/sga-teamaviato-StormDetector-install.log

python stormdetector.py
