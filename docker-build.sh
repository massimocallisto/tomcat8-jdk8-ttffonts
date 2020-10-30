#!/bin/bash 

source docker-version.ini.sh 

echo "Going to build $VERSION" 

docker build -t $VERSION .
