#!/bin/bash
##  Description:
##     Run interactively a command in a new container.
##     
##     Filtered by edjanger.properties$image_name and $container_name.
##     File edjanger.properties must be present in path.
##     By default executed on last container if no index specified.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                       print this documentation
##  
##         --index=INDEX                index of the container name
##  
##  Parameters (edjanger.properties):
##     command_run                      bash command(s) to run
##     environment_variables            environnment variables
##     exposed_ports                    exposed port
##     image_name                       image name
##     linked_containers                linked container
##     network_settings                 all network settings options
##     run_other_options                all other available options for docker run
##     runtime_constraints_on_resources runtime constraints on resources
##     volumes_from                     expose volumes from another container into current container
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
[ -z "${image_name}" ]                         && echo "Image name must be filled, configure variable image_name in edjanger.${config_extension}" && exit -1
[ -z "${container_name}" ]                     && echo "Container name must be filled, configure variable container_name in edjanger.${config_extension}" && exit -1

[ -n "${run_other_options}" ]                  && commandoptions="${commandoptions} ${run_other_options}"
[ -n "${network_settings}" ]                   && commandoptions="${commandoptions} ${network_settings}"
[ -n "${runtime_constraints_on_resources}" ]   && commandoptions="${commandoptions} ${runtime_constraints_on_resources}"
[ -n "${exposed_ports}" ]                      && commandoptions="${commandoptions} ${exposed_ports}"
[ -n "${volumes_from}" ]                       && commandoptions="${commandoptions} ${volumes_from}"
[ -n "${shared_volumes}" ]                     && commandoptions="${commandoptions} ${shared_volumes}"
[ -n "${environment_variables}" ]              && commandoptions="${commandoptions} ${environment_variables}"
[ -n "${linked_containers}" ]                  && commandoptions="${commandoptions} ${linked_containers}"
[ -n "${image_name}" ]                         && commandoptions="${commandoptions} ${image_name}"
[ -z "${command_run}" ]                        && command_run="/bin/bash"
[ -n "${command_run}" ]                        && commandoptions="${commandoptions} ${command_run}"
[ -n "${commandoptions}" ]                     && commandoptions="--commandoptions=\"${commandoptions}\""
[[ -n "$@" ]]                                  && externaloptions=$(echo $@ | sed "s|[[:space:]]--|;--|g") \
                                               && externaloptions=$(echo $@ | sed "s|[[:space:]]-|;-|g")
dockerbasiccontainer "--scriptname=\"$0\";--commandline=\"run -it --name {container_name}\";--commandcomment=\"Create new container and enter interactive: {container_name}...\";${commandoptions};${externaloptions}"



