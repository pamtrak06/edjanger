#!/bin/bash
# ------------------------------------------------------------------------------
##  Description : 
##    Update script:
##      - archive edjanger folder with date in a zip file with date timestamp
##      - update edjanger : git pull origin master
##  
##  Usage
##    @script.name[option]
##  
##  Options
##     -h, --help
##            Display help.
##  
##  Licence & authors
##     edjanger, The MIT License (MIT)
##     Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------

checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

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
      source edjanger.unalias >> {edjangerpath}/../edjanger.log 2>&1
      source edjanger.alias >> {edjangerpath}/../edjanger.log 2>&1
      rm -f {edjangerpath}/edjanger.log >> {edjangerpath}/../edjanger.log 2>&1
    fi
    cd $CURDIR
  fi

fi
