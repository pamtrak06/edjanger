# update script:
# - zip edjanger folder with date
# - update edjanger : git pull origin master

#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : update.sh
# ALIAS            : edjangerupdate
# DESCRIPTION      : archive edjanger with date and update it from git
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerupdate
# ----------------------------------------------------
source {edjangerpath}/_common.sh

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
    echo -e "edjanger:INFO: UPGRADE: archiving current version..."
    cd {edjangerpath}/..
    zip -r edjanger-${date_time}.zip ./scripts 2>&1 {edjangerpath}/../edjanger.log
    echo -e "edjanger:INFO: UPGRADE: upgrading edjanger..."
    ./edjangerinstall.sh --contribution >> {edjangerpath}/../edjanger.log 2>&1
    git pull origin master >> {edjangerpath}/../edjanger.log 2>&1
    if [ $? != 0 ]; then
      echo -e "edjanger:ERROR UPGRADE: upgrade could not be perform due to git error, see {edjangerpath}/edjanger.log"
      echo -e "edjanger:INFO UPGRADE: restoring previous version..."
      ./edjangerinstall.sh --alias >> {edjangerpath}/../edjanger.log 2>&1
      unzip edjanger-${date_time}.zip -d {edjangerpath} >> {edjangerpath}/../edjanger.log 2>&1
    else
      echo -e "edjanger:INFO: UPGRADE: activating edjanger..."
      ./edjangerinstall.sh  --alias >> {edjangerpath}/../edjanger.log 2>&1
      . edjanger.unalias >> {edjangerpath}/../edjanger.log 2>&1
      . edjanger.alias >> {edjangerpath}/../edjanger.log 2>&1
      rm -f {edjangerpath}/edjanger.log >> {edjangerpath}/../edjanger.log 2>&1
    fi
    cd $CURDIR
  fi

fi
