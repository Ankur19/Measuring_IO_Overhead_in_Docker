#!/bin/bash

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo usermod -a -G docker $USER

docker volume create streamVolume

docker run \
  -d -it \
  --name streamTest \
  --mount source=streamVolume,target=/app \
  ubuntu:latest

docker run \
  -d -it \
  --name streamTestBindMount \
  --mount type=bind,source=/home/asaikia/Documents,target=/app \
  ubuntu:latest

docker ps -a
