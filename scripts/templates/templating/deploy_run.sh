#/bin/bash
export PATH=$PATH:{edjangerpath}

mode=$1
step=$2

function usage(){
  echo "usage: $0 <configuration name> <step index to run>"
  echo "run must have following arguments:"
  echo "  - configuration name : \"integration\" or \"production\""
  echo "  - step index         : index number of step(s) to run (5 max)"
  echo "    - 1: remove all edjanger.properties from web1/web2"
  echo "    - 2: generate edjanger.properties from template and properties"
  echo "    - 3: compare we1 and web2 configuration"
  echo "    - 4: generate docker-compose.yaml from edjanger.properties"
  echo "    - 5: run docker compose"
  return -1
}

if [ "$#" -ne 2 ] || [ -z "$mode" ] || ([ ! "$mode" = "production" ] && [ ! "$mode" = "integration" ]); then
  usage
else
  bitwise=$(($step / 1))
  if [ $bitwise -ge 0 ]; then
    echo "#1 cleaning edjanger.properties..."
    rm -f docker-compose.yaml
    rm -f web1/edjanger.properties
    rm -f web2/edjanger.properties
    rm -f web1/*.bak
    rm -f web2/*.bak
    rm -f edjanger.log
  fi

  bitwise=$(($step / 2))
  if [ $bitwise -ne 0 ]; then
    echo "#2 generate edjanger.properties from template and properties..."
    edjangertemplate properties=$mode 2>&1 | tee edjanger.log
    if [ -n "$(cat edjanger.log|grep ERR)" ]; then
      rm -f edjanger.log
      step=-1
    fi
  fi

  bitwise=$(($step / 3))
  if [ $bitwise -ne 0 ]; then
    echo "#3 compare web1 and web2 configuration..."
    ./diff_conf.sh 2>&1 | tee edjanger.log
    if [ -n "$(cat edjanger.log|grep ERR)" ]; then
      rm -f edjanger.log
      step=-1
    fi
  fi

  bitwise=$(($step / 4))
  if [ $bitwise -ne 0 ]; then
    echo "#4 generate docker-compose.yaml from edjanger.properties..."
    edjangercompose 2>&1 | tee edjanger.log
    if [ -n "$(cat edjanger.log|grep ERR)" ]; then
      rm -f edjanger.log
      step=-1
    fi
  fi

  bitwise=$(($step / 5))
  if [ $bitwise -ne 0 ]; then
    echo "#5 run docker compose"
    status=$(docker-compose ps|grep "web")
    if [ -n "$status" ]; then
      docker-compose -p "$mode" stop 2>&1 | tee edjanger.log
      if [ -n "$(cat edjanger.log|grep ERR)" ]; then
        rm -f edjanger.log
        step=-1
      fi
    fi
    docker-compose -p "$mode" rm 2>&1 | tee edjanger.log
    if [ -n "$(cat edjanger.log|grep ERR)" ]; then
      rm -f edjanger.log
      step=-1
    fi

    docker-compose -p "$mode" build 2>&1 | tee edjanger.log
    if [ -n "$(cat edjanger.log|grep ERR)" ]; then
      rm -f edjanger.log
      step=-1
    fi

    docker-compose -p "$mode" up 2>&1 | tee edjanger.log
    if [ -n "$(cat edjanger.log|grep ERR)" ]; then
      rm -f edjanger.log
      step=-1
    fi

    rm -f edjanger.log
  fi
fi
