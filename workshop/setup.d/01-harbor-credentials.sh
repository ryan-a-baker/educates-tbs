#!/bin/bash
set -x

docker login harbor.$INGRESS_DOMAIN -u tbs-workshop -p Harbor12345
# TODO:  Remove plaintext password

set +e
echo Checking for harbor-creds
if ! kubectl get secret harbor-creds ; then 
  echo No harbor-creds found, creating
  set -e
  REGISTRY_PASSWORD=Harbor12345 kp secret create harbor-creds --registry harbor.$INGRESS_DOMAIN --registry-user tbs-workshop
else
  echo Secret harbor-creds already exists, skiping creation
  set -e
fi
