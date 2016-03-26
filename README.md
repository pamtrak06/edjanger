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

Copy the edocker.cfg model in your working docker folder:
```bash
edockerinit 
```
Equivalent to 
```bash
cp [edocker path]/edocker.cfg.sample [your docker working project]/edocker.cfg
```

Configure your [edocker.cfg](https://github.com/pamtrak06/edocker/blob/master/edocker.cfg.sample) with correct parameters.
By example, you could create a Dockerfile with this path:
```bash
vi [your docker working project]/build/Dockerfile
```
Example of a minimal edocker configuration:
```bash
mkdir -p elk/build
cd elk; edockerinit
vi edocker.cfg
```
```bash
&#35; ----------------------------------------------------
&#35; The MIT License (MIT)
&#35;
&#35; Copyright (c) 2016 copyright pamtrak06@gmail.com
&#35; ----------------------------------------------------
&#35; CONFIGURATION    : edocker.cfg.sample
&#35; DESCRIPTION      : project configuration file for edocker
&#35; CREATOR          : pamtrak06@gmail.com
&#35; --------------------------------
&#35; VERSION          : 1.0
&#35; DATE             : 2016-03-02
&#35; COMMENT          : creation
&#35; --------------------------------
&#35; USAGE            : read by edocker scripts
&#35; ----------------------------------------------------
&#35;docker_command:show docker command when edocker is used
docker_command=true
&#35;image_name:image name
image_name="pamtrak06/elk"
&#35;build_path:path where is found Dockerfile
build_path=build
&#35;build_args:build arguments
&#35;build_args="--build-arg VAR1='value1' --build-arg VAR2='value2'"
&#35;build_forcerm:always remove intermediate containers
&#35;build_forcerm="--force-rm"
&#35;build_rm: Remove intermediate containers after a successful build
&#35;build_rm="--rm=true"
&#35;build_nocache:do not use cache when building the image
&#35;build_nocache="--no-cache"
&#35;build_file:name of the Dockerfile (Default is 'PATH/Dockerfile')
&#35;build_file="--file Dockerfile"
&#35;container_name:container
container_name="elk"
&#35;exposed_ports:exposed port
exposed_ports="-p 32000:80"
&#35;shared_volumes:shared volumes
&#35;shared_volumes="-v <host path>:<container path>"
&#35;volumes_from:expose volumes from another container into current container
&#35;volumes_from="--volumes-from <container name with exposed volumes>"
&#35;environment_variables:environnment variables
&#35;environment_variables="-e <variable name 1>=<value 1> -e <variable name 2>=<value 2>"
&#35;linked_containers:linked container
&#35;linked_containers="--link <external container name>:<alias in container>"
&#35;force_rmi:force deletion
&#35;force_rmi="--force"
&#35;command_run:bash command(s) to run
&#35;command_run="/bin/bash -c \"cd /; ls -la"
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

!!! All thoses aliases are available only when you've got an [edocker.cfg](https://github.com/pamtrak06/edocker/blob/master/edocker.cfg.sample) file in your project folder ([docker working project]) '''

For each commands, see edockerhelp 'command' for list of parameters read in edocker.cfg and arguments.

### #alias edockeralias
Description : print edocker aliases.

### #alias edockerbuild
Description : run command "docker build" with parameters readed from local edocker.cfg.

### #alias edockercheck
Description : check missing parameters in edocker.cfg.
Remark : even when parameters are missing in edocker.cfg, they are initialized empty.

### #alias edockerclean
Description : clean all images with none attribute (run docker rmi with "none" filter)

### #alias edockercopy
Description : run command "docker copy" with parameters readed from local edocker.cfg

### #alias edockerexec
Description : run command "docker exec" with parameters readed from local edocker.cfg

### #alias edockerhelp
Description : help script for edocker command

### #alias edockerimages
Description : run command "docker images" with parameters readed from local edocker.cfg

### #alias edockerinit
Description : create a edocker.cfg file

### #alias edockerinspect
Description : run command "docker inspect" with parameters readed from local edocker.cfg

### #alias edockerlogs
Description : run command "docker logs" with parameters readed from local edocker.cfg

### #alias edockerportdesc
Description : run command "docker ports" on all running container

### #alias edockerports
Description : description of port

### #alias edockerps
Description : run command "docker ps" with parameters readed from local edocker.cfg

### #alias edockerpsa
Description : run command "docker ps -a" with parameters readed from local edocker.cfg

### #alias edockerrename
Description : run command "docker rename" with parameters readed from local edocker.cfg

### #alias edockerrestart
Description : run command "docker restart" with parameters readed from local edocker.cfg

### #alias edockerm
Description : run command "docker rm" with parameters readed from local edocker.cfg
 
### #alias edockermi
Description : run command "docker rmi" with parameters readed from local edocker.cfg

### #alias edockerun
Description : run command "docker run -id" daemon mode, with parameters readed from local edocker.cfg

### #alias edockeruni
Description : run command "docker run -it" interactive mode, with parameters readed from local edocker.cfg

### #alias edockestart
Description : run command "docker start" with parameters readed from local edocker.cfg

### #alias edockestop
Description : run command "docker stop" with parameters readed from local edocker.cfg

### #alias edockertag
Description : run command "docker tag" with parameters readed from local edocker.cfg

### #alias edockertop
Description : run command "docker top" with parameters readed from local edocker.cfg

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
Check missing parameters in edocker.cfg
```bash
edockercheck
Check edocker.cfg...
  - check "docker_command"
  - check "image_name"
  - check "build_path"
  - check "build_args"
    ERROR: parameter is missing !!!
  - check "build_forcerm"
    ERROR: parameter is missing !!!
  - check "build_rm"
    ERROR: parameter is missing !!!
  - check "build_nocache"
    ERROR: parameter is missing !!!
  - check "build_file"
    ERROR: parameter is missing !!!
  - check "container_name"
  - check "exposed_ports"
  - check "shared_volumes"
    ERROR: parameter is missing !!!
  - check "volumes_from"
    ERROR: parameter is missing !!!
  - check "environment_variables"
    ERROR: parameter is missing !!!
  - check "linked_containers"
    ERROR: parameter is missing !!!
  - check "force_rmi"
    ERROR: parameter is missing !!!
  - check "command_run"
    ERROR: parameter is missing !!!
  -> configuration is NOK
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
Help for parameters in edocker.cfg used by commands
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
