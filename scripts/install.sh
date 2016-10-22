echo 'Building Docker' >> /var/log/sdetector-docker.log 2>&1
docker build --build-arg APP_URL=http://s3-us-west-2.amazonaws.com/teamaviatobucket2/aviatoStormDetector.tar.gz -t aviato/python:v1 . >> /var/log/sdetector-docker.log 2>&1
echo 'Running docker' >> /var/log/sdetector-docker.log 2>&1
docker run -it --name storm-detector-service -h aviato.python -p 8000:8000 -d aviato/python:v1