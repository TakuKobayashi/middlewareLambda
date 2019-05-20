#!/bin/sh

docker build -t jumanpp_image ./
docker create -ti --name jumanpp jumanpp_image bash
docker cp jumanpp:/usr/local/bin/jumanpp ./
docker rm jumanpp