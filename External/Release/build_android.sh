#!/bin/bash
ps -p $$ -ocomm=
set -v; set +x;
printf "\n\n"
printf "%-50s : %10s\n" "Key"  "Value"
printf "=%.0s"  $(seq 1 100)
printf "\n"
printf "%-50s : %10s\n" "WORKSPACE" ${WORKSPACE}

if [[ $BUILD_BUNDLE == "false" ]]; then
    # Remove all bundles
    echo "BUILD_BUNDLE: $BUILD_BUNDLE"
fi
