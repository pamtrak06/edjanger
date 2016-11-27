#!/bin/bash
##  Commit a container. File edjanger.properties must be present in path.
##  By default commit last container if no index specified.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation.
##  
##         --index=INDEX              index of the container name.
##  
##         --commitname=COMMIT        commit tag like REPOSITORY[:TAG].
##  
##         --commitmessage=MESSAG     commit message.
##  
##         --commitauthor=MESSAG      commit author.
##  
##  Parameters (edjanger.properties):
##     commit_options                 other commit options.
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

[ -n "${commit_options}" ]          && commandoptions="${commandoptions} ${commit_options}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
dockerbasiccontainer "--scriptname=\"$0\";--command=\"commit {container_name}\";--commandcomment=\"Commit container: {container_name}...\";${commandoptions};$@"


