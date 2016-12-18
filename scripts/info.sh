#!/bin/bash
##  Description
##   Give informations of versions for docker, docker-machine, docker-compose.
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
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  printHeader $0
else
  metadata=docker-metadata.yaml
  update_metadata_header $metadata
  cat $metadata
  rm -f $metadata
fi

