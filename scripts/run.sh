#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : run.sh
# ALIAS            : edjangerrun
# DESCRIPTION      : run command "docker run -id" daemon mode, with parameters readed from local edjanger.properties
#   PARAMETER      : image_name
#   PARAMETER      : exposed_ports
#   PARAMETER      : shared_volumes
#   PARAMETER      : environment_variables
#   PARAMETER      : linked_containers
#   PARAMETER      : exposed_ports
#   PARAMETER      : network_settings
#   PARAMETER      : runtime_constraints_on_resources
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# VERSION          : 1.0.1
# DATE             : 2016-08-01
# COMMENT          : add options for run : network_settings and network_settings
# --------------------------------
# USAGE            : edjangerrun
# ----------------------------------------------------
# source {edjangerpath}/_common.sh
# 
# if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
#   usage $0 run
# else
#   rename_edocker_properties
#   if [ ! -f edjanger.${config_extension} ]; then
#     echo -e "edjanger:ERROR No edjanger.${config_extension} available, use \"<edjangerinit>\" command to initialize one in this directory"
#   else
#     read_app_properties
#     idx=$(echo "$(docker ps -a | grep ${container_name} | wc -l)+1" | bc)
#     echo "Run container_name: ${container_name}_${idx}..."
#     docker run -dt --name ${container_name}_${idx} ${run_other_options} ${network_settings} ${network_settings} ${exposed_ports} ${volumes_from} ${shared_volumes} ${environment_variables} ${linked_containers} ${image_name} ${command_run}
#     if [ "true" = "${docker_command}" ]; then
#       echo -e "> Executed docker command:"
#       echo -e "> docker run -dt --name ${container_name}_${idx} ${run_other_options} ${network_settings} ${runtime_constraints_on_resources} ${exposed_ports} ${volumes_from} ${shared_volumes} ${environment_variables} ${linked_containers} ${image_name} ${command_run}"
#     fi
#   fi
# fi


#!/bin/bash
##  Stop a container. File edjanger.properties must be present in path.
##  By default stop last container if no index specified.
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
##     stop_options                   other stop options.
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
[ -n "${run_other_options}" ]       && commandoptions="${commandoptions} ${run_other_options}"
[ -n "${network_settings}" ]        && commandoptions="${commandoptions} ${network_settings}"
[ -n "${exposed_ports}" ]           && commandoptions="${commandoptions} ${exposed_ports}"
[ -n "${volumes_from}" ]            && commandoptions="${commandoptions} ${volumes_from}"
[ -n "${environment_variables}" ]   && commandoptions="${commandoptions} ${environment_variables}"
[ -n "${linked_containers}" ]       && commandoptions="${commandoptions} ${linked_containers}"
[ -n "${image_name}" ]              && commandoptions="${commandoptions} ${image_name}"
[ -n "${command_run}" ]             && commandoptions="${commandoptions} ${command_run}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
echo "commandoptions: ${commandoptions}"

dockerbasiccontainer "--scriptname=\"$0\";--command=\"run -dt --name {container_name}\";--commandcomment=\"Create new container: {container_name}...\";${commandoptions};$@"

