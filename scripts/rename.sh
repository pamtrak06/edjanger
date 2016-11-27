#!/bin/bash
##  Rename a container. File edjanger.properties must be present in path.
##  By default rename last container if no index specified.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation.
##
##         --index=INDEX              index of the container name.
##  
##         --name=NAME                new name of the container.
##  
##  Parameters (edjanger.properties):
##     rename_options                  other rename options.
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

commandoptions=$([ -n "${rename_options}" ] && echo -e "--commandoptions=\"${rename_options}\"")
confirm_question="Container \"{container_name}\" will be renamed, do you want to continue (y/n) ?"
dockerbasiccontainer "--scriptname=\"$0\";--command=\"rename {container_name}\";--commandcomment=\"Renaming container: {container_name}...\";--commandoptions=\"${rename_options}\";--confirm;--confirmquestion=\"$confirm_question\";$@"

# #!/bin/bash
# # ----------------------------------------------------
# # The MIT License (MIT)
# #
# # Copyright (c) 2016 copyright pamtrak06@gmail.com
# # ----------------------------------------------------
# # SCRIPT           : rename.sh
# # ALIAS            : edjangerrename
# # DESCRIPTION      : run command "docker rename" with parameters readed from local edjanger.properties
# #  ARGUMENT        : new name of container
# #  PARAMETER       : container_name
# #  PARAMETER       : docker_command
# # CREATOR          : pamtrak06@gmail.com
# # --------------------------------
# # VERSION          : 1.0
# # DATE             : 2016-03-02
# # COMMENT          : creation
# # --------------------------------
# # USAGE            : edjangerrename
# # ----------------------------------------------------
# source {edjangerpath}/_common.sh
# 
# name=$1
# 
# if [ -z "$1" ]; then
#   "Please write new name of container for first argument"
# else
#   if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
#     usage $0 rename
#   else
#     rename_edocker_properties    
#     if [ ! -f edjanger.${config_extension} ]; then
#       echo -e "edjanger:ERROR No edjanger.${config_extension} available, use \"<edjangerinit>\" command to initialize one in this directory"
#     else
#       read_app_properties
#       idx=$(echo "$(docker ps -a|grep ${container_name}|wc -l)+0"|bc)
#       if [ "0" = "${idx}" ]; then
#         echo "No running or stopped container which name contains: \"${container_name}\" available"
#       else
#         echo "Container \"${container_name}_${idx}\" will be renamed, do you want to continue (y/n) ?"
#         read response
#         if [ "y" = "$response" ]; then
#           if [ -n "$(docker ps -a|grep ${container_name}_${idx})" ]; then
#             echo "Renaming container: \"${container_name}_${idx}\"..."
#             docker rename ${container_name}_${idx} $name
#             if [ "true" = "${docker_command}" ]; then
#               echo -e "Executed docker command:"
#               echo -e "docker rename ${container_name}_${idx} $name"
#             fi
#           else
#             echo "Container \"${container_name}_${idx}\" does not exist"
#           fi
#         elif [ "n" != "$response" ]; then
#           echo "Response must be \"y\" or \"n\""
#         fi
#       fi
#     fi
#   fi
# fi
