#!/bin/bash
# ------------------------------------------------------------------------------
##  Description
##    Remove one or more images. Filtered by edjanger.properties$image_name.
##    File edjanger.properties must be present in path.
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
##     force_rmiF
##            Force image deletion.
##  
##     image_name
##            Image name.
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
###        --confirm                  ask for a confirmation before execute
###
###        --confirmquestion=QUESTION question for the execution's confirmation
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
source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${image_name}" ]              && echo "Image name must be filled, configure variable image_name in edjanger.${config_extension}" && exit -1

[ -n "${force_rmi}" ]               && commandoptions="${commandoptions} ${force_rmi}"
[ -n "${image_name}" ]              && commandoptions="${commandoptions} ${image_name}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
[[ -n "$@" ]]                       && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
confirm_question="Image \"{image_name}\" will be permanently erased, do you want to continue (y/n) ?"
dockerbasicimage "--scriptname=\"$0\";--commandline=\"rmi\";--commandcomment=\"Delete image: {image_name}...\";${commandoptions};--confirm;--confirmquestion=\"$confirm_question\";${externaloptions}"

