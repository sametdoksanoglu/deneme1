#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
set -e

# Local Config
# WORKSPACE=/Users/hakansaglam/Developer/Dream/Royal/royal-match-android/royal-match
# BUILD_NUMBER=5501
# ENVIRONMENT='prod'
# BRANCH='master'
# STORE='samsung'

# Jenkins Config
WORKSPACE=${WORKSPACE}
BUILD_NUMBER=${PARENT_BUILD_NUMBER}
GIT_PREVIOUS_SUCCESSFUL_COMMIT=${GIT_PREVIOUS_SUCCESSFUL_COMMIT}
ENVIRONMENT=${ENVIRONMENT}
BRANCH=${BRANCH}
STORE=${STORE}
REMOVE_FROM_STREAMING_ASSETS=ios

# Uploads to Google Drive Huawei & Samsung Binary Folder
function upload_release() 
{
  mkdir -p "$HOME/royal-match-other-stores/Huawei & Samsung Binary/$BUILD_NUMBER"
  cp $WORKSPACE/Build/royal-match-$BUILD_NUMBER.apk "$HOME/royal-match-other-stores/Huawei & Samsung Binary/$BUILD_NUMBER/royal-match-$BUILD_NUMBER-samsung.apk"
}