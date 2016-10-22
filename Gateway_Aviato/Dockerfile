FROM node:argon

# Copy the necessary files
RUN mkdir -p /usr/src/app
COPY . /usr/src/app

WORKDIR /usr/src/app/hackathon-starter

RUN npm install
RUN npm rebuild --unsafe-perm node-sass

EXPOSE 3000

node /usr/src/app/hackathon-starter/app.js
CMD node /usr/src/app/hackathon-starter/app.js
