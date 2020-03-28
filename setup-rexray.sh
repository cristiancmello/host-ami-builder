#!/bin/sh

sudo curl -sSL https://rexray.io/install | sh -s -- stable

sudo sh -c "cat << EOF >> /etc/rexray/config.yml
libstorage:
  service: ebs
  server:
    services:
      ebs:
        driver: ebs
      s3fs:
        driver: s3fs
      efs:
        driver: efs
ebs:
  accessKey: $EBS_ACCESSKEY
  secretKey: $EBS_SECRETKEY
  region: $EBS_REGION

s3fs:
  region:           $S3FS_REGION
  accessKey:        $S3FS_ACCESSKEY
  secretKey:        $S3FS_SECRETKEY
  disablePathStyle: false

efs:
  accessKey:           $EFS_ACCESSKEY
  secretKey:           $EFS_SECRETKEY
  region:              $EFS_REGION
  tag:                 rexray
  disableSessionCache: false
  statusMaxAttempts:   6
  statusInitialDelay:  1s
  statusTimeout:       2m
EOF"

# Verify env vars...
sudo cat /etc/rexray/config.yml

sudo systemctl start rexray