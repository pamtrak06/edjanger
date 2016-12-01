#!/bin/bash
# ------------------------------------------------------------------------------
##  Generate edjanger.poperties from edjanger.template
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --properties=CONFIG        properties file containing varaibles to be replaced in edjanger.template to create edjanger.properties
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

function check_export_presence_from_properties()
{
  prop_file=$1

  nbvar=$(cat $prop_file |grep "="| wc -l)
  nbexp=$(cat $prop_file |grep "export"| wc -l)

  if [ "$nbvar" = "$nbexp" ]; then
    check_export_presence_from_properties=true;
  else
    echo -e "edjanger:ERROR one or several \"export\" command are absent(s) in the previous properties, please fix it"
    echo -e "  - variable declaration must have this form: \"export <variable name>=<value>\""
    echo -e "  - content of the previous properties:"
    while read line; do echo -e "\t\t$line"; done < $prop_file
    check_export_presence_from_properties=false;
  fi
}

function create_edjanger_properties()
{
  command=$1

  if [[ ! "$command" == *"properties="* ]]; then
    echo -e "edjanger:ERROR no properties argument setted, usage:"
    printHeader $0
    return 1
  else
    if [[ "${command}" = "--"*"="* ]]; then
      configuration=${command##--properties=}
    elif [[ "${command}" = "-"*"="* ]]; then
      configuration=${command##-properties=}
    elif [[ "${command}" = *"="* ]]; then
      configuration=${command##properties=}
    else
      echo -e "edjanger:ERROR properties argument incorrectly setted, usage:"
      printHeader $0
      return 1
    fi
  fi
  
  echo -e "> Initialize edjanger.properties from template and configuration file ($configuration)..."

  if [ ! "${configuration##*.}" = "properties" ]; then
    configuration=$configuration.properties
  fi

  if [ "${configuration}" = "edjanger" ]; then
    echo -e "edjanger:ERROR this name could not be used for this purpose. Please choose another one."
    return -1
  fi

  # Retrieve all edjanger configuration files from current directory
  listconf=$(find . -name "edjanger.template")
  if [ -z "$listconf" ]; then
    echo -e "edjanger:ERROR No edjanger.template available recursively in this directory"
    return 1
  fi

  for template in ${listconf[@]}
  do

    echo -e "  . process informations of template: \"${template}\"  ..."

    continueprocess=true

    # one main configuration file
    if [ -n "${configuration}" ] && [ -f "${configuration}" ]; then

      prop_file=${configuration}
      echo -e "  . use main configuration file: \"${prop_file}\"  ..."
      check_export_presence_from_properties "$prop_file"
      continueprocess=$?

    # one configuration file by edjanger.template
    elif [ -n "${configuration}" ]; then

      working_directory=$(dirname ${template})
      prop_file=${working_directory}/${configuration}
      echo -e "  . use local configuration file: \"${prop_file}\"  ..."
      check_export_presence_from_properties "$prop_file"
      continueprocess=$?

    else

      continueprocess=false
      echo -e "edjanger:ERROR File configuration name must exist and be set as argument"

    fi

    if [ ${continueprocess} ]; then

      # replace variable from configuration file in template
      # if configuration file exist (global or local)
      if [ -f "${prop_file}" ]; then

        edjangerproperties=${template%.template}.properties

        # check if edjanger.properties exist
        if [ -f "${edjangerproperties}" ]; then

          echo -e "edjanger:WARNING edjanger properties file \"${edjangerproperties}\" already exist, do you want to replace it (y/n) ?"
          read response

          if [ "y" = "${response}" ]; then
            date_time=$(date +"%Y%m%d_%H%M%S")
            cp ${edjangerproperties} ${template%.template}_${date_time}.bak
            echo -e "  . create \"${edjangerproperties}\" file from template \"${template}\" and configuration file \"${prop_file}\""
            . ${prop_file} && envsubst < "${template}" | tee "${edjangerproperties}" > /dev/null
          fi

        # else create edjanger.properties
        else

          echo -e "  . create \"${edjangerproperties}\" file from template \"${template}\" and configuration file \"${prop_file}\""
          . ${prop_file} && envsubst < "${template}" | tee "${edjangerproperties}" > /dev/null

        fi
      # else configuration file doe not exist
      else
        echo -e "edjanger:ERROR properties file (${prop_file}) does not exist for template ${template}, edjanger.properties could not be created"
      fi

    else
      echo -e "edjanger:ERROR templating aborted, see previous reported errors"
    fi

  done
}

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  printHeader $0
else
  create_edjanger_properties $1
fi
