#!/bin/bash
echo $SHELL
printf "\n\n"
printf "%-50s : %10s\n" "Key"  "Value"
printf "=%.0s"  $(seq 1 100)
printf "\n"
printf "%-50s : %10s\n" "WORKSPACE" ${WORKSPACE}
already_in_prod_bundles=()
if [[ ${#already_in_prod_bundles[@]} -eq 0 ]]; then
  echo "\033[32mAll bundles are copied to prod successfully\033[0m\n"
else
  echo "\033[31mSome bundles already in prod. They are not replaced. Please contact with Techops Team\033[0m"
  echo "\033[31mThe bundles are: \n\033[0m"
  echo "  \033[31m$bundle_parent_folder/$PLATFORM/$bundle_group_label/$bundle_group_name/$bundle_name\033[0m"
fi