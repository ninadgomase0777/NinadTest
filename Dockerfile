#FROM ubuntu:20.04
FROM 668853609085.dkr.ecr.us-east-1.amazonaws.com/test:latest
RUN apt-get update -y 
RUN apt-get install g++ -y 
RUN apt install curl -y 
RUN curl --silent --location https://deb.nodesource.com/setup_14.x — Node.js 14 LTS "Fermium" |  bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential
#RUN mkdir -p usr/src/app
# check the path 
#FROM node:14
WORKDIR /nodejsapp

COPY package*.json ./
RUN npm install
RUN npm link express
COPY . .
EXPOSE  8080
CMD ["node", "server.js"]
