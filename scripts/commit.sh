#!/bin/bash
##  Description: commit a container. File edjanger.properties must be present in path.
##  By default commit last container if no index specified.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --index=INDEX              index of the container name
##  
##         --commitname=COMMIT        commit tag like REPOSITORY[:TAG]
##  
##         --commitmessage=MESSAG     commit message
##  
##         --commitauthor=MESSAG      commit author
##  
##  Parameters (edjanger.properties):
##     container_name                 container name
##     commit_options                 \"docker commit\" options to a running container
##     docker_command                 show docker command when edjanger is used
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
###
### External options:
###    -h, --help                     print this documentation
###
###        --index=INDEX              index of the container name
###
### Internal options:
###
###        --scriptname=SCRIPT        name of the main script
###
###        --commandline=COMMAND      name of the docker command to execute
###
###        --commandcomment=COMMAND   printed comment of the command to execute
###
###        --commandoptions=OPTIONS   options read in the edjanger.properties
###
# ------------------------------------------------------------------------------
checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${container_name}" ]          && echo "Container name must be filled, configure variable container_name in edjanger.${config_extension}" && exit -1

[ -n "${commit_options}" ]          && commandoptions="${commandoptions} ${commit_options}"
[ -n "${container_name}" ]          && commandoptions="${commandoptions} {container_name}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
[ -n "$@" ]                         && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
dockerbasiccontainer "--scriptname=\"$0\";--commandline=\"commit\";--commandcomment=\"Commit container: {container_name}...\";${commandoptions};${externaloptions}"


