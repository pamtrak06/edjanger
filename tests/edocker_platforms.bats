

@test "edocker @ubuntu       : cross platorm tests " {
  skip
  shopt -s expand_aliases
  . ../edocker.alias
  TMP=tmp_edockerinit
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  . ../../scripts/init.sh
  echo "FROM gitlab/dind" > build/Dockerfile
  echo "RUN apt-get -y update && apt-get install -y bc zip unzip wget curl git gettext" >> build/Dockerfile
  echo "WORKDIR /usr/local/bin" >> build/Dockerfile
  echo "RUN git clone https://github.com/pamtrak06/edocker.git" >> build/Dockerfile
  echo "WORKDIR /usr/local/bin/edocker" >> build/Dockerfile
  echo "RUN chmod 755 scripts/*.sh; chmod 755 edockerinstall.sh" >> build/Dockerfile
  echo "RUN ./edockerinstall.sh" >> build/Dockerfile
  echo "RUN git clone --branch=master https://github.com/sstephenson/bats.git /tmp/bats" >> build/Dockerfile
  echo "RUN cd /tmp/bats; ./install.sh /usr/local; rm -rf /tmp/bats" >> build/Dockerfile
  echo "CMD [ "run_tests.sh" ]" >> build/Dockerfile
  PROP=edocker.properties
  TMPP=edocker.tmp
  sed -e "s/\(docker_command=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edocker.properties | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/ubuntu14.04-edocker-tests\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edocker.properties | grep image_name
  sed -e "s/\(container_name=\).*/\1\"ubuntu14.04-edocker-tests\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edocker.properties | grep container_name
  sed -e "s/\(exposed_ports=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edocker.properties | grep exposed_ports
  sed -e "s/\(shared_volumes=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  . ../../scripts/build.sh
  . ../../scripts/run.sh
  result="$(docker ps | grep webtest_1 )"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
  docker stop $(docker ps -q --filter="name=ubuntu*")
  docker rm $(docker ps -aq --filter="name=ubuntu*")
  docker rmi pamtrak06/webtest
}
