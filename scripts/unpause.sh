#!/bin/bash
##  Unpause a container. File edjanger.properties must be present in path.
##  By default unpause last container if no index specified.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation.
##
##         --index=INDEX              index of the container name.
##  
##  Parameters (edjanger.properties):
##     unpause_options                other unpause options.
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

commandoptions=$([ -n "${unpause_options}" ] && echo -e "--commandoptions=\"${unpause_options}\"")
dockerbasiccontainer "--scriptname=\"$0\";--command=\"unpause {container_name}\";--commandcomment=\"Unpause container: {container_name}...\";--commandoptions=\"${unpause_options}\";$@"
