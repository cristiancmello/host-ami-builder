#!/bin/sh

./packer build \
    -var "aws_access_key=$AWS_ACCESS_KEY_ID" \
    -var "aws_secret_key=$AWS_SECRET_ACCESS_KEY" \
    -var "ebs_region=$EBS_REGION" \
    -var "ebs_accesskey=$EBS_ACCESSKEY" \
    -var "ebs_secretkey=$EBS_SECRETKEY" \
    -var "s3fs_region=$S3FS_REGION" \
    -var "s3fs_accesskey=$S3FS_ACCESSKEY" \
    -var "s3fs_secretkey=$S3FS_SECRETKEY" \
    -var "efs_region=$EFS_REGION" \
    -var "efs_accesskey=$EFS_ACCESSKEY" \
    -var "efs_secretkey=$EFS_SECRETKEY" \
    ami-wordpress-ops-1.0.0.json

./get-manifest-ami.sh