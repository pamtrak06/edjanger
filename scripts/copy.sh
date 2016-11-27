#!/bin/bash
# ------------------------------------------------------------------------------
##  Run command "docker cp" with above options to copy file or folder from 
##  container or host to host or container.
##  Copy options are read from edjanger.properties.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation.
##  
##         --fromcontainer            copy file(s) from container to host.
##  
##         --fromhost                 copy file(s) from host to container.
##  
##         --sourcepath=PATH          path to file(s) or folder to copy.
##  
##         --destinationpath=PATH     path where to copy file(s) or folder to copy.
##  
##  Parameters (edjanger.properties):
##     container_name                 container name
##     copy_options                   options to copy files/folders between a container and the local filesystem
##     docker_command                 show docker command when edjanger is used
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
###
### External options:
###    -h, --help                     print this documentation.
###
###        --index=INDEX              index of the container name.
###
### Internal options:
###
###        --script=SCRIPT            name of the main script
###
###        --command=COMMAND          name of the docker command to execute
###
###        --commandcomment=COMMAND  printed comment of the command to execute
###
###        --commandoptions=OPTIONS  options read in the edjanger.properties
###
# ------------------------------------------------------------------------------

source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${container_name}" ]                     && echo "Container name must be filled, configure variable container_name in edjanger.${config_extension}" && exit -1

[ -n "${copy_options}" ]                       && commandoptions="${commandoptions} ${copy_options}"
[ -n "${commandoptions}" ]                     && commandoptions="--commandoptions=\"${commandoptions}\""
dockerbasiccontainer "--scriptname=\"$0\";--command=\"cp\";--commandcomment=\"Copy files from/to: {container_name}...\";${commandoptions};$@"

