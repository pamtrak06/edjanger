#!/bin/bash
# ------------------------------------------------------------------------------
##  Description: generate edjanger.poperties from edjanger.template
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --properties=CONFIG        properties file containing variables to be replaced in edjanger.template to create edjanger.properties
##  
##         --save                     save current directory as a template (teplate name is the hash of the archive)
##  
##         --delete                   delete named archive. Must be combined with option --name=TEMPLATE-NAME
##  
##         --savepattern              additionnal file pattern to save in the archive
##  
##         --init=TEMPLATE-NAME       initialize with the name of the template which could be chozen from the --list option
##  
##         --name=TEMPLATE-NAME       save template with specified archive name
##  
##         --list                     list of all available templates
##  
##         --listinfo                 list of all available templates with details
##  
##  Example:
##     edjangertemplate --help        print this documentation
##  
##     edjangertemplate --properties=configuration
##                                    replace environement variables from file configuration.properties in edjanger.template to produce edjanger.properties file
##  
##     edjangertemplate --save
##                                    save all current configuration in a templating folder with an hash identifiant (edjanger.*, scripts sh, )
##  
##     edjangertemplate --save --name=demo_web
##                                    save all current configuration in a templating folder with the template name "demo_web"
##  
##     edjangertemplate --save --name=demo_web --savepattern="*.html,*js,*.css"
##                                    save all current configuration in a templating folder with the template name "demo_web" and save additional files
##  
##     edjangertemplate --list
##                                    print the list off all stored templates
##  
##     edjangertemplate --delete --name=demo_web
##                                    remove the template from storage space
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

source {edjangerpath}/_common.sh

function check_export_presence_from_properties()
{
  local properties=$1

  nbvar=$(cat $properties |grep "="| wc -l)
  nbexp=$(cat $properties |grep "export"| wc -l)

  if [ "$nbvar" = "$nbexp" ]; then
    check_export_presence_from_properties=true;
  else
    echo -e "edjanger:ERROR one or several \"export\" command(s) are missing in the properties file, please fix it"
    echo -e "  - variable declaration must have this form: \"export <variable name>=<value>\""
    echo -e "  - content of the properties file:"
    while read line; do echo -e "\t\t$line"; done < ${properties}
    check_export_presence_from_properties=false;
  fi
}

function update_metadata()
{
  infofile=$1
  propfile=$2
  template=$3
  tmppath=$4
  
  #echo "infofile :$infofile"
  #echo "propfile :$propfile"
  #echo "template :$template"
  #echo "tmppath  :$tmppath"
  
  # Retrieve metadata informations
  if [ -n "$template" ] && [ -n "$tmppath" ]; then
    basetmpl=$(basename ${template})
    dirbase=$(dirname ${template})
    . $propfile && envsubst < "${template}" | tee "$tmppath/${basetmpl}.tmp" > /dev/null
    . $tmppath/${basetmpl}.tmp
  else
    dirbase=$(dirname ${propfile})
    . $propfile
  fi
  
  build_file=$(echo ${build_file}|awk '{ printf $2 }')
  from_image=$(cat $dirbase/$build_file|grep FROM|awk '{ printf $2 }')
  echo -e "  - properties:       $propfile" >> $infofile
  if [ -n "$template" ] && [ -n "$tmppath" ]; then
    echo -e "    template:         edjanger.template" >> $infofile
  fi
  echo -e "    image_name:       $image_name" >> $infofile
  echo -e "    from_image:       $from_image" >> $infofile
  echo -e "    dockerfile:       $build_file" >> $infofile
  echo -e "    container_name:   $container_name" >> $infofile
  echo -e "    timestamp:        $(date)" >> $infofile
}

function archive_or_append()
{
  tarfile=$1
  target=$2
  
  if [ -f $tarfile ]; then
    echo -e "  append file: $target..."
    $ARCHIVE_APPEND $tarfile $target > /dev/null
  else
    echo -e "  archive file: $target..."
    $ARCHIVE $tarfile $target > /dev/null
  fi

}

