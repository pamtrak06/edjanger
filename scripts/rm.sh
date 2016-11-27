#!/bin/bash
##  Delete a container. File edjanger.properties must be present in path.
##  By default delete last container if no index specified.
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
##     rm_options                     other rm options.
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

commandoptions=$([ -n "${rm_options}" ] && echo -e "--commandoptions=\"${rm_options}\"")
confirm_question="Container \"{container_name}\" will be permanently erased, do you want to continue (y/n) ?"
dockerbasiccontainer "--scriptname=\"$0\";--command=\"rm -f {container_name}\";--commandcomment=\"Delete container: {container_name}...\";--commandoptions=\"${rm_options}\";--confirm;--confirmquestion=\"$confirm_question\";$@"


# if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
#   dockerbasiccontainer --help --command="rm"
# else
#   index=$1
#   echo "script path: $0"
#   confirm_question="confirm_question=\"Container \"${container_name}_${idx}\" will be permanently erased, do you want to continue (y/n) ?\""
#   dockerbasiccontainer --script="$0" --command="rm" --command-options="${start_options}" --command-comment="Delete container: " --confirm --confirm-question="$confirm_question" $index
# fi

# if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
#   usage $0 rm
# else
#   rename_edocker_properties
#   if [ ! -f edjanger.${config_extension} ]; then
#     echo -e "edjanger:ERROR No edjanger.${config_extension} available, use \"<edjangerinit>\" command to initialize one in this directory"
#   else
#     read_app_properties
#     if [[ "$1" == *"index"* ]]; then
#       idx=$(echo "$(echo $1 | cut -d '=' -f2)" | bc)
#     else
#       idx=$(echo "$(docker ps -a|grep ${container_name}|wc -l)+0"|bc)
#     fi
#     if [ "0" = "${idx}" ]; then
#       echo "No running or stopped container which name contains: \"${container_name}\" available"
#     else
#       echo "Container \"${container_name}_${idx}\" will be permanently erased, do you want to continue (y/n) ?"
#       read response
#       if [ "y" = "$response" ]; then
#         if [ -n "$(docker ps -a|grep ${container_name}_${idx})" ]; then
#           echo "Deleting container: \"${container_name}_${idx}\"..."
#           docker rm $(docker stop ${container_name}_${idx})
#           if [ "true" = "${docker_command}" ]; then
#             echo -e "Executed docker command:"
#             echo -e "docker rm \$(docker stop ${container_name}_${idx})"
#           fi
#         else
#           echo "Container \"${container_name}_${idx}\" does not exist"
#         fi
#       elif [ "n" != "$response" ]; then
#         echo "Response must be \"y\" or \"n\""
#       fi
#     fi
#   fi
# fi
