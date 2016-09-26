echo 'starting installation process' >> /var/log/sga-teamaviato-RunForecast-install.log
cd '/home/ec2-user/runforecast'

echo 'Activating virtualenv for RunForecast Microservice' >> /var/log/sga-teamaviato-RunForecast-install.log
pip install virtualenv >> /var/log/sga-teamaviato-RunForecast-install.log
virtualenv env >> /var/log/sga-teamaviato-RunForecast-install.log
source env/bin/activate >> /var/log/sga-teamaviato-RunForecast-install.log
pip install Flask >> /var/log/sga-teamaviato-RunForecast-install.log
pip install nose >> /var/log/sga-teamaviato-RunForecast-install.log
pip install Flask-SQLAlchemy >> /var/log/sga-teamaviato-RunForecast-install.log
echo 'Running Flask Server' >> /var/log/sga-teamaviato-RunForecast-install.log
export FLASK_APP=runforecast.py
flask run --host=0.0.0.0 --port=62000 >> /var/log/sga-teamaviato-RunForecast-server.log 2>&1 &