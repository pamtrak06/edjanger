#!/bin/bash
# ------------------------------------------------------------------------------
##  Description: remove all orphaned volumes
##  
##  Usage:
##     @script.name
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  printHeader $0
else
  echo "Following orphaned volumes will be deleted, is it ok for you (y/n) ?"
  docker volume ls -qf dangling=true
  read response
  if [ "y" = "$response" ]; then
    echo "Delete orphaned volumes..."
    docker volume rm $(docker volume ls -qf dangling=true)
    if [ "true" = "${docker_command}" ]; then
      echo -e "> Executed docker command:"
      echo -e "> docker volume rm $(docker volume ls -qf dangling=true)"
    fi
  elif [ "n" != "$response" ]; then
    echo "Response must be \"y\" or \"n\""
  fi
fi
