#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : portdesc.sh
# ALIAS            : edockerportdesc
# DESCRIPTION      : description of port
#   ARGUMENT       : port number
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerportdesc [port number]
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [ -n "$1" ]; then
  if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
    usage $0  run
  else
    echo -e "\n--- Port description for $1"
    title="Service Name,Port Number,Transport Protocol,Description,Assignee,Contact,Registration Date,Modification Date,Reference,Service Code,Known Unauthorized Uses,Assignment Notes"
    ports=$(cat {edockerpath}/service-names-port-numbers.csv | grep ",$1,")
    if [ -n "$ports" ]; then
      echo -e $title
      REFIFS=$IFS
      IFS=$'\n'
      for p in $ports; do
        echo "  $p"
      done
      IFS=$REFIFS
    else
      echo -e "  none"
    fi
  fi
else
  echo -e "Please set a port number for argument"
fi
