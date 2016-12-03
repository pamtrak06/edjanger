#!/usr/bin/env bats
export PATH=$PATH:/usr/local/bin/edjanger

@test "edjanger init          : presence edjanger.properties" {
  TMP=tmp_workspace
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  bash ../../scripts/init.sh
  result="$(ls edjanger.properties)"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
}

@test "edjanger init          : presence edjanger.template" {
  TMP=tmp_workspace
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  bash ../../scripts/init.sh
  result="$(ls edjanger.template)"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
}

@test "edjanger init          : presence configuration.properties" {
  TMP=tmp_workspace
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  bash ../../scripts/init.sh
  result="$(ls configuration.properties)"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
}

@test "edjanger init          : presence build/Dockerfile" {
  TMP=tmp_workspace
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  bash ../../scripts/init.sh
  result="$(ls build/Dockerfile)"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
}

@test "edjanger build         : is image built" {
  TMP=tmp_workspace
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  bash ../../scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=edjanger.properties
  TMPP=edjanger.tmp
  sed -e "s/\(docker_command=\.*\)/\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep image_name
  sed -e "s/\(container_name=\).*/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep container_name
  cat $PROP | grep -v "#container_hostname:" | grep container_hostname
  sed -e "s/\(container_privilege=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_privilege:" | grep container_privilege
  sed -e "s/\(container_remove=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_remove:" | grep container_remove
  sed -e "s/\(container_addhost=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_addhost:" | grep container_addhost
  sed -e "s/\(exposed_ports=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#exposed_ports:" | grep exposed_ports
  sed -e "s/\(shared_volumes=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#shared_volumes:" | grep shared_volumes
  sed -e "s/\(volumes_from=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#volumes_from:" | grep volumes_from
  sed -e "s/\(linked_containers=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#linked_containers:" | grep linked_containers
  bash ../../scripts/build.sh
  result="$(docker images | grep pamtrak06/webtest)"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
  docker rmi pamtrak06/webtest
}

@test "edjanger run           : is container running" {
  TMP=tmp_workspace
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  bash ../../scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=edjanger.properties
  TMPP=edjanger.tmp
  sed -e "s/\(docker_command=\.*\)/\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep image_name
  sed -e "s/\(container_name=\).*/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep container_name
  sed -e "s/\(container_hostname=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_hostname:" | grep container_hostname
  sed -e "s/\(container_privilege=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_privilege:" | grep container_privilege
  sed -e "s/\(container_remove=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_remove:" | grep container_remove
  sed -e "s/\(container_addhost=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_addhost:" | grep container_addhost
  sed -e "s/\(exposed_ports=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#exposed_ports:" | grep exposed_ports
  sed -e "s/\(shared_volumes=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#shared_volumes:" | grep shared_volumes
  sed -e "s/\(environment_variables=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#environment_variables:" | grep environment_variables
  sed -e "s/\(volumes_from=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#volumes_from:" | grep volumes_from
  sed -e "s/\(linked_containers=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#linked_containers:" | grep linked_containers
  bash ../../scripts/build.sh
  bash ../../scripts/run.sh
  result="$(docker ps | grep webtest_1 )"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
  docker stop $(docker ps -q --filter="name=webtest*")
  docker rm $(docker ps -aq --filter="name=webtest*")
  docker rmi pamtrak06/webtest
}

@test "edjanger run           : is port exposed" {
  TMP=tmp_workspace
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  bash ../../scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=edjanger.properties
  TMPP=edjanger.tmp
  sed -e "s/\(docker_command=\.*\)/\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep image_name
  sed -e "s/\(container_name=\).*/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep container_name
  sed -e "s/\(container_hostname=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_hostname:" | grep container_hostname
  sed -e "s/\(container_privilege=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_privilege:" | grep container_privilege
  sed -e "s/\(container_remove=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_remove:" | grep container_remove
  sed -e "s/\(container_addhost=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_addhost:" | grep container_addhost
  sed -e "s/\(exposed_ports=\).*/\1\"-p 85:80\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep exposed_ports
  sed -e "s/\(shared_volumes=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#shared_volumes:" | grep shared_volumes
  sed -e "s/\(environment_variables=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#environment_variables:" | grep environment_variables
  sed -e "s/\(volumes_from=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#volumes_from:" | grep volumes_from
  sed -e "s/\(linked_containers=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#linked_containers:" | grep linked_containers
  bash ../../scripts/build.sh
  bash ../../scripts/run.sh
  # TODO to be improved by network commands
  #ip=$(nslookup $(hostname) | grep Address | grep -v "#" | awk '{ printf $2}')
  #result="$(curl $ip)"
  result=$(docker ps -a|grep webtest_1|grep 85)
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
  docker stop $(docker ps -q --filter="name=webtest*")
  docker rm $(docker ps -aq --filter="name=webtest*")
  docker rmi pamtrak06/webtest
}

