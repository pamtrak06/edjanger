#!/bin/bash
##  Description
##    Remove one or more containers.
##     
##    Filtered by edjanger.properties$container_name.
##    File edjanger.properties must be present in path.
##    By default executed on last container if no index specified.
##  
##  Usage
##    @script.name[option]
##  
##  Options
##     -h, --help
##            Display help.
##  
##         --index=INDEX
##            Index of the container name.
##  
##         --all
##            Delete all containers for the container_name pattern.
##  
##  Parameters (edjanger.properties):
##     container_name
##            Container name.
##  
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
###        --index=INDEX
###            Index of the container name.
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
source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${container_name}" ]          && echo "Container name must be filled, configure variable container_name in edjanger.${config_extension}" && exit -1

[ -n "${rm_options}" ]              && commandoptions="${commandoptions} ${rm_options}"
[ -n "${container_name}" ]          && commandoptions="${commandoptions} {container_name}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
[[ -n "$@" ]]                       && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
confirm_question="Container \"{container_name}\" will be permanently erased, do you want to continue (y/n) ?"
dockerbasiccontainer "--scriptname=\"$0\";--commandline=\"rm -f\";--commandcomment=\"Following containers are deleted:\";${commandoptions};--confirm;--confirmquestion=\"$confirm_question\";${externaloptions}"

