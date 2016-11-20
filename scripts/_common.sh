#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : _common.sh
# DESCRIPTION      : common scripts for ${app_name} scripts
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : source _common.sh
# ----------------------------------------------------
config_extension=properties
app_name=edjanger

function is_exec_present()
{
  execname="$1"
  exepath=$(command -v $execname)
  if [ -z "$exepath" ]; then
    echo -e "${app_name}:ERROR: $execname is not present (result: $exepath), please install it, installation aborted"
    return -1;
  else
    return 0;
  fi
}

function rename_edocker_properties()
{
  if [ -f edocker.${config_extension} ]; then
    echo -e "${app_name}:WARNING found edocker.${config_extension}, do you want to rename it to ${app_name}.${config_extension} (y/n)?"
    read response
    if [ "y" = "$response" ]; then
      mv edocker.${config_extension} ${app_name}.${config_extension}
    else
      return -1;
    fi
  fi
}

function read_app_properties()
{
  rename_edocker_properties
  if [ ! -f ${app_name}.${config_extension} ]; then
    echo -e "${app_name}:ERROR No ${app_name}.${config_extension} available, use \"<${app_name}init>\" command to initialize one in this directory"
  else
    parameters=$(cat {edjangerpath}/templates/${app_name}_template.${config_extension}|grep "="|cut -d '=' -f1|cut -d '#' -f2)

    for p in ${parameters}; do
      unset -v ${p}
    done

    source ${app_name}.${config_extension}

  fi

}

function dockerbasicimage()
{
  command="$1"
  comment="$2"

  if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
    source {edjangerpath}/_common.sh
    usage $0 $2
  else
    rename_edocker_properties
    if [ ! -f ${app_name}.${config_extension} ]; then
      echo -e "${app_name}:ERROR No ${app_name}.${config_extension} available, use \"<${app_name}init>\" command to initialize one in this directory"
    else
      read_app_properties
      echo "${comment} $(echo ${image_name} | cut -d ':' -f1)..."
      docker ${command} | grep $(echo ${image_name} | cut -d ':' -f1)
      if [ "true" = "${docker_command}" ]; then
          echo -e "> Executed docker command:"
          echo -e "> docker ${command} | grep $(echo ${image_name} | cut -d ':' -f1)"
      fi
    fi
  fi
}

function dockerbasiccontainer()
{
  command="$1"
  comment="$2"
  initidx="$3"
  type="$4"

  if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
    source {edjangerpath}/_common.sh
    usage $0 $2
  else
    rename_edocker_properties
    if [ ! -f ${app_name}.${config_extension} ]; then
      echo -e "${app_name}:ERROR No ${app_name}.${config_extension} available, use \"<${app_name}init>\" command to initialize one in this directory"
    else
      read_app_properties
      if [ "${initidx}" != "-1" ]; then
        if [ "$type" = "image" ]; then
          idx=$(echo "$(docker ps -a | grep ${image_name} | wc -l)+${initidx}" | bc)
        elif [ "$type" = "container" ]; then
          idx=$(echo "$(docker ps -a | grep ${container_name} | wc -l)+${initidx}" | bc)
        else
          echo -e "${app_name}:ERROR unidentified type: $type"
        fi
        ct=${container_name}_${idx}
        echo "${comment} ${ct}..."
        docker ${command} ${ct}
        if [ "true" = "${docker_command}" ]; then
          echo -e "> Executed docker command:"
          echo -e "> docker ${command} ${ct}"
        fi
      else
        ct=${container_name}
        echo "${comment} ${ct}..."
        docker ${command} | grep -w "${ct}_[0-9]"
        if [ "true" = "${docker_command}" ]; then
          echo -e "> Executed docker command:"
          echo -e "> docker ${command} | grep -w \"${ct}_[0-9]\""
        fi
      fi
    fi
  fi
}

function checkparameter()
{
  parameter="$1"

  # grep parameter found in ${app_name}.${config_extension}
  export check=$(cat ${app_name}.${config_extension}|grep -v "#"|grep "${parameter}"|cut -d '=' -f1)
  if [ -z ${check} ]; then
    echo "    WARNING: parameter is missing !!!"
    return 255
  fi
}