function archive_buid_path()
{
  template=$1
  tmpl_path=$2
  build_path=$3
  tarfile=$4
  
  [ -d $tmpl_path/$build_path ] \
      && echo "# Build path read in template \"$tmpl_path/$template\"" \
      && echo $tmpl_path/$build_path \
      && archive_or_append $tarfile $tmpl_path/$build_path
      
  [ ! -d $tmpl_path/$build_path ] && [ -f $tmpl_path/edjanger.properties ] \
      && build_path=$(cat $tmpl_path/edjanger.properties | grep "build_path=") \
      && build_path=${build_path##*=} \
      && build_path=$(echo ${build_path}| tr -d '"') \
      && [ -d "$tmpl_path/$build_path" ] \
          && echo "# Build path read in properties \"$tmpl_path/edjanger.properties\"" \
          && echo $tmpl_path/$build_path \
          && archive_or_append $tarfile $tmpl_path/$build_path
}

function save_configuration()
{
  
  [ -z "$(ls -A .)" ]           && echo -e "edjanger:ERROR: directory is empty, nothing to save" && return 1
  
  [ ! -d $templates_path ]      && echo -e "edjanger:ERROR: template path is undefined see prefs.properties" && return 1
  
  # temporary folder to save files for the template
  [ ! -d $templates_path/tmp ]  && mkdir -p $templates_path/tmp
  
  local tmppath=$templates_path/tmp
  local writeinfo=false
  local tarfile=$tmppath/tmp.tar
  local infofile=$tmppath/tmp.yaml
  
  # check if archive already exist
  if [ -n $name ]; then

    archive_id=$name
    zipname=${archive_id}.zip
    
    if [ -f "$templates_path/$zipname" ]; then

      echo -e "edjanger:WARNING template archive file \"$templates_path/$zipname\" already exist, do you want to replace it (y/n) ?"
      read response

      if [ ! "y" = "${response}" ]; then
        return 1
      fi

    fi
  fi


  # zip all edjanger files (properties + template) + build files, filter shared volumes
  [ -f $tarfile ]      && rm -f $tarfile
  [ -f $infofile ]     && rm -f $infofile
  
  # save main properties files
  current_path=.
  if [ ! -f edjanger.properties ] && [ ! -f edjanger.template ]; then
    prop_list=$(ls "$current_path/*.properties")
    [ -n ${prop_list} ] \
        && echo "# Main configuration files"
    for p in ${prop_list[@]}
    do
      
      archive_or_append $tarfile $current_path/$p
      
    done
  fi
  
  # archive docker-compose.yaml
  if [ -f docker-compose.yaml ]; then
    
    echo "# Docker compose file \"docker-compose.yaml\""
    archive_or_append $tarfile docker-compose.yaml
    
  fi
  
  # archive all scripts
  listscripts=$(find $current_path -name "*.sh")
  [ -n ${prop_list} ] \
      && echo "# Scripts used"
  for script in ${listscripts[@]}
  do
    
    archive_or_append $tarfile $script
    
  done
  
  # archive additional file
  if [ -n ${savepattern} ]; then
    
    listadd=$(find $current_path -name "$savepattern")
    [[ -n ${listadd} ]] \
        && echo "# Additionnal file pattern: $savepattern"
    
    for add in ${listadd[@]}
    do
      
      archive_or_append $tarfile $add
      
    done
    
  fi
  
  listtmpl=$(find $current_path -name "edjanger.template")
  [[ -n ${listtmpl} ]] \
     && writeinfo=true \
     && echo "# Template, build and properties files"
  
  for template in ${listtmpl[@]}
  do

    tmpl_path=$(dirname ${template})
    archive_or_append $tarfile $template
    
    build_path=$(cat $template | grep "build_path=")
    build_path=${build_path##*=}

    archive_buid_path $template $tmpl_path $tmpl_path/$build_path $tarfile
            
    # TODO extract list of shared volume and replace PWD or ./ by current directory
    # shared_volumes_path=$(cat $template | grep "shared_volumes=")
    # shared_volumes_path=${shared_volumes_path##*=}
    # [ -d "$tmpl_path/$shared_volumes_path" ] \
    #     && echo "# Shared volume path read in template \"$tmpl_path/$template\"" >> list.except \
    #     && echo $tmpl_path/$shared_volumes_path >> list.except
    # 
    # [ ! -d $tmpl_path/$shared_volumes_path ] && [ -f $tmpl_path/edjanger.properties ] \
    #     && shared_volumes_path=$(cat $tmpl_path/edjanger.properties | grep "shared_volumes=") \
    #     && shared_volumes_path=${shared_volumes_path##*=} \
    #     && [ -d "$tmpl_path/$shared_volumes_path" ] \
    #         && echo "# Shared volume path read in properties \"$tmpl_path/edjanger.properties\"" >> list.except \
    #         && echo $tmpl_path/$shared_volumes_path >> list.except
    # echo "tmpl, shared_volumes_path=$shared_volumes_path"

    # save properties files
    #prop_list=$(find $tmpl_path -name "*.properties"|grep -v edjanger.properties|grep -v $shared_volumes_path)
    prop_list=$(find $tmpl_path -name "*.properties"|grep -v edjanger.properties)
    [[ -n ${prop_list} ]] \
          && echo "# Local configuration files in path \"$tmpl_path\"" \
          && echo "configurations:" >> $infofile
    for propfile in ${prop_list[@]}
    do

      # Write metadata informations
      update_metadata $infofile $propfile $template $tmppath
      archive_or_append $tarfile $propfile
      
    done
    
    # save edjanger.properties files
    if [ -f $tmpl_path/edjanger.properties ]; then
      echo "# Properties file \"edjanger.properties\""
      archive_or_append $tarfile $tmpl_path/edjanger.properties
    fi

  done
  
  listprops=$(find . -name "edjanger.properties")
  for prop in ${listprops[@]}
  do
    # if there is no template file
    if [ ! -f "${prop%.*}.template" ]; then
    
      echo "# Properties file \"edjanger.properties\" without template"
      
      prop_path=$(dirname ${prop})
      archive_or_append $tarfile $prop_path/$prop

      build_path=$(cat $prop_path/edjanger.properties | grep "build_path=") \
      build_path=${build_path##*=} \
      build_path=$(echo ${build_path}| tr -d '"') \
      [ -d "$prop_path/$build_path" ] \
          && echo "# Build path read in properties \"$prop_path/edjanger.properties\"" \
          && echo $prop_path/$build_path \
          && archive_or_append $tarfile $prop_path/$build_path
      
      # TODO extract list of shared volume and replace PWD or ./ by current directory
      # shared_volumes_path=$(cat $prop | grep "shared_volumes=")
      # shared_volumes_path=${shared_volumes_path##*=}
      # [ -d $prop_path/$shared_volumes_path ] \
      #     && echo "# Shared volume path read in prop \"$prop_path/$prop\"" >> list.except \
      #     && echo $prop_path/$shared_volumes_path >> list.except
      # 
      # [ ! -d $prop_path/$shared_volumes_path ] && [ -f $prop_path/edjanger.properties ] \
      #     && shared_volumes_path=$(cat $prop_path/edjanger.properties | grep "shared_volumes=") \
      #     && shared_volumes_path=${shared_volumes_path##*=} \
      #     && [ -d $prop_path/$shared_volumes_path ] \
      #         && echo "# Shared volume path read in properties \"$prop_path/edjanger.properties\"" >> list.except \
      #         && echo $prop_path/$shared_volumes_path >> list.except

      # save properties files
      #prop_list=$(find $prop_path -name "*.properties"|grep -v edjanger.properties|grep -v $shared_volumes_path)
      #conf_list=$(find $prop_path -name "*.properties"|grep -v edjanger.properties)
      # [ -n ${conf_list} ]     && echo "# Local configuration files in path \"$prop_path\""
      # for conf in ${prop_list[@]}
      # do
      #   
      #   # Write metadata informations
      #   update_metadata $infofile $conf ... template ... 
      #   
      #   echo $conf
      #   archive_or_append $tarfile $conf > /dev/null
      # done
      
      #if [ -z ${prop_list} ]; then
      # Write metadata informations
      update_metadata $infofile $prop
      #fi
      
    fi
    
  done
  
  # use predefined name or hash id (cksum)
  if [ -n $name ]; then
    archive_id=$name
  else
    tarhash=$(cksum $tarfile)
    archive_id=$(echo ${tarhash} | awk '{ printf $1"_"$2}')
  fi
  
  # check it archive exist for the hash
  if [ -z $name ] && [ -f "$templates_path/$zipname" ]; then
    zipname=${archive_id}.zip
    
    echo -e "edjanger:WARNING template archive file \"$templates_path/$zipname\" already exist, do you want to replace it (y/n) ?"
    read response

    if [ ! "y" = "${response}" ]; then
      return 1
    fi
  fi
  
  #rename zip file with cksum
  tarpath=$(dirname $tarfile)
  
  tarname=${archive_id}.tar
  #echo -e "Template archive: \"$tarname\""
  mv $tarfile $tarpath/$tarname

  mdname=${archive_id}.yaml
  #echo -e "Template metadata: \"$mdname\""
  mv $infofile $tarpath/$mdname

  echo -e "\nTemplate archive saved in file: \"$templates_path/$zipname\""
  rm -f $templates_path/$zipname
  curdir=$PWD
  cd $tarpath
  zip $templates_path/$zipname $mdname $tarname
  cd
  rm -rf $tmppath
  echo -e "\nAvailable templates could be printed with commands: edjangertemplate --list"
  
}

function create_edjanger_properties()
{
  properties=$1
  
  if [[ ! "${properties##*.}" == *"properties" ]]; then
    properties=${properties}.properties
  fi

  if [ "${properties}" = "edjanger" ]; then
    echo -e "edjanger:ERROR this name could not be used for this purpose. Please choose another one."
    return -1
  fi
  
  echo -e "> Initialize edjanger.properties from template and configuration file (${properties})..."

  # Retrieve all edjanger configuration files from current directory
  listconf=$(find . -name "edjanger.template")
  if [ -z "$listconf" ]; then
    echo -e "edjanger:ERROR No edjanger.template available recursively in this directory"
    return 1
  fi

  # one main configuration file
  if [ -f "${properties}" ]; then

    echo -e "  . use main configuration file: \"${properties}\"  ..."
    check_export_presence_from_properties "${properties}"
    continueprocess=$?
    
  fi

  for template in ${listconf[@]}
  do

    echo -e "  . process template: \"${template}\"  ..."

    continueprocess=true

    working_directory=$(dirname ${template})
    propertieslocal=${working_directory}/${properties}

    # one configuration file by edjanger.template
    if [ -f "${propertieslocal}" ]; then

      echo -e "  . use local configuration file: \"${propertieslocal}\"  ..."
      check_export_presence_from_properties "${propertieslocal}"
      continueprocess=$?

    else

      continueprocess=false
      echo -e "edjanger:ERROR File configuration name must exist and be set as argument"

    fi

    if [ ${continueprocess} ]; then

      # replace variable from configuration file in template
      # if configuration file exist (global or local)
      if [ -f "${propertieslocal}" ]; then

        edjangerproperties=${template%.template}.properties

        # check if edjanger.properties exist
        if [ -f "${edjangerproperties}" ]; then

          echo -e "edjanger:WARNING edjanger properties file \"${edjangerproperties}\" already exist, do you want to replace it (y/n) ?"
          read response

          if [ "y" = "${response}" ]; then
            date_time=$(date +"%Y%m%d_%H%M%S")
            cp ${edjangerproperties} ${template%.template}_${date_time}.bak
            echo -e "  . create \"${edjangerproperties}\" file from template \"${template}\" and configuration file \"${propertieslocal}\""
            . ${propertieslocal} && envsubst < "${template}" | tee "${edjangerproperties}" > /dev/null
          fi

        # else create edjanger.properties
        else

          echo -e "  . create \"${edjangerproperties}\" file from template \"${template}\" and configuration file \"${propertieslocal}\""
          . ${propertieslocal} && envsubst < "${template}" | tee "${edjangerproperties}" > /dev/null

        fi
      # else configuration file doe not exist
      else
        echo -e "edjanger:ERROR properties file (${propertieslocal}) does not exist for template ${template}, edjanger.properties could not be created"
      fi

    else
      echo -e "edjanger:ERROR templating aborted, see previous reported errors"
    fi
  
  done
}

function main_template()
{

  evalOptionsParameters $*

  if [ -n "${help}" ]; then
    
    printHeader $0
    
  else
    
    if [ "$#" == 0 ]; then
      echo -e "edjanger:ERROR arguments must not be empty, usage:"
      printHeader $0
      return 1
    fi
  
    if [ -z "${properties}" ] && [ -z "${save}" ] && [ -z "${list}" ] && [ -z "${listinfo}" ] \
    && [ -z "${delete}" ] && [ -z "${init}" ]; then
      echo -e "edjanger:ERROR less one of options \"properties\" or \"save\" or \"list\" must be defined, usage:"
      printHeader $0
      return 1
    fi
    
    if [ -n "${properties}" ] && [ -n "${save}" ]; then
      echo -e "edjanger:ERROR only one of options \"properties\" or \"save\" must be defined, usage:"
      printHeader $0
      return 1
    fi
    
    if [ -n "${properties}" ]; then
      
      create_edjanger_properties ${properties}
    
    elif [ -n "${save}" ]; then
      
      save_configuration
      
    elif [ -n "${list}" ]; then
      
      print_template_list false
      
    elif [ -n "${listinfo}" ]; then
      
      print_template_list true
      
    elif [ -n "${init}" ]; then

      init_new_template ${init}
      
    elif [ -n "${delete}" ]; then

      delete_template ${name}
      
    fi
    
  fi
}

[[ -n "$@" ]]                      && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                   && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                   && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")

main_template $externaloptions
