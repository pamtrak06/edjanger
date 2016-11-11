#/bin/bash
shopt -s expand_aliases
source {edockerpath}/../edocker.alias

mode=$1
step=$2

function usage(){
  echo "usage: $0 <configuration name> <step index to run>"
  echo "run must have following arguments:"
  echo "  - configuration name : \"integration\" or \"production\""
  echo "  - step index         : index number of step(s) to run (5 max)"
  echo "    - 1: remove all edocker.properties from web1/web2"
  echo "    - 2: generate edocker.properties from template and properties"
  echo "    - 3: compare we1 and web2 configuration"
  echo "    - 4: generate docker-compose.yaml from edocker.properties"
  echo "    - 5: run docker compose"
  return -1
}

if [ "$#" -ne 2 ]; then
  usage
fi

if [ -z "$mode" ]; then
  usage
fi

if [ ! "$mode" = "production" ] && [ ! "$mode" = "integration" ]; then
  usage
fi

bitwise=$(echo "$step / 1" |bc)
if [ $bitwise -ge 0 ]; then
  echo "#1 cleaning edocker.properties..."
  rm -f docker-compose.yaml
  rm -f web1/edocker.properties
  rm -f web2/edocker.properties
  rm -f web1/*.bak
  rm -f web2/*.bak
  rm -f edocker.log
fi

bitwise=$(echo "$step / 2" |bc)
if [ $bitwise -ne 0 ]; then
  echo "#2 generate edocker.properties from template and properties..."
  edockertemplate properties=$mode 2>&1 | tee edocker.log
  if [ -n "$(cat edocker.log|grep ERR)" ]; then
    rm -f edocker.log
    return -1
  fi
fi

bitwise=$(echo "$step / 3" |bc)
if [ $bitwise -ne 0 ]; then
  echo "#3 compare we1 and web2 configuration..."
  ./diff_conf.sh 2>&1 | tee edocker.log
  if [ -n "$(cat edocker.log|grep ERR)" ]; then
    rm -f edocker.log
    return -1
  fi
fi

bitwise=$(echo "$step / 4" |bc)
if [ $bitwise -ne 0 ]; then
  echo "#4 generate docker-compose.yaml from edocker.properties..."
  edockercompose 2>&1 | tee edocker.log
  if [ -n "$(cat edocker.log|grep ERR)" ]; then
    rm -f edocker.log
    return -1
  fi
fi

bitwise=$(echo "$step / 5" |bc)
if [ $bitwise -ne 0 ]; then
  echo "#5 run docker compose"
  status=$(docker-compose ps|grep "web")
  if [ -n "$status" ]; then
    docker-compose -p "$mode" stop 2>&1 | tee edocker.log
    if [ -n "$(cat edocker.log|grep ERR)" ]; then
      rm -f edocker.log
      return -1
    fi
  fi
  docker-compose -p "$mode" rm 2>&1 | tee edocker.log
  if [ -n "$(cat edocker.log|grep ERR)" ]; then
    rm -f edocker.log
    return -1
  fi

  docker-compose -p "$mode" build 2>&1 | tee edocker.log
  if [ -n "$(cat edocker.log|grep ERR)" ]; then
    rm -f edocker.log
    return -1
  fi

  docker-compose -p "$mode" up 2>&1 | tee edocker.log
  if [ -n "$(cat edocker.log|grep ERR)" ]; then
    rm -f edocker.log
    return -1
  fi

  rm -f edocker.log
fi
