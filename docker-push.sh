#!/bin/bash 

source docker-version.ini.sh 

echo "Going to push $VERSION" 

docker push $VERSION
