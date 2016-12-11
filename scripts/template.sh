#!/bin/bash
# ------------------------------------------------------------------------------
##  Description: manage templates for edjanger :
##    A template is an archive which contains edjanger configuration files:
##    - edjanger.template
##    - edjanger.properties
##    - *.properties
##    - build folder read from each *.properties (injection in template to read property build_path)
##    - additional file pattern defined in option --savepattern
##  
##    Following operations are available:
##    - list available template's archive in the local database (short or detailed list)
##    - unarchive a template with an archive name retrieve from the list
##    - save a template in a local archive from current sources
##    - delete a template from the a local archive storage
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --configure=CONFIG-NAME    properties file containing variables to be replaced in edjanger.template to create edjanger.properties
##  
##         --create                   initialize with the name of the template which could be chozen from the --list option
##                                    Must be combined with option --name=TEMPLATE-NAME
##  
##         --delete                   delete named archive 
##                                    Must be combined with option --name=TEMPLATE-NAME
##  
##         --list                     list of all available templates
##  
##         --listinfo                 list of all available templates with details
##  
##         --name=TEMPLATE-NAME       template name available from archive name list
##                                    Must be combined with options --create, --delete, --save
##  
##         --save                     save current directory as a template (template name is the hash of the archive)
##                                    Could be combined with option --name=TEMPLATE-NAME
##  
##         --savepattern              additionnal file pattern to save in the archive
##  
##  Command lines example:
##  
##  Help:
##     edjangertemplate --help        print this documentation
##
##  Initialize a new template:
##     edjangertemplate --create=demo_httpd
##                                    create a nex template from the archive given by option create
##  
##  Load a template:
##     edjangertemplate --configure=configuration
##                                    replace environement variables from file configuration.properties in edjanger.template to produce edjanger.properties file
##  
##  Save a template:
##     edjangertemplate --save
##                                    save all current configuration in a templating folder with an hash identifiant (edjanger.*, scripts sh, )
##  
##     edjangertemplate --save --name=demo_web
##                                    save all current configuration in a templating folder with the template name "demo_web"
##  
##     edjangertemplate --save --name=demo_web --savepattern="*.html,*js,*.css"
##                                    save all current configuration in a templating folder with the template name "demo_web" and save additional files
##  
##  Print templates list:
##     edjangertemplate --list
##                                    print the list off all stored templates with short name only
##  
##  Print templates list:
##     edjangertemplate --listinfo
##                                    print the list off all stored templates with detailed informations
##  
##  Delete a template:
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

  nbvar=$(cat ${properties} |grep "="| wc -l)
  nbexp=$(cat ${properties} |grep "export"| wc -l)

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
  if [ -n "$template" ] && [ -n "$tmppath" ]; then
    echo -e "  - template:         $dirbase/edjanger.template" >> $infofile
  fi
  echo -e "    properties:       $propfile" >> $infofile
  if [ -n "$dirbase/$build_file" ]; then
    echo -e "    dockerfile:       $dirbase/$build_file" >> $infofile
  fi
  echo -e "    from_image:       $from_image" >> $infofile
  echo -e "    image_name:       $image_name" >> $infofile
  echo -e "    container_name:   $container_name" >> $infofile
}

function update_metadata_start()
{
  infofile=$1
  echo "configurations:" >> $infofile
}


function update_metadata_header()
{
  echo "# Writing metadata ..."
  
  infofile=$1
  echo "metadata:" >> $infofile
  echo -e "    timestamp:        $(date)" >> $infofile
  echo -e "    ostype:           $OSTYPE" >> $infofile
  
  echo "versions:" >> $infofile
  
  dockerversion=$(docker info | grep "Server Version:" | awk -F  ":" '{ printf $2}' | tr -d ' ')
  if [[ -n "$dockerversion" ]]; then
    echo -e "    docker:           $dockerversion" >> $infofile
  else
    echo -e "    docker:           undefined" >> $infofile
  fi
  
  dockermachineversion=$(docker-machine version)
  if [[ -n "$dockermachineversion" ]]; then
    dockermachineversion=$(echo ${dockermachineversion}| awk '{ printf $3" "$4}')
    dockermachineversion=$(echo ${dockermachineversion}| sed 's/^ *//;s/ *$//')
    echo -e "    docker-machine:   $dockermachineversion" >> $infofile
  else
    echo -e "    docker-machine:   undefined" >> $infofile
  fi
  
  dockercomposeversion=$(docker-compose version)
  if [[ -n "$dockercomposeversion" ]]; then
    
    composeversion=$(docker-compose version|grep "docker-compose version")
    composeversion=$(echo ${composeversion}| awk '{ printf $3" "$4" "$5}')
    composeversion=$(echo ${composeversion}| sed 's/^ *//;s/ *$//')
    echo -e "    docker-compose:   $composeversion" >> $infofile
    
    dockerpyversion=$(docker-compose version|grep "docker-py version")
    dockerpyversion=$(echo ${dockerpyversion}| awk -F  ":" '{ printf $2}')
    dockerpyversion=$(echo ${dockerpyversion}| sed 's/^ *//;s/ *$//')
    echo -e "    docker-py:        $dockerpyversion" >> $infofile
    
    cpythonversion=$(docker-compose version|grep "CPython version")
    cpythonversion=$(echo ${cpythonversion}| awk -F  ":" '{ printf $2}')
    cpythonversion=$(echo ${cpythonversion}| sed 's/^ *//;s/ *$//')
    echo -e "    cpython:          $cpythonversion" >> $infofile
    
    opensslversion=$(docker-compose version|grep "OpenSSL version")
    opensslversion=$(echo ${opensslversion}| awk -F  ":" '{ printf $2}')
    opensslversion=$(echo ${opensslversion}| sed 's/^ *//;s/ *$//')
    echo -e "    openssl:          $opensslversion" >> $infofile
    
  else
    echo -e "    docker-compose-version:    undefined" >> $infofile
  fi
  
}

