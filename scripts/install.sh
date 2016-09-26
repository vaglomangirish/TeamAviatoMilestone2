echo 'starting installation process' >> /var/log/sga-teamaviato-StormClustering-install.log
cd '/home/ec2-user/forecasttrigger'

echo 'Activating virtualenv for Forecast Trigger Microservice' >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install virtualenv >> /var/log/sga-teamaviato-ForecastTrigger-install.log
virtualenv env >> /var/log/sga-teamaviato-ForecastTrigger-install.log
source env/bin/activate >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install Flask >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install nose >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install BeautifulSoup4 >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install Flask-SQLAlchemy >> /var/log/sga-teamaviato-ForecastTrigger-install.log
pip install requests >> /var/log/sga-teamaviato-ForecastTrigger-install.log
echo 'Running Flask Server' >> /var/log/sga-teamaviato-ForecastTrigger-install.log
export FLASK_APP=forecast_trigger.py
flask run --host=0.0.0.0 --port=63000 >> /var/log/sga-teamaviato-ForecastTrigger-server.log 2>&1 &