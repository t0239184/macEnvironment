#!/bin/bash
program_exists() {
  # fail on non-zero return value
  local ret='0'
  command -v "$1" >/dev/null 2>&1 || { local ret='1'; }
  echo "$ret"
}
arr=("bre" "pytho" "nod" "jav")

for ((i = 0; i < ${#arr[@]}; i++)); do
  command_name=${arr[$i]}
  command_is_exist=$(program_exists "$command_name")

  if [ "$command_is_exist" == '1' ]; then
    echo "install_$command_name.sh"
  fi
done
