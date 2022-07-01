
#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

printf "\n\n"
printf "%-50s : %10s\n" "Key"  "Value"
printf "=%.0s"  $(seq 1 100)
printf "\n"
printf "%-50s : %10s\n" "WORKSPACE" ${WORKSPACE}
printf "%-50s : %10s\n" "ENVIRONMENT" ${ENVIRONMENT}
printf "%-50s : %10s\n" "BUNDLE_NAME" ${BUNDLE_NAME}
printf "%-50s : %10s\n" "BUNDLE_QUALITY" ${BUNDLE_QUALITY}
printf "%-50s : %10s\n" "PLATFORM" ${PLATFORM}
printf "\n\n"