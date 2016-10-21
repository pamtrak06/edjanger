#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : copy.sh
# DESCRIPTION      : install edocker
#   PARAMETER      : (dev) provide contribution mode to upload to github
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : ./edockerinstall <dev>
# ----------------------------------------------------

# global edocker
edockerpath=$PWD/scripts
aliaspath=$PWD
prefix=edocker
mode=release
source _common.sh

# Replace absolute paths of edocker in all scripts
function updatePaths() {
  script="$1"
  mode="$2"

  if [ "${mode}" = "release" ]; then
    if [ "$(uname)" = "Linux" ]; then
      sed -i "s|{edockerpath}|${edockerpath}|g" ${script}
    elif [ "$(uname)" = "Darwin" ]; then
      sed -i '' "s|{edockerpath}|${edockerpath}|g" ${script}
    fi
  elif [ "${mode}" = "dev" ]; then
    if [ "$(uname)" = "Linux" ]; then
      # reverse for github uploading
      sed -i "s|${edockerpath}|{edockerpath}|g" ${script}
    elif [ "$(uname)" = "Darwin" ]; then
      sed -i '' "s|{edockerpath}|${edockerpath}|g" ${script}
      # reverse for github uploading
      sed -i '' "s|${edockerpath}|{edockerpath}|g" ${script}
    fi
  else
    echo "edocker:WARNING: unidentified mode: ${mode}"
  fi
}

# Build aliases files
function buildAliases() {

  mode=$1

  # edocker alias/unalias files
  edaliasFile=${aliaspath}/${prefix}.alias
  edunaliasFile=${aliaspath}/${prefix}.unalias

  echo -e "\n--- edocker: easy docker ---"
  echo -e "\n--- Installation..."

  if [ -n "$1" ] && [ "dev" = "$1" ]; then
    mode=$1
    echo -e "edocker:WARING: Contribution mode. All current path of all scripts will be replaced by pattern {edockerpath}. You could upload after that."
  fi

  echo -e "\nProcess will create alias command in files:"
  echo -e "  - ${edaliasFile}, containing all edocker alias"
  echo -e "  - ${edunaliasFile}, containing all edocker unalias"

  # list all *.sh scripts from edocker path
  scripts=$(ls $edockerpath/*.sh | grep -v $(basename $0))

  # delete all previous aliases files in edocker path
  rm -f ${edaliasFile} ${edunaliasFile}

  echo -e "\n--- Build aliases..."

  # create aliases files (*.alias and *.unalias)
  for s in scripts/${scripts}; do

    updatePaths "${s}" "${mode}"

    base=$(basename ${s})

    if [[ ! "$base" =~ [_]{1}.* ]]; then

      edalias=${prefix}${base%.sh}

      echo -e "  - updating aliases ${edalias} in files..."

      echo "alias ${edalias}=\"source ${edockerpath}/${base}\"" >> ${edaliasFile}

      echo "unalias ${edalias}" >> ${edunaliasFile}

    fi

  done

  echo -e "\n--- Aliases files created. Run commands for (un)activation:"
  echo -e "  - \"<source ${aliaspath}/${prefix}.alias>\"   => aliases ${prefix}[docker command] are added"
  echo -e "  - \"<source ${aliaspath}/${prefix}.unalias>\" => aliases ${prefix}[docker command] are removed"

  # check if alias are activated
  echo -e "\n--- Check if aliases are activated or removed in your session by running:"
  echo -e "  - \"<alias|grep ${prefix}>\""

  # configuration of docker project
  echo -e "\n--- Do following actions in your favorite docker working directory:"
  echo -e "  - run \"<edockerinit>\" your docker working directory,"
  echo -e "    it copy model edocker_template.${config_extension} in your docker working directory with name edocker.${config_extension}"
  echo -e "  - configure parameters inside edocker.${config_extension}, most important: image_name and container_name"
  echo -e "  - try an edocker command, like edockerbuild..."

}

# update (un)alias files in edocker path
if [ -n "$1" ] && [ "$1" = "dev" ]; then
  mode=dev
  echo -e "edocker:WARNING: you are in contribution mode, all absolute paths will be replaced by path pattern {edockerpath} in all scripts. After, you could upload your files."
fi

buildAliases ${mode}
