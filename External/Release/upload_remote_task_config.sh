#!/usr/bin/env bash

S3_DEV_REMOTE_TASK_CONFIG_PATH="delete-remote-task-config"
S3_PROD_REMOTE_TASK_CONFIG_PATH="delete-remote-task-config"

if [ aws s3 ls "s3://$S3_DEV_REMOTE_TASK_CONFIG_PATH/$BUILD_NUMBER.json" | grep -iow $BUILD_NUMBER.json ]
then 
  echo "Remote Task Config Json Already Exists. Nothing Uploaded";
  exit 0
fi

touch $BUILD_NUMBER.json
if [ $ENVIRONMENT == 'prod' ]
then
  aws s3 cp  $BUILD_NUMBER.json "s3://$S3_DEV_REMOTE_TASK_CONFIG_PATH/$BUILD_NUMBER.json"
  if [ aws s3 ls "s3://$S3_DEV_REMOTE_TASK_CONFIG_PATH/$BUILD_NUMBER.json" | grep -iow $BUILD_NUMBER.json ]
  then 
    echo "Remote Task Config Json Succesfully Uploaded"; 
  else 
    echo "Remote Task Config Json Upload Failed";
    exit 1
  fi
else
  aws s3 cp  $BUILD_NUMBER.json "s3://$S3_PROD_REMOTE_TASK_CONFIG_PATH/$BUILD_NUMBER.json"
  if [ aws s3 ls "s3://$S3_PROD_REMOTE_TASK_CONFIG_PATH/$BUILD_NUMBER.json" | grep -iow $BUILD_NUMBER.json ]
  then 
    echo "Remote Task Config Json Succesfully Uploaded"; 
  else 
    echo "Remote Task Config Json Upload Failed";
    exit 1
  fi
fi