#!/usr/bin/env bats
export PATH=$PATH:/usr/local/bin/edjanger

@test "edjanger init          : presence edjanger.properties" {
  TMP=tmp_edjangerinit
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  . ../../scripts/init.sh
  result="$(ls edjanger.properties)"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
}

@test "edjanger init          : presence build/Dockerfile" {
  TMP=tmp_edjangerinit
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  . ../../scripts/init.sh
  result="$(ls build/Dockerfile)"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
}

@test "edjanger build         : is image built" {
  TMP=tmp_edjangerinit
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  . ../../scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=edjanger.properties
  TMPP=edjanger.tmp
  sed -e "s/\(docker_command=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep image_name
  sed -e "s/\(container_name=\).*/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep container_name
  sed -e "s/\(exposed_ports=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep exposed_ports
  sed -e "s/\(shared_volumes=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep shared_volumes
  . ../../scripts/build.sh
  result="$(docker images | grep pamtrak06/webtest )"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
  docker rmi pamtrak06/webtest
}

@test "edjanger run           : is container running" {
  TMP=tmp_edjangerinit
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  . ../../scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=edjanger.properties
  TMPP=edjanger.tmp
  sed -e "s/\(docker_command=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep image_name
  sed -e "s/\(container_name=\).*/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep container_name
  sed -e "s/\(exposed_ports=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep exposed_ports
  sed -e "s/\(shared_volumes=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  . ../../scripts/build.sh
  . ../../scripts/run.sh
  result="$(docker ps | grep webtest_1 )"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
  docker stop $(docker ps -q --filter="name=webtest*")
  docker rm $(docker ps -aq --filter="name=webtest*")
  docker rmi pamtrak06/webtest
}

@test "edjanger run           : is port exposed" {
  skip
  TMP=tmp_edjangerinit
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  . ../../scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=edjanger.properties
  TMPP=edjanger.tmp
  sed -e "s/\(docker_command=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep image_name
  sed -e "s/\(container_name=\).*/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep container_name
  sed -e "s/\(exposed_ports\)=\.*/\1=85:80/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep exposed_ports
  sed -e "s/\(shared_volumes=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  . ../../scripts/build.sh
  . ../../scripts/run.sh
  ip=$(nslookup $(hostname) | grep Address | grep -v "#" | awk '{ printf $2}')
  result="$(curl $ip)"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
  docker stop $(docker ps -q --filter="name=webtest*")
  docker rm $(docker ps -aq --filter="name=webtest*")
  docker rmi pamtrak06/webtest
}

@test "edjanger exec          : is exec in container" {
  skip
  TMP=tmp_edjangerinit
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  . ../../scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=edjanger.properties
  TMPP=edjanger.tmp
  sed -e "s/\(docker_command=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep image_name
  sed -e "s/\(container_name=\).*/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep container_name
  sed -e "s/\(exposed_ports=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep exposed_ports
  sed -e "s/\(shared_volumes=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  . ../../scripts/build.sh
  . ../../scripts/run.sh
  . ../../scripts/exec.sh
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
  TMP=tmp_edjangerinit
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  . ../../scripts/init.sh
  echo "FROM httpd" > build/Dockerfile
  PROP=edjanger.properties
  TMPP=edjanger.tmp
  sed -e "s/\(docker_command=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep image_name
  sed -e "s/\(container_name=\).*/\1\"webtest\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep container_name
  sed -e "s/\(exposed_ports=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep exposed_ports
  sed -e "s/\(shared_volumes=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  . ../../scripts/build.sh
  . ../../scripts/run.sh
  result="$(docker ps | grep webtest_1 )"
  [ -n "$result" ]
  . ../../scripts/stop.sh
  result="$(docker ps --filter="status=exited" | grep webtest_1 )"
  [ -n "$result" ]
  . ../../scripts/start.sh
  result="$(docker ps --filter="status=running" | grep webtest_1 )"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
  docker stop $(docker ps -q --filter="name=webtest*")
  docker rm $(docker ps -aq --filter="name=webtest*")
  docker rmi pamtrak06/webtest
}
