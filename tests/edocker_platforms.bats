#!/usr/bin/env bats
export PATH=$PATH:/usr/local/bin/edjanger

@test "edjanger @ubuntu       : cross platorm tests " {
  skip
  TMP=tmp_edjangerinit
  rm -rf $TMP &&  mkdir $TMP && cd $TMP
  . ../../scripts/init.sh
  echo "FROM pamtrak06/edjanger-dind-ubuntu14.04" > build/Dockerfile
  PROP=edjanger.properties
  TMPP=edjanger.tmp
  sed -e "s/\(docker_command=\.*\)/#\1/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep docker_command
  sed -e "s/\(image_name=\).*/\1\"pamtrak06\/ubuntu14.04-edjanger-tests\"/" $PROP > $TMPP && mv $TMPP $PROP
  cat edjanger.properties | grep image_name
  sed -e "s/\(container_name=\).*/\1\"ubuntu14.04-edjanger-tests\"/" $PROP > $TMPP && mv $TMPP $PROP
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
  docker stop $(docker ps -q --filter="name=ubuntu*")
  docker rm $(docker ps -aq --filter="name=ubuntu*")
  docker rmi pamtrak06/webtest
}
