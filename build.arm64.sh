#!/bin/bash

IMAGE_NAME=limtech/mdbtools
PLATFORM=linux/arm64

echo "docker build"
docker build \
	--file Dockerfile \
	--platform $PLATFORM \
	-t $IMAGE_NAME .

docker build \
	--file Dockerfile-mariadb \
	--platform $PLATFORM \
	-t $IMAGE_NAME:mariadb .

docker buildx build \
	--file Dockerfile-sqlite \
	--platform $PLATFORM \
	-t $IMAGE_NAME:sqlite .
