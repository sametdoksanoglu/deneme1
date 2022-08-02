#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Local Config
#WORKSPACE=/Users/hakansaglam/Developer/Dream/Interns/internship/intern-2022-blast
#BUILD_NUMBER=1
#ENVIRONMENT=dev

# Jenkins Config
WORKSPACE=${WORKSPACE}/intern-2022-blast
BUILD_NUMBER=${BUILD_NUMBER}
GIT_PREVIOUS_SUCCESSFUL_COMMIT=${GIT_PREVIOUS_SUCCESSFUL_COMMIT}
echo ${WORKSPACE}
echo ${GIT_PREVIOUS_SUCCESSFUL_COMMIT}
echo {BUILD_NUMBER}