@test "edjanger exec          : is exec in container" {
  skip
  TMP=tmp_workspace
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  bash ../../scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=edjanger.properties
  TMPP=edjanger.tmp
  sed -e "s/\(docker_command=\.*\)/\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep image_name
  sed -e "s/\(container_name=\).*/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep container_name
  sed -e "s/\(container_hostname=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_hostname:" | grep container_hostname
  sed -e "s/\(container_privilege=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_privilege:" | grep container_privilege
  sed -e "s/\(container_remove=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_remove:" | grep container_remove
  sed -e "s/\(container_addhost=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_addhost:" | grep container_addhost
  sed -e "s/\(exposed_ports=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#exposed_ports:" | grep exposed_ports
  sed -e "s/\(shared_volumes=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#shared_volumes:" | grep shared_volumes
  sed -e "s/\(environment_variables=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#environment_variables:" | grep environment_variables
  sed -e "s/\(volumes_from=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#volumes_from:" | grep volumes_from
  sed -e "s/\(linked_containers=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#linked_containers:" | grep linked_containers
  bash ../../scripts/build.sh
  bash ../../scripts/run.sh
  bash ../../scripts/exec.sh
  result="$(uname -r)"
  exit
  [[ "$result" == *"docker"* ]]
  cd ..
  rm -rf $TMP
  docker stop $(docker ps -q --filter="name=webtest*")
  docker rm $(docker ps -aq --filter="name=webtest*")
  docker rmi pamtrak06/webtest
}

@test "edjanger start/stop    : start/stop container" {
  TMP=tmp_workspace
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  bash ../../scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=edjanger.properties
  TMPP=edjanger.tmp
  sed -e "s/\(docker_command=\.*\)/\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep image_name
  sed -e "s/\(container_name=\).*/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep container_name
  sed -e "s/\(container_hostname=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_hostname:" | grep container_hostname
  sed -e "s/\(container_privilege=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_privilege:" | grep container_privilege
  sed -e "s/\(container_remove=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_remove:" | grep container_remove
  sed -e "s/\(container_addhost=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#container_addhost:" | grep container_addhost
  sed -e "s/\(exposed_ports=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep exposed_ports
  sed -e "s/\(shared_volumes=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep shared_volumes
  sed -e "s/\(environment_variables=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#environment_variables:" | grep environment_variables
  sed -e "s/\(volumes_from=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#volumes_from:" | grep volumes_from
  sed -e "s/\(linked_containers=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#linked_containers:" | grep linked_containers
  bash ../../scripts/build.sh
  bash ../../scripts/run.sh
  result="$(docker ps | grep webtest_1 )"
  [ -n "$result" ]
  bash ../../scripts/stop.sh
  result="$(docker ps --filter="status=exited" | grep webtest_1 )"
  [ -n "$result" ]
  bash ../../scripts/start.sh
  result="$(docker ps --filter="status=running" | grep webtest_1 )"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
  docker stop $(docker ps -q --filter="name=webtest*")
  docker rm $(docker ps -aq --filter="name=webtest*")
  docker rmi pamtrak06/webtest
}

@test "edjanger template      : create edjanger.properties from a properties and a template" {
  TMP=tmp_workspace
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  bash ../../scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=configuration.properties
  TMPP=configuration.tmp
  sed -e "s/\(export app_docker_command=\".*\"\)/\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep app_docker_command
  sed -e "s/\(export app_image_name=\)\".*\"/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep app_image_name
  sed -e "s/\(export app_container_name=\)\".*\"/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep app_container_name
  sed -e "s/\(export app_exposed_ports=\)\".*\"/\1\"-p 80:80 -p 443:443\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep app_exposed_ports
  sed -e "s/\(export app_shared_volumes=\)\".*\"/\1\"-v \$PWD\/volumes\/html:\/var\/www\/html -v \$PWD\/volumes\/logs:\/var\/logs\/apache2\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep app_shared_volumes
  sed -e "s/\(export app_environment_variables=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#environment_variables:" | grep app_environment_variables
  yes | bash ../../scripts/template.sh properties=configuration
  bash ../../scripts/build.sh
  bash ../../scripts/run.sh
  result="$(docker ps | grep webtest_1 )"
  [ -n "$result" ]
  result="$(docker port grep webtest_1 | tr '\n' ' ' )"
  [ -n "$result" == *"80/tcp -> 0.0.0.0:80"* ] && [ -n "$result" == *"443/tcp -> 0.0.0.0:443"* ]
  cd ..
  rm -rf $TMP
  docker stop $(docker ps -q --filter="name=webtest*")
  docker rm $(docker ps -aq --filter="name=webtest*")
  docker rmi pamtrak06/webtest
}

