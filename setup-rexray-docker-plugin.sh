#!/bin/sh

sudo systemctl start rexray
sleep 3

docker plugin install rexray/ebs \
    REXRAY_PREEMPT=true \
    EBS_REGION=$EBS_REGION \
    EBS_ACCESSKEY=$EBS_ACCESSKEY \
    EBS_SECRETKEY=$EBS_SECRETKEY \
    --grant-all-permissions

docker plugin install rexray/s3fs \
    S3FS_ACCESSKEY=$S3FS_ACCESSKEY \
    S3FS_SECRETKEY=$S3FS_SECRETKEY \
    --grant-all-permissions

docker plugin install rexray/efs \
    EFS_ACCESSKEY=$EFS_ACCESSKEY \
    EFS_SECRETKEY=$EFS_SECRETKEY \
    EFS_TAG=rexray \
    --grant-all-permissions
