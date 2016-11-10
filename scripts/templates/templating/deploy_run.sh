#/bin/bash
shopt -s expand_aliases
source {edockerpath}/../edocker.alias

mode=$1

function usage(){
  echo "run must have argument one of integration or production"
  exit -1
}

if [ -z "$mode" ]; then
  usage
fi

if [ ! "$mode" = "production" ] && [ ! "$mode" = "integration" ]; then
  usage
fi

echo "cleaning edocker.properties..."
rm -f web*/edocker.properties
rm -f web*/*.bak

echo "generate edocker.properties from template and production properties..."
edockertemplate $mode

echo "compare we1 and web2 configuration"
./diff_conf.sh

echo "generate docker-compose.yaml from edocker.properties"
edockercompose

echo "run docker compose"
docker-compose stop -p "$mode"
docker-compose build -p "$mode"
docker-compose up -p "$mode"
