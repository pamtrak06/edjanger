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
source scripts/_common.sh

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
function checkPrerequisities() {
  status=0;
  is_exec_present "bc"
  if [ $? = -1 ]; then
    status=-1;
  fi
  is_exec_present "envsubst"
  if [ $? = -1 ]; then
    status=-1;
  fi
  return $status
}

# update templates
function updateTemplates() {

  mode=$1

  listtmpl=$(find ${edockerpath}/templates -name "*.sh")

  for t in ${listtmpl}; do

    updatePaths "${t}" "${mode}"

  done

}

# update scripts
function updateScripts() {

  mode=$1

  scripts=$(ls ${edockerpath}/*.sh)

  for s in ${scripts}; do

    updatePaths "${s}" "${mode}"

  done

}

# swith to dev mode to push to github
function swith2devMode() {
  mode=$1
  updateScripts $mode
  updateTemplates $mode
}

# configuration of docker project
function printConfiguration() {

  echo -e "\n--- Do following actions in your favorite docker working directory:"
  echo -e "  - call \"<edockerinit>\" within your docker working directory,"
  echo -e "    it copy template edocker_template.${config_extension} in your docker working directory with name edocker.${config_extension}"
  echo -e "  - configure parameters inside edocker.${config_extension}, most important: image_name and container_name"
  echo -e "  - try an edocker command, like edockerbuild..."
  echo -e "  - New: see how to create docker-compose.yaml from edocker.properties with edockercompose !"
  echo -e "  - New: take a look at cron capabilities at https://github.com/pamtrak06/edocker#configure-automatic-container-restart-at-boot !"
  echo -e "  - New: take a look at edockertemplate to make yours edocker.properties highly configurable !"
}

# Build symbolic links
function buildSymbolicLinks() {
  target=${edockerpath}

  mode=$1

  echo -e "\n--- edocker: easy docker ---"
  echo -e "\n--- Installation..."

  echo -e "\n--- Check prerequisities..."
  checkPrerequisities
  if [ $? = -1 ]; then
    return -1;
  fi
  echo -e "\nProcess will create symbolic links command in $target"

  #create target if not exist
  if [ ! -d "$target" ]; then
    mkdir -p $target
    if [ $? = -1 ]; then
      echo -e "\nCreating direcory $target failed, trying to install aliases method"
      buildAliases ${mode}
      return -1;
    fi
  fi

  # remove symbolic links
  if [ -n "$(ls -A $target/edocker*)" ]; then
   for s in $(ls ${target}/edocker*); do
     if [ -L "$s" ]; then
       rm -f $s
    fi
   done
  fi

  #create symbolic links for all sh scripts
  echo -e "\n--- Build symbolic links..."
  if [ -z "$(ls -A $target/edocker*)" ]; then

    for s in $(ls ${edockerpath}/*.sh); do

      echo "Linking $s..."
      base=$(basename $s)
      ln -s $s $target/edocker${base%.*}

      # update paths in scripts
      updatePaths "${s}" "${mode}"

    done

  else
    echo -e "Folder \"$target\" already exist"
  fi

  echo -e "\n--- Update templates path in shell scripts..."
  updateTemplates ${mode}

  echo -e "\n--- Symbolic links in $target created."

  printConfiguration

}

# Build aliases files
function buildAliases() {

  mode=$1

  # edocker alias/unalias files
  edaliasFile=${aliaspath}/${prefix}.alias
  edunaliasFile=${aliaspath}/${prefix}.unalias

  echo -e "\n--- edocker: easy docker ---"
  echo -e "\n--- Installation..."

  echo -e "\n--- Check prerequisities..."
  checkPrerequisities
  if [ $? = -1 ]; then
    return -1;
  fi

  echo -e "\nProcess will create alias command in files:"
  echo -e "  - ${edaliasFile}, containing all edocker alias"
  echo -e "  - ${edunaliasFile}, containing all edocker unalias"

  # list all *.sh scripts from edocker path
  scripts=$(ls ${edockerpath}/*.sh)

  # delete all previous aliases files in edocker path
  rm -f ${edaliasFile} ${edunaliasFile}

  echo -e "\n--- Build aliases..."

  # create aliases files (*.alias and *.unalias)
  for s in ${scripts}; do

    updatePaths "${s}" "${mode}"

    base=$(basename ${s})

    if [[ ! "$base" =~ [_]{1}.* ]]; then

      edalias=${prefix}${base%.sh}

      echo -e "  - updating aliases ${edalias} in files..."

      echo "alias ${edalias}=\"source ${edockerpath}/${base}\"" >> ${edaliasFile}

      echo "unalias ${edalias}" >> ${edunaliasFile}

    fi

  done

  echo -e "\n--- Update templates path in shell scripts..."
  updateTemplates $mode

  echo -e "\n--- Aliases files created. Run commands for (un)activation:"
  echo -e "  - \"source ${aliaspath}/${prefix}.alias\"   => aliases ${prefix}[docker command] are added"
  echo -e "  - \"source ${aliaspath}/${prefix}.unalias\" => aliases ${prefix}[docker command] are removed"

  # check if alias are activated
  echo -e "\n--- Check if aliases are activated or removed in your session by running:"
  echo -e "  - \"<alias|grep ${prefix}>\""

  printConfiguration

}

# update (un)alias files in edocker path
if [ -n "$1" ] && [ "$1" = "dev" ]; then
  mode=dev
  echo -e "### edocker:WARNING: you are in contribution mode"
  echo -e "### All absolute paths (${edockerpath}) will be replaced by path pattern {edockerpath} in all scripts."
  echo -e "### After, you could upload your files to github."
  echo -e "### Do: \"git status\" and read INSTALL.md, contribution part..."
fi

if [ "$mode" = "dev" ]; then
  swith2devMode ${mode}
else
  buildSymbolicLinks ${mode}
fi
