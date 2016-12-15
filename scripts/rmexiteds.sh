#!/bin/bash
##  Description
##    Remove all exited container.
##  
##  Usage
##    @script.name[option]
##  
##  Options
##     -h, --help
##            Display help.
##  
##  Parameters (edjanger.properties):
##     docker_command
##            Display docker command.
##  
##     rm_options
##            Options of "docker rm" for a running container (see docker rm --help)
##  
##  Licence & authors
##     edjanger, The MIT License (MIT)
##     Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
###
### External options:
##     -h, --help
##            Display help.
###
### Internal options:
###
###        --scriptname=SCRIPT
###            Name of the main script.
###
###        --commandline=COMMAND
###            Name of the docker command to execute.
###
###        --confirm                  ask for a confirmation before execute
###
###        --confirmquestion=QUESTION question for the execution's confirmation
###
###        --commandcomment=COMMAND
###            Printed comment of the command to execute.
###
###        --commandoptions=OPTIONS
###            Options read in the edjanger.properties.
###
# ------------------------------------------------------------------------------
# TODO to be corrected (take care about eval in function evalOptionsParameters from _common.sh)
# source {edjangerpath}/_common.sh
# 
# read_app_properties
# 
# # check required configuration
# [ -z "${container_name}" ]          && echo "Container name must be filled, configure variable container_name in edjanger.${config_extension}" && exit -1
# 
# [ -n "${rm_options}" ]              && commandoptions="${commandoptions} ${rm_options}"
# [ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
#[[ -n "$@" ]]                          && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
#                                     && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
#                                     && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
# exitedcontainer=$(docker ps -aq --filter "status=exited")
# confirm_question="All following exited container \"{container_name}\" will be permanently erased, do you want to continue (y/n) ?"
# docker ps -a --filter "status=exited" --format "Container {{.Names}}/id:{{.ID}} from image:{{.Image}}"
# dockerbasiccontainer "--scriptname=\"$0\";--commandline=\"rm -f ${exitedcontainer}\";--commandcomment=\"Delete exited container...\";${commandoptions};--confirm;--confirmquestion=\"$confirm_question\";${externaloptions}"
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  printHeader $0
else
  echo "Following stopped containers will be deleted, is it ok for you (y/n) ?"
  docker ps -a --filter "status=exited" --format "Container {{.Names}}/id:{{.ID}} from image:{{.Image}}"
  read response
  if [ "y" = "$response" ]; then
    echo "Delete stopped containers..."
    docker rm $(docker ps -aq --filter "status=exited")
    if [ "true" = "${docker_command}" ]; then
      echo -e "> Executed docker command:"
      echo -e "> docker rm $(docker ps -aq --filter "status=exited")"
    fi
  elif [ "n" != "$response" ]; then
    echo "Response must be \"y\" or \"n\""
  fi
fi
