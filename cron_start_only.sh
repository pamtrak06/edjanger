#!/bin/bash
#shopt -s expand_aliases
source {edockerpath}/edocker.alias

cur_path=$PWD

function start() {
  echo "path: $1"
  #start
  cmd=$(alias edockerstart|cut -d '=' -f2)
  cmd=${cmd//\'}
  cmd=${cmd#source}
  ( cd ${1} && bash $cmd )
  #ps
  cmd=$(alias edockerps|cut -d '=' -f2)
  cmd=${cmd//\'}
  cmd=${cmd#source}
  ( cd ${1} && bash $cmd )
}

if [ -n "$1" ] && [ -d "$1" ]; then
  for prop in $(find $1 -name edocker.properties); do
    active=$(cat $prop | grep -v "#" | grep "cron_start=true")
    if  [ -n "$active" ]; then
      dock_path=$(dirname $prop)
      start "$dock_path"
    fi
  done
else
  echo "ERROR: argument must be path of edocker.properties files"
fi
