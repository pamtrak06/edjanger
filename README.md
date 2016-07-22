# edocker
Scripts for easyest docker commands in a docker working folder (Dockerfile)

Tired about repeating docker commands with long parameters ?

Try edocker !

## How to install edocker
```bash
git clone https://github.com/pamtrak06/edocker.git
cd edocker; chmod 755 *.sh; chmod 755 edockerinstall
```

Run edocker installation
```bash
./edockerinstall
```

Execute the generated alias file:
```bash
source edocker.alias
```

All is done !!! Run this command to see your edocker aliases
```bash
alias|grep edocker
```

Recommanded: add edocker alias activation in your bash sessions:
```bash
echo "source [edocker path]/edocker.alias" >> ~/.bashrc
```

Tips: remove edocker aliases by executing:
```bash
source edocker.unalias
```

## How to activate edocker for a project

Copy the edocker.properties model in your working docker folder:
```bash
edockerinit
```
Equivalent to
```bash
cp [edocker path]/edocker_template.properties [your docker working project]/edocker.properties
```

Configure your [edocker.properties](https://github.com/pamtrak06/edocker/blob/master/edocker_template.properties) with correct parameters.
By example, you could create a Dockerfile with this path:
```bash
vi [your docker working project]/build/Dockerfile
```
Example of a minimal edocker configuration:
```bash
mkdir -p elk/build
cd elk; edockerinit
vi edocker.properties
```
```bash
#  ----------------------------------------------------
#  The MIT License (MIT)
#
#  Copyright (c) 2016 copyright pamtrak06@gmail.com
#  ----------------------------------------------------
#  CONFIGURATION    : edocker_template.properties
#  DESCRIPTION      : project configuration file for edocker
#  CREATOR          : pamtrak06@gmail.com
#  --------------------------------
#  VERSION          : 1.0
#  DATE             : 2016-03-02
#  COMMENT          : creation
#  --------------------------------
#  USAGE            : read by edocker scripts
#  ----------------------------------------------------
# docker_command:show docker command when edocker is used
docker_command=true
# image_name:image name
image_name="pamtrak06/elk"
# build_path:path where is found Dockerfile
build_path=build
# build_args:build arguments
# build_args="--build-arg VAR1='value1' --build-arg VAR2='value2'"
# build_forcerm:always remove intermediate containers
# build_forcerm="--force-rm"
# build_rm: Remove intermediate containers after a successful build
# build_rm="--rm=true"
# build_nocache:do not use cache when building the image
# build_nocache="--no-cache"
# build_file:name of the Dockerfile (Default is 'PATH/Dockerfile')
# build_file="--file Dockerfile"
# container_name:container
container_name="elk"
# exposed_ports:exposed port
exposed_ports="-p 32000:80"
# shared_volumes:shared volumes
# shared_volumes="-v <host path>:<container path>"
# volumes_from:expose volumes from another container into current container
# volumes_from="--volumes-from <container name with exposed volumes>"
# environment_variables:environnment variables
# environment_variables="-e <variable name 1>=<value 1> -e <variable name 2>=<value 2>"
# linked_containers:linked container
# linked_containers="--link <external container name>:<alias in container>"
# force_rmi:force deletion
# force_rmi="--force"
# command_run:bash command(s) to run
# command_run="/bin/bash -c \"cd /; ls -la"
```
```bash
touch build/Dockerfile
echo "FROM willdurand/docker-elk" > build/Dockerfile
```

## How to use edocker in a docker a project working directory
Now you've got aliases to run all your docker commands like:
- edockeralias
- edockerbuild
- edockercheck
- edockerclean
- edockercopy
- edockerexec
- edockerhelp
- edockerimages
- edockerinit
- edockerinspect
- edockerlogs
- edockerportdesc
- edockerport
- edockerps
- edockerpsa
- edockerrename
- edockerrestart
- edockerrm
- edockerrmi
- edockerrun
- edockerruni
- edockerstart
- edockerstats
- edockerstop
- edockertag
- edockertop
- edockerunalias

!!! All thoses aliases are available only when you've got an [edocker.properties](https://github.com/pamtrak06/edocker/blob/master/edocker_template.properties) file in your project folder ([docker working project]) '''

For each commands, see edockerhelp 'command' for list of parameters read in edocker.properties and arguments.

### #alias edockeralias
Description : print edocker aliases.

### #alias edockerbuild
Description : run command "docker build" with parameters readed from local edocker.properties.

### #alias edockercheck
Description : check missing parameters in edocker.properties.
Remark : even when parameters are missing in edocker.properties, they are initialized empty.

### #alias edockerclean
Description : clean all images with none attribute (run docker rmi with "none" filter)

### #alias edockercopy
Description : run command "docker copy" with parameters readed from local edocker.properties

### #alias edockerexec
Description : run command "docker exec" with parameters readed from local edocker.properties

### #alias edockerhelp
Description : help script for edocker command

### #alias edockerimages
Description : run command "docker images" with parameters readed from local edocker.properties

### #alias edockerinit
Description : create a edocker.properties file

### #alias edockerinspect
Description : run command "docker inspect" with parameters readed from local edocker.properties

### #alias edockerlogs
Description : run command "docker logs" with parameters readed from local edocker.properties

### #alias edockerportdesc
Description : run command "docker ports" on all running container

### #alias edockerports
Description : description of port

### #alias edockerps
Description : run command "docker ps" with parameters readed from local edocker.properties

### #alias edockerpsa
Description : run command "docker ps -a" with parameters readed from local edocker.properties

### #alias edockerrename
Description : run command "docker rename" with parameters readed from local edocker.properties

### #alias edockerrestart
Description : run command "docker restart" with parameters readed from local edocker.properties

### #alias edockerm
Description : run command "docker rm" with parameters readed from local edocker.properties

### #alias edockermexiteds
Description : run docker rm with list of container with exited status

### #alias edockermi
Description : run command "docker rmi" with parameters readed from local edocker.properties

### #alias edockerun
Description : run command "docker run -id" daemon mode, with parameters readed from local edocker.properties

### #alias edockeruni
Description : run command "docker run -it" interactive mode, with parameters readed from local edocker.properties

### #alias edockestart
Description : run command "docker start" with parameters readed from local edocker.properties

### #alias edockestop
Description : run command "docker stop" with parameters readed from local edocker.properties

### #alias edockertag
Description : run command "docker tag" with parameters readed from local edocker.properties

### #alias edockertop
Description : run command "docker top" with parameters readed from local edocker.properties

### #alias edockerunalias
Description : help script for edocker command

## Tips
Create those two aliases and give the correct path for your project:
```bash
alias cdedocker='cd [edocker path]'
alias cd[basename for your docker working project]='cd [your docker working project]'
```
Or create all possible aliases for subfolders in a folder:
```bash
source /usr/local/edocker/_common.sh
source $(buildPathAliases "/opt/docker/")
```
Check missing parameters in edocker.properties
```bash
edockercheck
Check edocker.properties...
  - check "docker_command"
  - check "image_name"
  - check "build_path"
  - check "build_args"
    WARNING: parameter is missing !!!
  - check "build_forcerm"
    WARNING: parameter is missing !!!
  - check "build_rm"
    WARNING: parameter is missing !!!
  - check "build_nocache"
    WARNING: parameter is missing !!!
  - check "build_file"
    WARNING: parameter is missing !!!
  - check "container_name"
  - check "exposed_ports"
  - check "shared_volumes"
    WARNING: parameter is missing !!!
  - check "volumes_from"
    WARNING: parameter is missing !!!
  - check "environment_variables"
    WARNING: parameter is missing !!!
  - check "linked_containers"
    WARNING: parameter is missing !!!
  - check "force_rmi"
    WARNING: parameter is missing !!!
  - check "command_run"
    WARNING: parameter is missing !!!
  => STATUS of configuration is: some parameters are undefined
```
Help commands
```bash
edockerhelp
```
Help for help
```bash
edockerhelp help
```
Help for commands, example for edockerbuild
```bash
edockerhelp build
```
Help for parameters in edocker.properties used by commands
```bash
edockerhelp config
```

## Work in progress
Please contribute !

- daemon               => TO BE Implemented
- attach               => TO BE Implemented
- build                => OK
- clean                => OK
- commit               => TO BE Implemented
- cp                   => OK
- create               => TO BE Implemented
- diff                 => TO BE Implemented
- events               => TO BE Implemented
- exec                 => OK
- export               => TO BE Implemented
- help                 => OK
- history              => TO BE Implemented
- images               => OK
- import               => TO BE Implemented
- info                 => TO BE Implemented
- init                 => OK
- inspect              => OK
- kill                 => TO BE Implemented
- load                 => TO BE Implemented
- login                => TO BE Implemented
- logout               => TO BE Implemented
- logs                 => OK
- network connect      => TO BE Implemented
- network create       => TO BE Implemented
- network disconnect   => TO BE Implemented
- network inspect      => TO BE Implemented
- network ls           => TO BE Implemented
- network rm           => TO BE Implemented
- pause                => TO BE Implemented
- port                 => OK
- ps                   => OK
- pull                 => TO BE Implemented
- push                 => TO BE Implemented
- rename               => OK
- restart              => OK
- rm                   => OK
- rmi                  => OK
- run                  => OK
- save                 => TO BE Implemented
- search               => TO BE Implemented ?
- start                => OK
- stats                => OK
- stop                 => OK
- tag                  => OK
- top                  => OK
- unpause              => TO BE Implemented
- update               => TO BE Implemented ?
- version              => TO BE Implemented ?
- volume create        => TO BE Implemented
- volume inspect       => TO BE Implemented
- volume ls            => TO BE Implemented
- volume rm            => TO BE Implemented
- wait                 => TO BE Implemented

## License
edocker is under  "MIT License (MIT)" see [LICENSE file](https://github.com/pamtrak06/edocker/blob/master/LICENSE).
