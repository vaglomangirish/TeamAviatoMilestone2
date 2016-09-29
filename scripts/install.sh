echo 'starting installation process' >> /var/log/sga-teamaviato-StormClustering-install.log
#cd '/home/ec2-user/forecasttrigger'

rm -r /home/ec2-user/forecastTrigger
mv /home/ec2-user/ForecastTrigger  /home/ec2-user/forecastTrigger
cd /home/ec2-user/forecastTrigger/
chmod 777 forecasttrigger
cd forecasttrigger

echo 'Activating virtualenv for Forecast Trigger Microservice' >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install virtualenv >> /var/log/sga-teamaviato-ForecastTrigger-install.log
virtualenv env >> /var/log/sga-teamaviato-ForecastTrigger-install.log
source env/bin/activate >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install Flask >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install nose >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install BeautifulSoup4 >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install Flask-SQLAlchemy >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install ConfigParser
pip install requests

echo 'Running Flask Server for forecast_trigger' >> /var/log/sga-teamaviato-ForecastTrigger-install.log
nohup python forecast_trigger.py > /dev/null 2>&1 &