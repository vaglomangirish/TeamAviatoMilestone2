echo 'Removing existing docker instances' >> /var/log/sdetector-docker.log 2>&1
docker ps -a | grep 'storm-detector-service' | awk '{print $1}' | xargs --no-run-if-empty docker rm -f storm-detector-service