@test "edjanger compose       : create docker-compose.yaml from all edjanger.properties" {
  ROOTDIR=$(pwd)/..
  
  TMP=$PWD/tmp_workspace
  rm -rf $TMP &&  mkdir $TMP && cd $TMP

  WEB=web && rm -rf $WEB &&  mkdir $WEB && cd $WEB
  bash $ROOTDIR/scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=configuration.properties
  TMPP=configuration.tmp
  sed -e "s/\(export app_docker_command=\".*\"\)/\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep app_docker_command
  sed -e "s/\(export app_image_name=\)\".*\"/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep app_image_name
  sed -e "s/\(export app_container_name=\)\".*\"/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep app_container_name
  sed -e "s/\(export app_exposed_ports=\)\".*\"/\1\"-p 80:80 -p 443:443\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep app_exposed_ports
  sed -e "s/\(export app_shared_volumes=\)\".*\"/\1\"-v \$PWD\/volumes\/html:\/var\/www\/html -v \$PWD\/volumes\/logs:\/var\/logs\/apache2\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep app_shared_volumes
  sed -e "s/\(export app_environment_variables=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#environment_variables:" | grep app_environment_variables
  
  yes | bash $ROOTDIR/scripts/template.sh properties=configuration

  cd $TMP
  
  NDE=node && rm -rf $NDE &&  mkdir $NDE && cd $NDE
  bash $ROOTDIR/scripts/init.sh

  echo "{" > build/package.json
  echo "  \"name\": \"docker_web_app\"," >> build/package.json
  echo "  \"version\": \"1.0.0\"," >> build/package.json
  echo "  \"description\": \"Node.js on Docker\"," >> build/package.json
  echo "  \"author\": \"First Last <first.last@example.com>\"," >> build/package.json
  echo "  \"main\": \"server.js\"," >> build/package.json
  echo "  \"scripts\": {" >> build/package.json
  echo "    \"start\": \"node server.js\"" >> build/package.json
  echo "    }," >> build/package.json
  echo "    \"dependencies\": {" >> build/package.json
  echo "      \"express\": \"^4.13.3\"" >> build/package.json
  echo "    }" >> build/package.json
  echo "  }" >> build/package.json
  
  echo "'use strict';" > build/server.js
  echo "" >> build/server.js
  echo "const express = require('express');" >> build/server.js
  echo "" >> build/server.js
  echo "// Constants" >> build/server.js
  echo "const PORT = 8080;" >> build/server.js
  echo "" >> build/server.js
  echo "// App" >> build/server.js
  echo "const app = express();" >> build/server.js
  echo "app.get('/', function (req, res) {" >> build/server.js
  echo "  res.send('Hello world\n');" >> build/server.js
  echo "});" >> build/server.js
  echo "" >> build/server.js
  echo "app.listen(PORT);" >> build/server.js
  echo "console.log('Running on http://localhost:' + PORT);" >> build/server.js
  
  echo "FROM node:argon" > build/Dockerfile
  echo "RUN mkdir -p /usr/src/app" >> build/Dockerfile
  echo "WORKDIR /usr/src/app" >> build/Dockerfile
  echo "COPY package.json /usr/src/app/" >> build/Dockerfile
  echo "RUN npm install" >> build/Dockerfile
  echo "COPY . /usr/src/app" >> build/Dockerfile
  echo "EXPOSE 8080" >> build/Dockerfile
  echo "CMD [ \"npm\", \"start\" ]" >> build/Dockerfile
  
  echo "node_modules" > build/.dockerignore
  echo "npm-debug.log" >> build/.dockerignore

  PROP=configuration.properties
  TMPP=configuration.tmp
  sed -e "s/\(export app_docker_command=\".*\"\)/\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep app_docker_command
  sed -e "s/\(export app_image_name=\)\".*\"/\1\"pamtrak06\/nodetest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep app_image_name
  sed -e "s/\(export app_container_name=\)\".*\"/\1\"nodetest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#" | grep app_container_name
  sed -e "s/\(export app_exposed_ports=\)\".*\"/\1\"-p 8080:8080\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep app_exposed_ports
  sed -e "s/\(export app_shared_volumes=\)\".*\"/\1\"-v \$PWD\/volumes\/app:\/usr\/src\/app\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep app_shared_volumes
  sed -e "s/\(export app_environment_variables=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat $PROP | grep -v "#environment_variables:" | grep app_environment_variables
  
  yes | bash $ROOTDIR/scripts/template.sh properties=configuration
  
  cd $TMP
  yes | bash $ROOTDIR/scripts/compose.sh
  [ -f "docker-compose.yaml" ]
  docker-compose build
  docker-compose up
  
  result="$(docker ps | grep webtest_1 )"
  [ -n "$result" ]
  
  result="$(docker port grep webtest_1 | tr '\n' ' ' )"
  [ -n "$result" == *"80/tcp -> 0.0.0.0:80"* ] && [ -n "$result" == *"443/tcp -> 0.0.0.0:443"* ]
  
  result="$(docker ps | grep nodetest_1 )"
  [ -n "$result" ]
  
  result="$(docker port grep nodetest_1 | tr '\n' ' ' )"
  [ -n "$result" == *"8080/tcp -> 0.0.0.0:8080"* ]
  
  docker-compose stop
  docker-compose rm
  
  cd $ROOTDIR
  #rm -rf $TMP
  #docker rmi pamtrak06/webtest
  #docker rmi pamtrak06/nodetest
}
