echo 'starting installation process' >> /var/log/sga-teamaviato-ForecastTrigger-install.log
#cd '/home/ec2-user/forecasttrigger'

rm -r /home/ec2-user/forecastTrigger
mv /home/ec2-user/ForecastTrigger  /home/ec2-user/forecastTrigger
cd /home/ec2-user/forecastTrigger/
chmod 777 forecasttrigger
cd forecasttrigger

docker build -t ftrigger_img .
docker run -d -p 32000:32000 --name api-ftrigger ftrigger_img >> sga-teamaviato-ForecastTrigger-docker-server.log 2>&1 &
