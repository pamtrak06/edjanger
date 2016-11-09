[Web site official home page](http://pamtrak06.github.io/edocker/)

# Table of content
- [Presentation](#presentation)
- [How to install edocker](#how-to-install-edocker)
- [How to uninstall edocker](#how-to-uninstall-edocker)
- [How to initialize an edocker project](#how-to-initialize-an-edocker-project)
- [How to use edocker in a docker project working directory](#how-to-use-edocker-in-a-docker-project-working-directory)
- [Create edocker path project aliases](#create-edocker-path-project-aliases)
- [Check missing parameters in edocker.properties](#check-missing-parameters-in-edockerproperties)
- [Call help commands](#call-help-commands)
- [Create an docker-compose.yaml file from edocker structure](#create-an-docker-composeyaml-file-from-edocker-structure)
- [Configure automatic container restart at boot](#configure-automatic-container-restart-at-boot)
- [Work in progress](#work-in-progress)
- [License](#license)

## Presentation
([go up to table of content](#table-of-content))

Scripts for easyest docker commands in a docker working folder (Dockerfile)

Tired about repeating docker commands with long parameters ?

Try edocker ! Example :

Configure edocker.properties with docker parameters once and run edocker alias command.
> Example 1: docker build
```bash
edockerbuild
```
instead of:
```bash
docker build -t "devops/jenkins"       build
```

> Example 2: docker run
```bash
edockerrun
```
instead of:
```bash
docker run -dt --name jenkins_1    -p 8080:8080 -p 50000:50000  -v /root/workspace/docker/devops/continuous_integration/jenkins/volumes/jenkins_home:/var/jenkins_home  --link dind_1:docker devops/jenkins
```

> Example 3: docker stop
```bash
edockerstop
```
instead of:
```bash
docker stop $(docker ps -aq | grep "devops/jenkins")
```

## How to install edocker
([go up to table of content](#table-of-content))
### Prerequisities
- install bc command
- install tree command (from binaries or from sources http://mama.indstate.edu/users/ice/tree/)
- install gettext (for envsubst)
    osx:
      brew install gettext
      brew link --force gettext 
      echo "PATH=/usr/local/Cellar/gettext/0.19.8.1/bin/envsubst:$PATH" >> ~/.bashrc
      source ~/.bashrc

### OS compliant
- os x El Capitan 10.11.6
- ubuntu > 14.04

### Installation
```bash
git clone https://github.com/pamtrak06/edocker.git
cd edocker; chmod 755 scripts/*.sh; chmod 755 edockerinstall.sh
```

Run edocker installation
```bash
./edockerinstall.sh
```

Execute the generated alias file:
```bash
source edocker.alias
```

All is done !!! Run this command to see your edocker aliases
```bash
alias|grep edocker
```

### Configuration

**bash**

Bash as login shell will load /etc/profile, ~/.bash_profile, ~/.bash_login, ~/.profile in the order
Bash as non-login interactive shell will load ~/.bashrc
Bash as non-login non-interactive shell will load the configuration specified in environment variable $BASH_ENV

Aadd lines at the bottom of one of the following files:  
```bash
echo "source {edocker path}/edocker.alias" >> /etc/profile
```
or
```bash
echo "source {edocker path}/edocker.alias" >> ~/.bash_profile
```
or
```bash
echo "source {edocker path}/edocker.alias" >> ~/.bash_login
```
or
```bash
echo "source {edocker path}/edocker.alias" >> ~/.profile
```
or
```bash
echo "source {edocker path}/edocker.alias" >> ~/.bashrc
```
or
```bash
echo "source {edocker path}/edocker.alias" >> ~/.bash_aliases
```

**zsh**

Add lines at the bottom of the file ~/.zshrc 
```bash
echo "source {edocker path}/edocker.alias" >> ~/.zshrc
```

**ksh**

Add lines at the bottom of the file ~/.profile  
```bash
echo "source {edocker path}/edocker.alias" >> ~/.profile
```

**bourne**

Add lines at the bottom of the file ~/.profile  
```bash
echo "source {edocker path}/edocker.alias" >> ~/.profile
```

**csh or tcsh**

Add lines at the bottom of the file ~/.login
```bash
echo "source {edocker path}/edocker.alias" >> ~/.login
```

## How to uninstall edocker
([go up to table of content](#table-of-content))

Remove edocker aliases by executing:
```bash
source edocker.unalias
```

Remove references to source command in ~/.bash_aliases
```bash
vi ~/.bash_aliases
```

Remove edocker files
```bash
rm -rf {edocker path}/
```

## How to initialize an edocker project
([go up to table of content](#table-of-content))

Create an uninitialized edocker.properties file in your working docker folder:
```bash
edockerinit
```
Equivalent to
```bash
> Initialize edocker configuration file: edocker.properties ...
cp [edocker path]/edocker_template.properties [your docker working project]/edocker.properties
> Initialize edocker build folder for Dockerfile: /build ...
mkdir [your docker working project]/build
> Initialize Dockerfile: build/Dockerfile ...
touch [your docker working project]/build/Dockerfile
```

Configure your [edocker.properties](https://github.com/pamtrak06/edocker/blob/master/scripts/edocker_template.properties) with correct parameters.
By example, you could create a Dockerfile with this path:
```bash
vi [your docker working project]/build/Dockerfile
```
Example of a minimal edocker configuration:
```bash
mkdir -p jenkins
cd jenkins; edockerinit
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
#cron_build: flag to start container at boot
#cron_build=true
#cron_start: flag to start container at boot
cron_start=true
# docker_command:show docker command when edocker is used
docker_command=true
# image_name:image name
image_name="devops/jenkins"
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
container_name="jenkins"
# exposed_ports:exposed port
exposed_ports="-p 8080:8080 -p 50000:50000"
# shared_volumes:shared volumes
shared_volumes="-v $PWD/volumes/jenkins_home:/var/jenkins_home"
# volumes_from:expose volumes from another container into current container
# volumes_from="--volumes-from <container name with exposed volumes>"
# environment_variables:environnment variables
# environment_variables="-e <variable name 1>=<value 1> -e <variable name 2>=<value 2>"
# linked_containers:linked container
#linked_containers="--link dind_1:docker"
#network_settings:all network settings options
#network_settings=--dns [] --net host --network-alias [] --add-host "" --mac-address "" --ip "" --ip6 "" --link-local-ip []
#runtime_constraints_on_resources: runtime constraints on resources
#runtime_constraints_on_resources=-m, --memory "" --memory-swap "" --memory-reservation "" --kernel-memory "" ...
# force_rmi:force deletion
# force_rmi="--force"
# command_run:bash command(s) to run
# command_run="/bin/bash -c \"cd /; ls -la"
```

Update Dockerfile with jenkins reference from [docker hub](https://hub.docker.com/_/jenkins/)
```bash
touch build/Dockerfile
echo "FROM jenkins:latest" > build/Dockerfile
```

## How to use edocker in a docker project working directory
([go up to table of content](#table-of-content))

Now you've got aliases to run all your docker commands like:
- edockerabout
- edockeralias
- edockerattach
- edockerbuild
- edockercheck
- edockerclean
- edockercommit
- edockercompose
- edockercopy
- edockerdiff
- edockerevents
- edockerexec
- edockerhelp
- edockerhistory
- edockerimages
- edockerinfo
- edockerinit
- edockerinspect
- edockerkill
- edockerlogs
- edockerpause
- edockerportdesc
- edockerports
- edockerps
- edockerpsa
- edockerrename
- edockerrestart
- edockerrm
- edockerrmexiteds
- edockerrmi
- edockerrun
- edockerruni
- edockerstart
- edockerstats
- edockerstop
- edockertag
- edockertop
- edockerunalias
- edockerunpause
- edockerupdate
- edockerwait

!!! All thoses aliases are available only when you've got an [edocker.properties](https://github.com/pamtrak06/edocker/blob/master/edocker_template.properties) file in your project folder ([docker working project]) '''

For each commands, see edockerhelp 'command' for list of parameters read in edocker.properties and arguments.

### #alias edockerabout
Description : about script for edocker.

### #alias edockeralias
Description : print edocker aliases.

### #alias edockerbuild
Description : run command "docker build" with parameters readed from local edocker.properties.

### #alias edockercheck
Description : check missing parameters in edocker.properties.
Remark : even when parameters are missing in edocker.properties, they are initialized empty.

### #alias edockerclean
Description : clean all images with none attribute (run docker rmi with "none" filter).

### #alias edockercopy
Description : run command "docker copy" with parameters readed from local edocker.properties.

### #alias edockercompose
Description : generate docker compose yaml from all local edocker.poperties.

### #alias edockerexec
Description : run command "docker exec" with parameters readed from local edocker.properties.

### #alias edockerhelp
Description : help script for edocker command.

### #alias edockerimages
Description : run command "docker images" with parameters readed from local edocker.properties.

### #alias edockerinit
Description : create a edocker.properties file

### #alias edockerinspect
Description : run command "docker inspect" with parameters readed from local edocker.properties

### #alias edockerlogs
Description : run command "docker logs" with parameters readed from local edocker.properties

### #alias edockerportdesc
Description : run command "docker ports" on all running container

### #alias edockerports
Description : description of port.

### #alias edockerps
Description : run command "docker ps" with parameters readed from local edocker.properties.

### #alias edockerpsa
Description : run command "docker ps -a" with parameters readed from local edocker.properties.

### #alias edockerrename
Description : run command "docker rename" with parameters readed from local edocker.properties.

### #alias edockerrestart
Description : run command "docker restart" with parameters readed from local edocker.properties.

### #alias edockerm
Description : run command "docker rm" with parameters readed from local edocker.properties.

### #alias edockermexiteds
Description : run docker rm with list of container with exited status.

### #alias edockermi
Description : run command "docker rmi" with parameters readed from local edocker.properties.

### #alias edockerun
Description : run command "docker run -id" daemon mode, with parameters readed from local edocker.properties.

### #alias edockeruni
Description : run command "docker run -it" interactive mode, with parameters readed from local edocker.properties.

### #alias edockestart
Description : run command "docker start" with parameters readed from local edocker.properties.

### #alias edockestop
Description : run command "docker stop" with parameters readed from local edocker.properties.

### #alias edockertag
Description : run command "docker tag" with parameters readed from local edocker.properties.

### #alias edockertop
Description : run command "docker top" with parameters readed from local edocker.properties.

### #alias edockerunalias
Description : help script for edocker command.

## Create edocker path project aliases
([go up to table of content](#table-of-content))

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

## Check missing parameters in edocker.properties
([go up to table of content](#table-of-content))

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

## Call help commands
([go up to table of content](#table-of-content))

Main help commands
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
## Create an docker-compose.yaml file from edocker structure
([go up to table of content](#table-of-content))
From an existing edocker root path project structure, call edcokercompose.
Script will parse all edocker.properties in subfolders and create docker-compose.yaml at upper path.

```bash
edockercompose
vi docker-compose.yaml
```

## Configure automatic container restart at boot
([go up to table of content](#table-of-content))

To configure automatic restart of container at boot, configure edocker.properties files :
- activate cron_start=true to start existing container at boot
- activate cron_build=true to build and start a new container at boot

Configure crontab with following parameters
```bash
crontab -e
@reboot {edockerpath}/cron_build_start.sh {edocker properties path}
@reboot {edockerpath}/cron_start_only.sh {edocker properties path}
```

Example:
```bash
crontab -e
@reboot /opt/edocker/scripts/cron_build_start.sh /root/workspace/docker
@reboot /opt/edocker/scripts/cron_start_only.sh /root/workspace/docker
```

## Work in progress
([go up to table of content](#table-of-content))

Please contribute !

- daemon               => TO BE Implemented
- attach               => OK
- build                => OK
- clean                => OK
- commit               => OK
- cp                   => OK
- create               => TO BE Implemented
- diff                 => OK
- events               => OK
- exec                 => OK
- export               => TO BE Implemented
- help                 => OK
- history              => OK
- images               => OK
- import               => TO BE Implemented
- info                 => OK
- init                 => OK
- inspect              => OK
- kill                 => OK
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
- unpause              => OK
- update               => OK
- version              => TO BE Implemented ?
- volume create        => TO BE Implemented
- volume inspect       => TO BE Implemented
- volume ls            => TO BE Implemented
- volume rm            => TO BE Implemented
- wait                 => OK

## License
([go up to table of content](#table-of-content))

edocker is under  "MIT License (MIT)" see [LICENSE file](https://github.com/pamtrak06/edocker/blob/master/LICENSE).
