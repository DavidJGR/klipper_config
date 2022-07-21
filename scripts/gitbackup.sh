#!/usr/bin/env bash

#####################################################################
### Please set the paths accordingly. In case you don't have all  ###
### the listed folders, just keep that line commented out.        ###
#####################################################################
### Path to your config folder you want to back up
config_folder=~/klipper_config

#####################################################################
#####################################################################


#####################################################################
################ !!! DO NOT EDIT BELOW THIS LINE !!! ################
#####################################################################
grab_version() {
  local klipper_commit moonraker_commit
  local mainsail_ver fluidd_ver

  if [[ -n ${klipper_folder} ]]; then
    cd "${klipper_folder}"
    klipper_commit=$(git rev-parse --short=7 HEAD)
    m1="Klipper on commit: ${klipper_commit}"
  fi
 }

push_config() {
  local current_date
  
  cd "${config_folder}" || exit 1
  git pull
  git add .
  current_date=$(date +"%Y-%m-%d %T")
  git commit -m "Autocommit from ${current_date}" -m "${m1}" -m "${m2}" -m "${m3}" -m "${m4}"
  git push
}

grab_version
push_config
