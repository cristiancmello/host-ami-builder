#!/bin/sh

./packer build \
    -var "aws_access_key=$AWS_ACCESS_KEY_ID" \
    -var "aws_secret_key=$AWS_SECRET_ACCESS_KEY" \
    -var "aws_region=$AWS_REGION" \
    ami-swarm-node-1.4.0.json

./get-manifest-ami.sh