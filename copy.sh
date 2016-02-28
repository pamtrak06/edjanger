# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------

function usage {
  echo "Arguments: <order from host to container (h), from container to host (c)> <path from h or c> <path from c or h>"$
  echo "If argument 1=h, arg2=filename from host,    arg3=container path"$
  echo "If argument 1=c, arg2=filename in container, arg3=host path"$
}

if [ ! -f edocker.cfg ]; then
  echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
else
  source edocker.cfg

  if [ -z "$1" ] && [ -z "$2" ] && [ -z "$3" ]; then
    usage
  else
    idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+0" | bc)
    if [ "$1" = "c" ]; then
      echo copy from container_name: ${container_name}_${idx} file $2 to host:$3...
      docker cp ${container_name}_${idx}:$2 $3
    elif [ "$1" = "h" ]; then
      echo copy file from host:$2 to container ${container_name}_${idx}:$3
      docker cp $2 ${container_name}_${idx}:$3
    else
      usage
    fi
  fi
fi

