#!/bin/bash
set -x

docker login harbor-demo.$INGRESS_DOMAIN -u admin -p rCHoveAdZyqZDonI1nG9
TODO:  Remove plaintext password

set +e
echo Checking for harbor-creds
if ! kubectl get secret harbor-creds ; then 
  echo No harbor-creds found, creating
  set -e
  REGISTRY_PASSWORD=rCHoveAdZyqZDonI1nG9 kp secret create harbor-creds --registry harbor.$INGRESS_DOMAIN --registry-user admin
else
  echo Secret harbor-creds already exists, skiping creation
  set -e
fi