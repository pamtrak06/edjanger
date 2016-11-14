# update script:
# - zip edocker folder with date
# - update edocker : git pull origin master

#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : update.sh
# ALIAS            : edockerupdate
# DESCRIPTION      : archive edocker with date and update it from git
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerupdate
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [ -n "$1" ]; then
  dockerbasiccontainer "help" "upgrade"
else
  status=0;
  is_exec_present "git"
  if [ $? = -1 ]; then
    status=-1;
  fi
  is_exec_present "zip"
  if [ $? = -1 ]; then
    status=-1;
  fi

  if [ $status = 0 ]; then
    CURDIR=$PWD
    date_time=$(date +"%Y%m%d_%H%M%S")
    echo -e "edocker:INFO: UPGRADE: archiving current version..."
    cd {edockerpath}/..
    zip -r edocker-${date_time}.zip ./scripts
    echo -e "edocker:INFO: UPGRADE: upgrading edocker..."
    ./edockerinstall.sh dev
    git pull origin master 2>&1 {edockerpath}/edocker.log
    if [ $? != 0 ]; then
      echo -e "edocker:ERROR UPGRADE: upgrade could not be perform due to git error, see {edockerpath}/edocker.log"
      echo -e "edocker:INFO UPGRADE: restoring previous version..."
      ./edockerinstall.sh
      unzip edocker-${date_time}.zip -d {edockerpath}
    else
      echo -e "edocker:INFO: UPGRADE: activating edocker..."
      ./edockerinstall.sh
      . edocker.alias
      rm -f {edockerpath}/edocker.log
      cd $CURDIR
    fi
  fi

fi
