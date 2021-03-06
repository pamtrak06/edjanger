#!/bin/bash
# ------------------------------------------------------------------------------
##  Description
##     List images.
##     
##     Filtered by edjanger.properties$image_name
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
##  Parameters (edjanger.properties):
##     docker_command
##            Display docker command.
##  
##     image_name
##            Image name.
##  
##     images_options
##            Options of "docker images" for a running container (see docker images 
##            --help).
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
[ -z "${image_name}" ]              && echo "Image name must be filled, configure variable image_name in edjanger.${config_extension}" && exit -1

[ -n "${images_options}" ]          && commandoptions="${commandoptions} ${images_options}"
[ -n "${image_name}" ]              && commandoptions="${commandoptions} ${image_name}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
[[ -n "$@" ]]                       && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
dockerbasicimage "--scriptname=\"$0\";--commandline=\"images\";--commandcomment=\"List image which name contains: {image_name}...\";${commandoptions};${externaloptions}"

