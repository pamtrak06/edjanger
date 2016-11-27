#!/bin/bash
# ------------------------------------------------------------------------------
##  Run command "docker rmi" with parameters read from edjanger.properties
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##  Parameters (edjanger.properties):
##     docker_command                 show docker command when edjanger is used
##     force_rmi                      force image deletion
##     image_name                     image name
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
###
### External options:
###    -h, --help                     print this documentation
###  
### Internal options:
###  
###        --script=SCRIPT            name of the main script
###  
###        --confirm                  ask for a confirmation before execute
###
###        --confirmquestion=QUESTION question for the execution's confirmation
###  
###        --command=COMMAND          name of the docker command to execute
###  
###        --commandcomment=COMMAND   printed comment of the command to execute
###  
###        --commandoptions=OPTIONS   options read in the edjanger.properties
###  
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${image_name}" ]                         && echo "Image name must be filled, configure variable image_name in edjanger.${config_extension}" && exit -1

[ -n "${force_rmi}" ]                          && commandoptions="${commandoptions} ${force_rmi}"
[ -n "${image_name}" ]                         && commandoptions="${commandoptions} ${image_name}"
[ -n "${commandoptions}" ]                     && commandoptions="--commandoptions=\"${commandoptions}\""
[ -n "$@" ]                                    && externaloptions=$(echo $@ | sed "s|[[:space:]]--|;--|g") \
                                               && externaloptions=$(echo $@ | sed "s|[[:space:]]-|;-|g")
confirm_question="Image \"{image_name}\" will be permanently erased, do you want to continue (y/n) ?"
dockerbasicimage "--scriptname=\"$0\";--command=\"rmi\";--commandcomment=\"Delete image: {image_name}...\";${commandoptions};--confirm;--confirmquestion=\"$confirm_question\";${externaloptions}"

