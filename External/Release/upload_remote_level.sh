#!/usr/bin/env bash

S3_DEV_REMOTE_LEVEL_PATH="delete-remote-level/versions/"
S3_PROD_REMOTE_LEVEL_PATH="delete-remote-level/versions/"

if [ aws s3 ls "s3://$S3_PROD_REMOTE_LEVEL_PATH/$BUILD_NUMBER.json" | grep -iow $BUILD_NUMBER.json ]
then 
  echo "Remote Level Json Already Exists. Nothing Uploaded"; 
  exit 0
fi

touch $BUILD_NUMBER.json
if [ $ENVIRONMENT == 'prod' ]
then
  aws s3 cp  $BUILD_NUMBER.json "s3://$S3_PROD_REMOTE_LEVEL_PATH/$BUILD_NUMBER.json"
  if [ aws s3 ls "s3://$S3_PROD_REMOTE_LEVEL_PATH/$BUILD_NUMBER.json" | grep -iow $BUILD_NUMBER.json ]
  then 
    echo "Remote Level Json Succesfully Uploaded"; 
  else 
    echo "Remote Level Json Upload Failed";
    exit 1
  fi
else
  aws s3 cp  $BUILD_NUMBER.json "s3://$S3_DEV_REMOTE_LEVEL_PATH/$BUILD_NUMBER.json"
  if [ aws s3 ls "s3://$S3_DEV_REMOTE_LEVEL_PATH/$BUILD_NUMBER.json" | grep -iow $BUILD_NUMBER.json ]
  then 
    echo "Remote Level Json Succesfully Uploaded"; 
  else 
    echo "Remote Level Json Upload Failed";
    exit 1
  fi
fi