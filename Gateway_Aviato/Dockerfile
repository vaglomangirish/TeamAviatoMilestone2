FROM node:argon

# Copy the necessary files
RUN mkdir -p /home/ec2-user/gateway-microservice/Gateway_Aviato
COPY . /home/ec2-user/gateway-microservice/Gateway_Aviato

WORKDIR /home/ec2-user/gateway-microservice/Gateway_Aviato

RUN npm install
RUN npm rebuild --unsafe-perm node-sass

EXPOSE 3000

CMD node /home/ec2-user/gateway-microservice/Gateway_Aviato
