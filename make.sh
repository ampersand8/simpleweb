#!/bin/bash
set -e
DOCKERFILES=dockerfiles/*
REPOSITORY=ampersand8/simpleweb
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build
for f in ${DOCKERFILES}; do
    base=$(basename ${f})
    sudo docker build -t ${REPOSITORY}:${base} -f ${f} .
    sudo docker push ${REPOSITORY}:${base}
done
