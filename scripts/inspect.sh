#!/bin/bash
##  Description 
##    Return low-level information on a container, image or task.
##     
##    Filtered by edjanger.properties$container_name and edjanger.properties$image_name.
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
##         --container
##            Apply inspect to container.
##  
##         --image
##            Apply inspect to image.
##  
##         --index=INDEX
##            Index of the container name (used only with option --container).
##  
##  Parameters (edjanger.properties):
##     container_name
##            Container name.
##  
##     docker_command
##            Display docker command.
##     inspect_options
##  
##            Options of "docker inspect" for a running container (see docker 
##            inspect --help).
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
source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${container_name}" ]          && echo "Container name must be filled, configure variable container_name in edjanger.${config_extension}" && exit -1

[[ -n "$@" ]]                       && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
if [[ "${externaloptions}" == *"help"* ]]; then
  printHeader $0
elif [[ "${externaloptions}" == *"container"* ]] || [[ "${externaloptions}" == *"--c"* ]]; then
  [ -n "${inspect_options}" ]         && commandoptions="${commandoptions} ${inspect_options}"
  [ -n "${container_name}" ]          && commandoptions="${commandoptions} {container_name}"
  [ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
  dockerbasiccontainer "--scriptname=\"$0\";--commandline=\"inspect\";--commandcomment=\"Inspect container: {container_name}...\";${commandoptions};${externaloptions}"
elif [[ "${externaloptions}" == *"image"* ]] || [[ "${externaloptions}" == *"--i"* ]]; then
  [ -n "${inspect_options}" ]         && commandoptions="${commandoptions} ${inspect_options}"
  [ -n "${container_name}" ]          && commandoptions="${commandoptions} {image_name}"
  [ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""  
  dockerbasicimage "--scriptname=\"$0\";--commandline=\"inspect\";--commandcomment=\"Inspect image: {image_name}...\";${commandoptions};${externaloptions}"
else
  echo -e "edjanger:ERROR: options --container or --image is required"
  printHeader $0
fi

