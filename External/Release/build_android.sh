#!/bin/bash
printf "\n\n"
printf "%-50s : %10s\n" "Key"  "Value"
printf "=%.0s"  $(seq 1 100)
printf "\n"
printf "%-50s : %10s\n" "WORKSPACE" ${WORKSPACE}