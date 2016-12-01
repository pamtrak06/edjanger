#!/bin/bash
##  Print stats of a container. File edjanger.properties must be present in path.
##  By default give stats for last container if no index specified.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --index=INDEX              index of the container name
##  
##  Parameters (edjanger.properties):
##     container_name                 container name
##     docker_command                 show docker command when edjanger is used
##     stats_options                  \"docker stats\" options to a running container
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
source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${container_name}" ]          && echo "Container name must be filled, configure variable container_name in edjanger.${config_extension}" && exit -1

[ -n "${stats_options}" ]           && commandoptions="${commandoptions} ${stats_options}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
[ -n "$@" ]                         && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
dockerbasiccontainer "--scriptname=\"$0\";--commandline=\"stats {container_name}\";--commandcomment=\"Stats of container: {container_name}...\";${commandoptions};${externaloptions}"

