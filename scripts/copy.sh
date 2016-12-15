#!/bin/bash
# ------------------------------------------------------------------------------
##  Description
##     Copy files/folders between a container and the local filesystem.
##     
##     Filtered by edjanger.properties$container_name.
##     File edjanger.properties must be present in path.
##     By default executed on last container if no index specified.
##  
##  Usage
##    @script.name[option]
##  
##  Options
##     -h, --help
##            Display help.
##  
##         --fromcontainer
##            Copy file(s) from container to host.
##  
##         --fromhost
##            Copy file(s) from host to container.
##  
##         --sourcepath=PATH
##            Path to file(s) or folder to copy.
##  
##         --destinationpath=PATH
##            Path where to copy file(s) or folder to copy.
##  
##  Parameters (edjanger.properties):
##     container_name
##            Container name.
##  
##     copy_options
##            Options to copy files/folders between a container and the local 
##            filesystem.
##  
##     docker_command
##            Options of "docker cp" for a running container (see docker cp --help).
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
###        --commandcomment=COMMAND
###            Printed comment of the command to execute.
###
###        --commandoptions=OPTIONS
###            Options read in the edjanger.properties.
###
# ------------------------------------------------------------------------------
checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${container_name}" ]                     && echo "Container name must be filled, configure variable container_name in edjanger.${config_extension}" && exit -1

[ -n "${copy_options}" ]                       && commandoptions="${commandoptions} ${copy_options}"
[ -n "${commandoptions}" ]                     && commandoptions="--commandoptions=\"${commandoptions}\""
[[ -n "$@" ]]                                && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                               && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                               && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
dockerbasiccontainer "--scriptname=\"$0\";--commandline=\"cp\";--commandcomment=\"Copy files from/to: {container_name}...\";${commandoptions};${externaloptions}"