function checkconfig()
{
  rename_edocker_properties
  if [ ! -f ${app_name}.${config_extension} ]; then
    echo -e "${app_name}:ERROR No ${app_name}.${config_extension} available, use \"<${app_name}init>\" command to initialize one in this directory"
  else

    read_app_properties

    parameters=$(cat {edjangerpath}/templates/${app_name}_template.${config_extension}|grep -v "#"|grep "="|cut -d '=' -f1)

    local res
    for p in ${parameters}; do

      echo -e "  - check \"${p}\""
      checkparameter "${p}"; if [ "$?" = "255" ]; then res=255; fi

    done

    if [ "$res" = "255" ]; then
      return 255
    fi
  fi
}

function usage_command()
{

  script=$1
  command=$2

  # list all *.sh scripts from ${app_name} path
  scripts=$(ls {edjangerpath}/*.sh | grep -v -e "${script}" -e "help" -e "\_")

  for s in ${scripts}; do

    base=$(basename ${s})

    found=$(grep -e ${command} ${s})

    if [ -n "${found}" ]; then
      echo -e "      - command: \"${app_name}${base%.sh}\""
    fi

  done

}

function usage_list()
{

  script=$1

  # list all *.sh scripts from ${app_name} path
  scripts=$(ls {edjangerpath}/*.sh | grep -v -e "\_")

  echo -e "Help must have one argument in list:"
  echo -e "  command: config"

  for s in ${scripts}; do

    base=$(basename ${s})

    echo -e "  command: ${base%.sh}"

  done

}

function usage_config()
{
  script=$1

  echo -e "Parameters in ${app_name}.${config_extension} configuration file"

  parameters=$(cat {edjangerpath}/templates/${app_name}_template.${config_extension}|grep -v "#"|grep "="|cut -d '=' -f1)

  for p in ${parameters}; do

    comment=$(cat {edjangerpath}/templates/${app_name}_template.${config_extension}|grep -e "#${p}"|cut -d ':' -f2)
    echo -e ""
    echo -e "  - ${p}: ${comment}, used by:"
    usage_command "${script}" "${p}"

  done

}

function usage()
{

  commands=()

  script=$1
  command=$2

  if [ -z "${command}" ]; then

    usage_list ${script}

  else

    found=false

    scripts=$(ls {edjangerpath}/*.sh | grep -v -e "\_")

    for s in ${scripts}; do

      base=$(basename ${s})

      edalias=${prefix}${base%.sh}

      if [ "$2" = "${edalias}" ]; then

        alias_txt=$(grep "ALIAS" ${s}|cut -d ':' -f2)
        echo -e "Usage       :"$alias_txt

        desc_txt=$(grep "DESCRIPTION" ${s}|cut -d ':' -f2)
        echo -e "Description :"$desc_txt

        params=$(grep "PARAMETER" ${s}|cut -d ":" -f2)
        if [ -n "$params" ]; then
          echo -e "parameters  "
          for p in $params; do
            echo -e "  - $(echo $p)"
          done
        fi

        SAVEIFS=$IFS
        IFS=$'\n'
        args=$(grep "ARGUMENT" ${s})
        echo -e "Argument    "
        echo -e "  - help"
        for arg in $args; do
          val=$(echo $arg|cut -d ':' -f2)
          echo -e "  - $val"
        done
        IFS=$SAVEIFS

        found=true

      fi

    done

    if [ "$2" = "config" ]; then

      usage_config "${script}"

      found=true

    fi

    if [ "${found}" != "true" ]; then
      usage_list ${script}
    fi

  fi
}


# Build path aliases files
function buildPathAliases() {

  working_path=$1
  base_path=$(basename $1)

  # ${app_name} alias/unalias files
  pathaliasFile=${working_path}/${base_path}.alias
  pathunaliasFile=${working_path}/${base_path}.unalias

  # list all *.sh scripts from ${app_name} path
  scripts=$(ls $working_path)

  # delete all previous aliases files path
  rm -f ${pathaliasFile} ${pathunaliasFile}

  #echo -e "\n--- Build aliases for subfolders of directory $working_path..."

  # create aliases files (*.alias and *.unalias)
  for s in ${scripts}; do

    base=$(basename ${s})

    if [ -d $working_path/${s} ]; then

      pathalias=cd${base}

      #echo -e "  - updating path aliases ${pathalias} in files..."

      echo "alias ${pathalias}=\"cd ${working_path}/${base}; pwd\"" >> ${pathaliasFile}

      echo "unalias ${pathalias}" >> ${pathunaliasFile}

    fi

  done

  echo $pathaliasFile

}
