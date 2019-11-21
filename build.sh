#!/bin/bash

TAG=$1
REPO="https://github.com/docker/compose.git"

if [ "$TAG" = "latest" ]; then
CLONETAG="master"
else
CLONETAG=$TAG
fi

docker build --build-arg VERSION=$CLONETAG -t docker-compose-builder:buster buster/
docker run --name dc-build docker-compose-builder:buster
docker cp dc-build:/compose/dist/docker-compose dist/docker-compose-$TAG-buster
docker rm dc-build

docker build --build-arg VERSION=$CLONETAG -t docker-compose-builder:stretch stretch/
docker run --name dc-build docker-compose-builder:stretch
docker cp dc-build:/compose/dist/docker-compose dist/docker-compose-$TAG-stretch
docker rm dc-build

docker build --build-arg VERSION=$CLONETAG -t docker-compose-builder:alpine alpine/
docker run --name dc-build docker-compose-builder:alpine
docker cp dc-build:/compose/dist/docker-compose dist/docker-compose-$TAG-alpine
docker rm dc-build
