#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------

function dockerbasicimage()
{
  command="$1"
  comment="$2"
 
  if [ ! -f edocker.cfg ]; then
    echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    source edocker.cfg
    echo "${comment} $(echo ${image_name} | cut -d ':' -f1)..."
    docker ${command} | grep $(echo ${image_name} | cut -d ':' -f1)
  fi

}

function dockerbasiccontainer()
{
  command="$1"
  comment="$2"
  initidx="$3"

  if [ ! -f edocker.cfg ]; then
    echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    source edocker.cfg
    echo "${comment} ${ct}..."
    if [ "${initidx}" != "-1" ]; then
      idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+${initidx}" | bc)
      ct=${container_name}_${idx}
      docker ${command} ${ct}
    else
      ct=${container_name}
      docker ${command} | grep ${ct}
    fi
  fi
}