# Archive local files in the template folder 
function archive_or_append()
{
  tarfile=$1
  target=$2
  
  if [ -f $tarfile ]; then
    echo -e "  append  : $target..."
    $ARCHIVE_APPEND $tarfile $target > /dev/null
  else
    echo -e "  archive : $target..."
    $ARCHIVE $tarfile $target > /dev/null
  fi

}

# ------------------------------------------------------------------------------
# Archive content of the build path
# ------------------------------------------------------------------------------
function archive_build_path()
{
  tarfile=$1
  propfile=$2
  template=$3
  tmpl_path=$4

  if [ -n "$template" ] && [ -n "$tmppath" ]; then
    
    basetmpl=$(basename ${template})
    dirbase=$(dirname ${template})
    . $propfile && envsubst < "${template}" | tee "$tmppath/${basetmpl}.tmp" > /dev/null
    . $tmppath/${basetmpl}.tmp
    [ -d $dirbase/$build_path ] \
        && ( echo "# Build path read from configuration \"$propfile\"" \
        && archive_or_append $tarfile $dirbase/$build_path ) \
        || echo "edjanger:ERROR build path \"$dirbase/$build_path\" read in \"$propfile\" does not exist"
    rm -f $tmppath/${basetmpl}.tmp
    
  else
    
    dirbase=$(dirname ${propfile})
    . $propfile
    [ -d $dirbase/$build_path ] \
        && ( echo "# Build path read from configuration \"$propfile\"" \
        && archive_or_append $tarfile $dirbase/$build_path ) \
        || echo "edjanger:ERROR build path \"$dirbase/$build_path\" read in \"$propfile\" does not exist"
        
  fi

}


# check if archive already exist
function check_archive_exist()
{
  archive_id=$1
  templates_path=$2
  
  zipname=${archive_id}.zip
  
  if [[ -f "$templates_path/$zipname" ]]; then

    echo -e "edjanger:WARNING template archive file \"$templates_path/$zipname\" already exist, do you want to replace it (y/n) ?"
    read response

    if [ ! "y" = "${response}" ]; then
      return 1
    else
      return 0
    fi

  fi
}

# archive additional pattern
function archive_additionnal_pattern()
{
  tarfile=$1
  template_pattern=$2
  current_path=$3
  comment=$4
  
  if [[ -n ${template_pattern} ]]; then

    build_find_pattern "$template_pattern"
    file_list=$(eval "find $current_path $pattern")
    [[ -n ${file_list} ]] \
        && echo -e "$comment"
    
    for file in ${file_list[@]}
    do
      
      archive_or_append $tarfile $file
      
    done
    
  fi
}

# ------------------------------------------------------------------------------
# Parse an edjanger projet folder to save files in an archive into folder
# {edjangerpath}/scripts/templates/templating, files are following:
#   - edjanger.template
#   - edjanger.properties
#   - *.properties
#   - build folder read from each *.properties (injection in template to read property build_path)
#   - additional file pattern defined in option --savepattern
# Produce following archive :
#   - {archive_name}.zip which contains :
#       - {archive_name}.tar
#       - {archive_name}.yaml
# Name of the archive ({archive_name}) could be:
#   - name read in command line option --name
#   - hash compute by a cksum on tar file (zip contain timestamp)
# ------------------------------------------------------------------------------
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
  
  # check if archive already exist for named archive (defined with option --name)
  # if yes, exit
  if [ -n $name ]; then
    check_archive_exist $name $templates_path
    [[ $? -eq 1 ]] && return 1
  fi

  # remove older *.tar and *.yaml files
  [ -f $tarfile ]      && rm -f $tarfile
  [ -f $infofile ]     && rm -f $infofile
  
  current_path=.

  # if no edjanger file present, save main properties files
  if [ ! -f edjanger.properties ] && [ ! -f edjanger.template ]; then
    
    # retrieve files only in first level folder
    main_prop_list=$(find $current_path -name "*.properties" -prune -type f -maxdepth 1)
  
    [ -n ${main_prop_list} ] \
        && echo "# Archive main configuration files"
    
    for prop in ${main_prop_list[@]}
    do
      
      archive_or_append $tarfile $current_path/$prop
      
    done
    
  fi
  
  # archive additional file pattern defined in prefs.properties$templates_save_pattern
  # templates_save_pattern is loaded in _common.sh by sourcing prefs.properties
  archive_additionnal_pattern $tarfile "$templates_save_pattern" $current_path \
          "# Archive additionnal file pattern read in prefs.properties\n# templates_save_pattern=$templates_save_pattern"

  # archive additional file pattern defined in command line option --savepattern
  archive_additionnal_pattern $tarfile "$savepattern" $current_path \
          "# Archive additionnal file pattern from option --savepattern: $savepattern"

  # update high level metadata
  update_metadata_header $infofile

  # Loop templates
  listtmpl=$(find $current_path -name "edjanger.template")
  [[ -n ${listtmpl} ]] \
     && writeinfo=true \
     && echo "# Archive with template, build and properties files"
  for template in ${listtmpl[@]}
  do

    echo "# Archive files with templating from ${template}"
    # archive template file
    tmpl_path=$(dirname ${template})
    archive_or_append $tarfile $template
    
    # save properties files on first current directory level, used with template, exclude edjanger.properties 
    prop_list=$(find $tmpl_path -name "*.properties" -prune -type f -maxdepth 1 -a \( -type f ! -name "edjanger.properties" -prune \))
    [[ -n ${prop_list} ]] \
          && echo "# Local configuration files in path \"$tmpl_path\"" \
          && update_metadata_start $infofile
    for propfile in ${prop_list[@]}
    do
      
      # write metadata informations
      update_metadata $infofile $propfile $template $tmppath
      
      # archive local configuration file
      archive_or_append $tarfile $propfile
      
      # archive build_path for each configuration files
      archive_build_path $tarfile $propfile $template $tmpl_path
      
    done
    
    # no local configuration files, global are to save build_path
    [[ -z ${prop_list} && -n ${main_prop_list} ]] \
          && echo "# Global configuration files in path \"$current_path\"" \
          && update_metadata_start $infofile
    for mainprop in ${main_prop_list[@]}
    do

      # write metadata informations
      update_metadata $infofile $mainprop $template $tmppath
      
      # archive build_path for each configuration files
      archive_build_path $tarfile $mainprop $template $tmpl_path
      
    done
    
    [[ -z ${prop_list} && -z ${main_prop_list} ]] \
          && echo "edjanger:ERROR templates file are present but there is no local or global configuration files" \
    
    # save edjanger.properties files
    if [ -f $tmpl_path/edjanger.properties ]; then
      echo "# Properties file \"edjanger.properties\""
      archive_or_append $tarfile $tmpl_path/edjanger.properties
    fi

  done
  
  # loop for list of edjanger.properties in path where ther is no edjanger.template
  listprops=$(find . -name "edjanger.properties")
  for prop in ${listprops[@]}
  do
    
    # if there is no template file
    if [ ! -f "${prop%.*}.template" ]; then
    
      echo "# Archive properties file \"edjanger.properties\" without template"
      
      # archive edjanger.properties
      archive_or_append $tarfile $prop
      
      # archive build_path for each configuration files
      archive_build_path $tarfile $prop

      # Write metadata informations
      update_metadata $infofile $prop
      
    fi
    
  done
  
  # use predefined name or hash id (cksum)
  if [ -n $name ]; then
    archive_id=$name
  else
    tarhash=$(cksum $tarfile)
    archive_id=$(echo ${tarhash} | awk '{ printf $1"_"$2}')
  fi
  
  # check if archive already exist for named archive 
  # not defined with option --name, use hash compute by cksum
  if [ -z $name ] && [ -f "$templates_path/$zipname" ]; then
    check_archive_exist $archive_id $templates_path
    [[ $? -eq 1 ]] && return 1
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
  echo -e "\nAvailable templates could be printed with commands:" \
          "\n  - edjangertemplate --list" \
          "\n  - edjangertemplate --listinfo"
  
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
  if [ -z "${listconf}" ]; then
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

    # if both exists, local override global
    [ -f "${properties}" ]       && configuration=${properties}
    [ -f "${propertieslocal}" ]  && configuration=${propertieslocal}
    
    # one configuration file by edjanger.template
    if [ -f "${propertieslocal}" ]; then

      echo -e "  . use local configuration file: \"${propertieslocal}\"  ..."
      check_export_presence_from_properties "${propertieslocal}"
      continueprocess=$?

    elif [ -f "${properties}" ]; then
      
      echo -e "  . use global configuration file: \"${properties}\"  ..."
      check_export_presence_from_properties "${properties}"
      continueprocess=$?
      
    else

      continueprocess=false
      echo -e "edjanger:ERROR local or global configuration must exist be present"

    fi

    if [ ${continueprocess} ]; then

      # replace variable from configuration file in template
      # if configuration file exist (global or local)
      if [ -f "${configuration}" ]; then

        edjangerproperties=${template%.template}.properties

        # check if edjanger.properties exist
        if [ -f "${edjangerproperties}" ]; then

          echo -e "edjanger:WARNING edjanger properties file \"${edjangerproperties}\" already exist, do you want to replace it (y/n) ?"
          read response

          if [ "y" = "${response}" ]; then
            date_time=$(date +"%Y%m%d_%H%M%S")
            cp ${edjangerproperties} ${template%.template}_${date_time}.bak
            echo -e "  . create \"${edjangerproperties}\" file from template \"${template}\" and configuration file \"${configuration}\""
            . ${configuration} && envsubst < "${template}" | tee "${edjangerproperties}" > /dev/null
          fi

        # else create edjanger.properties
        else

          echo -e "  . create \"${edjangerproperties}\" file from template \"${template}\" and configuration file \"${configuration}\""
          . ${configuration} && envsubst < "${template}" | tee "${edjangerproperties}" > /dev/null

        fi
      # else configuration file doe not exist
      else
        echo -e "edjanger:ERROR properties file (${configuration}) does not exist for template ${template}, edjanger.properties could not be created"
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
  
    if [ -z "${configure}" ] && [ -z "${save}" ] && [ -z "${list}" ] && [ -z "${listinfo}" ] \
    && [ -z "${delete}" ] && [ -z "${create}" ]; then
      echo -e "edjanger:ERROR less one of options \"properties\" or \"save\" or \"list\" must be defined, usage:"
      printHeader $0
      return 1
    fi
    
    if [ -n "${save}" ] && [ -z "${name}" ]; then
      echo -e "edjanger:ERROR option \"name\" must be defined with option \"save\", usage:"
      printHeader $0
      return 1
    fi
    
    if [ -n "${delete}" ] && [ -z "${name}" ]; then
      echo -e "edjanger:ERROR option \"name\" must be defined with option \"save\", usage:"
      printHeader $0
      return 1
    fi
    
    if [ -n "${create}" ] && [ -z "${name}" ]; then
      echo -e "edjanger:ERROR option \"name\" must be defined with option \"create\", usage:"
      printHeader $0
      return 1
    fi
  
    if [[ ( -n "${configure}" && -n "${save}"     ) || ( -n "${configure}" && -n "${delete}" ) || \
          ( -n "${configure}" && -n "${create}"   ) || ( -n "${configure}" && -n "${list}"   ) || \
          ( -n "${configure}" && -n "${listinfo}" ) || ( -n "${save}" && -n "${delete}"      ) || \
          ( -n "${save}"      && -n "${create}"   ) || ( -n "${save}" && -n "${list}"        ) || \
          ( -n "${save}"      && -n "${listinfo}" ) || ( -n "${delete}" && -n "${create}"    ) || \
          ( -n "${delete}"    && -n "${list}"     ) || ( -n "${delete}" && -n "${listinfo}"  ) || \
          ( -n "${create}"    && -n "${list}"     ) || ( -n "${create}" && -n "${listinfo}"  ) || \
          ( "${configure}"    =     "true"        ) || ( -n "${configure}" && -n "${name}"   ) || \
          ( -n "${list}"      && -n "${listinfo}" ) ]]; then
      echo -e "edjanger:ERROR imcompatible options, usage:"
      printHeader $0
      return 1
    fi
    
    if [ -n "${configure}" ]; then
      
      create_edjanger_properties ${configure}
    
    elif [ -n "${save}" ]; then
      
      save_configuration ${name}
      
    elif [ -n "${list}" ]; then
      
      print_template_list false
      
    elif [ -n "${listinfo}" ]; then
      
      print_template_list true
      
    elif [ -n "${create}" ]; then

      init_new_template ${name}
      
    elif [ -n "${delete}" ]; then

      delete_template ${name}
      
    fi
    
  fi
}

[[ -n "$@" ]]                      && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                   && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                   && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")

main_template $externaloptions
