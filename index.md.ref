[![Build Status](https://travis-ci.org/pamtrak06/edjanger.svg?branch=master)](https://travis-ci.org/pamtrak06/edjanger)

# Table of content
- [Presentation](#presentation)
- [How to install edjanger](#how-to-install-edjanger)
- [How to uninstall edjanger](#how-to-uninstall-edjanger)
- [How to initialize an edjanger project](#how-to-initialize-an-edjanger-project)
- [How to use edjanger in a docker project working directory](#how-to-use-edjanger-in-a-docker-project-working-directory)
- [Create edjanger path project aliases](#create-edjanger-path-project-aliases)
- [Check missing parameters in edjanger.properties](#check-missing-parameters-in-edjangerproperties)
- [Call help commands](#call-help-commands)
- [Create an docker-compose.yaml file from edjanger structure](#create-an-docker-composeyaml-file-from-edjanger-structure)
- [Use templates files to configure edjanger.properties](#use-templates-files-to-configure-edjangerproperties)
- [Configure automatic container restart at boot](#configure-automatic-container-restart-at-boot)
- [Work in progress](#work-in-progress)
- [Tests](#tests)
- [License](#license)

## Presentation
([go up to table of content](#table-of-content))

Scripts for shortest and easyest docker commands in a docker working folder (Dockerfile)

Tired about repeating docker commands with long parameters ?

Try edjanger ! Example :

Configure edjanger.properties with docker parameters once and run edjanger alias command.
> Example 1: docker build
```bash
edjangerbuild
```
instead of:
```bash
docker build -t "devops/jenkins"       build
```

> Example 2: docker run
```bash
edjangerrun
```
instead of:
```bash
docker run -dt --name jenkins_1    -p 8080:8080 -p 50000:50000  -v /root/workspace/docker/devops/continuous_integration/jenkins/volumes/jenkins_home:/var/jenkins_home  --link dind_1:docker devops/jenkins
```

> Example 3: docker stop
```bash
edjangerstop
```
instead of:
```bash
docker stop $(docker ps -aq | grep "devops/jenkins")
```

## How to install edjanger
([go up to table of content](#table-of-content))
- Prerequisities
- install bc command
- install gettext (for envsubst)
    osx:
      brew install gettext
      brew link --force gettext
      echo "PATH=/usr/local/Cellar/gettext/0.19.8.1/bin/envsubst:$PATH" >> ~/.bashrc
      source ~/.bashrc
- optionnal: install tree command (from binaries or from sources http://mama.indstate.edu/users/ice/tree/)

- OS compliant
- os x El Capitan 10.11.6
- ubuntu > 14.04

- Installation
```bash
git clone https://github.com/pamtrak06/edjanger.git /usr/local/bin
cd edjanger; chmod 755 scripts/*.sh; chmod 755 edjangerinstall.sh
```

Run edjanger installation
```bash
./edjangerinstall.sh --alias
```

This will install edjanger in /usr/local/bin/edjanger
If installation fail to install in this directory, try to install it in another

```bash
edjanger_INSTALL_PATH=<your path>
git clone https://github.com/pamtrak06/edjanger.git $edjanger_INSTALL_PATH
cd edjanger; chmod 755 scripts/*.sh; chmod 755 edjangerinstall.sh
```

Execute the generated alias file:
```bash
. /usr/local/bin/edjanger/edjanger.alias
```

All is done !!! Run this command to see your edjanger aliases
```bash
alias|grep edjanger
```

- Configuration

**bash**

Bash as login shell will load /etc/profile, ~/.bash_profile, ~/.bash_login, ~/.profile in the order
Bash as non-login interactive shell will load ~/.bashrc
Bash as non-login non-interactive shell will load the configuration specified in environment variable $BASH_ENV

Add lines at the bottom of one of the following files:  
```bash
echo "source {edjanger path}/edjanger.alias" >> /etc/profile
```
or
```bash
echo "source {edjanger path}/edjanger.alias" >> ~/.bash_profile
```
or
```bash
echo "source {edjanger path}/edjanger.alias" >> ~/.bash_login
```
or
```bash
echo "source {edjanger path}/edjanger.alias" >> ~/.profile
```
or
```bash
echo "source {edjanger path}/edjanger.alias" >> ~/.bashrc
```
or
```bash
echo "source {edjanger path}/edjanger.alias" >> ~/.bash_aliases
```

**zsh**

Add lines at the bottom of the file ~/.zshrc
```bash
echo "source {edjanger path}/edjanger.alias" >> ~/.zshrc
```

**ksh**

Add lines at the bottom of the file ~/.profile  
```bash
echo "source {edjanger path}/edjanger.alias" >> ~/.profile
```

**bourne**

Add lines at the bottom of the file ~/.profile  
```bash
echo "source {edjanger path}/edjanger.alias" >> ~/.profile
```

**csh or tcsh**

Add lines at the bottom of the file ~/.login
```bash
echo "source {edjanger path}/edjanger.alias" >> ~/.login
```

## How to uninstall edjanger
([go up to table of content](#table-of-content))

Remove edjanger aliases by executing:
```bash
source edjanger.unalias
```

Remove references to source command in ~/.bash_aliases
```bash
vi ~/.bash_aliases
```

Remove edjanger files
```bash
rm -rf {edjanger path}/
```

## How to initialize an edjanger project
([go up to table of content](#table-of-content))

Create an uninitialized edjanger.properties file in your working docker folder:
```bash
edjangerinit
```
Equivalent to
```bash
> Initialize edjanger configuration file: edjanger.properties ...
cp [edjanger path]/templates/edjanger_template.properties [your docker working project]/edjanger.properties
> Initialize edjanger build folder for Dockerfile: /build ...
mkdir [your docker working project]/build
> Initialize Dockerfile: build/Dockerfile ...
touch [your docker working project]/build/Dockerfile
```

Configure your [edjanger.properties](https://github.com/pamtrak06/edjanger/blob/master/scripts/templates/edjanger_template.properties) with correct parameters.
By example, you could create a Dockerfile with this path:
```bash
vi [your docker working project]/build/Dockerfile
```
Example of a minimal edjanger configuration:
```bash
mkdir -p jenkins
cd jenkins; edjangerinit
vi edjanger.properties
```
```bash
#  ----------------------------------------------------
#  The MIT License (MIT)
#
#  Copyright (c) 2016 copyright pamtrak06@gmail.com
#  ----------------------------------------------------
#  CONFIGURATION    : edjanger_template.properties
#  DESCRIPTION      : project configuration file for edjanger
#  CREATOR          : pamtrak06@gmail.com
#  --------------------------------
#  VERSION          : 1.0
#  DATE             : 2016-03-02
#  COMMENT          : creation
#  --------------------------------
#  USAGE            : read by edjanger scripts
#  ----------------------------------------------------
#cron_build: flag to start container at boot
#cron_build=true
#cron_start: flag to start container at boot
cron_start=true
# docker_command:show docker command when edjanger is used
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

## How to use edjanger in a docker project working directory
([go up to table of content](#table-of-content))

Now you've got aliases to run all your docker commands like:
- edjangerabout
- edjangeralias
- edjangerattach
- edjangerbuild
- edjangercheck
- edjangerclean
- edjangercommit
- edjangercompose
- edjangercopy
- edjangerdiff
- edjangerevents
- edjangerexec
- edjangerhelp
- edjangerhistory
- edjangerimages
- edjangerinfo
- edjangerinit
- edjangerinspect
- edjangerkill
- edjangerlogs
- edjangerpause
- edjangerportdesc
- edjangerports
- edjangerps
- edjangerpsa
- edjangerrename
- edjangerrestart
- edjangerrm
- edjangerrmexiteds
- edjangerrmi
- edjangerrun
- edjangerruni
- edjangerstart
- edjangerstats
- edjangerstop
- edjangertag
- edjangertemplate
- edjangertop
- edjangerunalias
- edjangerunpause
- edjangerupdate
- edjangerwait

!!! All thoses aliases are available only when you've got an [edjanger.properties](https://github.com/pamtrak06/edjanger/blob/master/templates/edjanger_template.properties) file in your project folder ([docker working project]) '''

For each commands, see edjangerhelp 'command' for list of parameters read in edjanger.properties and arguments.

- #alias edjangerabout
Description : about script for edjanger.

- #alias edjangeralias
Description : print edjanger aliases.

- #alias edjangerbuild
Description : run command "docker build" with parameters readed from local edjanger.properties.

- #alias edjangercheck
Description : check missing parameters in edjanger.properties.
Remark : even when parameters are missing in edjanger.properties, they are initialized empty.

- #alias edjangerclean
Description : clean all images with none attribute (run docker rmi with "none" filter).

- #alias edjangercopy
Description : run command "docker copy" with parameters readed from local edjanger.properties.

- #alias edjangercompose
Description : generate docker compose yaml from all local edjanger.poperties.

- #alias edjangerexec
Description : run command "docker exec" with parameters readed from local edjanger.properties.

- #alias edjangerhelp
Description : help script for edjanger command.

- #alias edjangerimages
Description : run command "docker images" with parameters readed from local edjanger.properties.

- #alias edjangerinit
Description : create a edjanger.properties file

- #alias edjangerinspect
Description : run command "docker inspect" with parameters readed from local edjanger.properties

- #alias edjangerlogs
Description : run command "docker logs" with parameters readed from local edjanger.properties

- #alias edjangerportdesc
Description : run command "docker ports" on all running container

- #alias edjangerports
Description : description of port.

- #alias edjangerps
Description : run command "docker ps" with parameters readed from local edjanger.properties.

- #alias edjangerpsa
Description : run command "docker ps -a" with parameters readed from local edjanger.properties.

- #alias edjangerrename
Description : run command "docker rename" with parameters readed from local edjanger.properties.

- #alias edjangerrestart
Description : run command "docker restart" with parameters readed from local edjanger.properties.

- #alias edjangerm
Description : run command "docker rm" with parameters readed from local edjanger.properties.

- #alias edjangermexiteds
Description : run docker rm with list of container with exited status.

- #alias edjangermi
Description : run command "docker rmi" with parameters readed from local edjanger.properties.

- #alias edjangerun
Description : run command "docker run -id" daemon mode, with parameters readed from local edjanger.properties.

- #alias edjangeruni
Description : run command "docker run -it" interactive mode, with parameters readed from local edjanger.properties.

- #alias edockestart
Description : run command "docker start" with parameters readed from local edjanger.properties.

- #alias edockestop
Description : run command "docker stop" with parameters readed from local edjanger.properties.

- #alias edjangertag
Description : run command "docker tag" with parameters readed from local edjanger.properties.

- #alias edjangertemplate
Description : create edjanger.properties from edjanger.template and properties files containing variables definition.

- #alias edjangertop
Description : run command "docker top" with parameters readed from local edjanger.properties.

- #alias edjangerunalias
Description : help script for edjanger command.

## Create edjanger path project aliases
([go up to table of content](#table-of-content))

Create those two aliases and give the correct path for your project:
```bash
alias cdedjanger='cd [edjanger path]'
alias cd[basename for your docker working project]='cd [your docker working project]'
```
Or create all possible aliases for subfolders in a folder:
```bash
source /usr/local/edjanger/_common.sh
source $(buildPathAliases "/opt/docker/")
```

## Check missing parameters in edjanger.properties
([go up to table of content](#table-of-content))

```bash
edjangercheck
Check edjanger.properties...
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
edjangerhelp
```
Help for help
```bash
edjangerhelp help
```
Help for commands, example for edjangerbuild
```bash
edjangerhelp build
```
Help for parameters in edjanger.properties used by commands
```bash
edjangerhelp config
```
## Create an docker-compose.yaml file from edjanger structure
([go up to table of content](#table-of-content))
From an existing edjanger root path project structure, call edcokercompose.
Script will parse all edjanger.properties in subfolders and create docker-compose.yaml at upper path.

```bash
edjangercompose
vi docker-compose.yaml
```
## Use templates files to configure edjanger.properties
([go up to table of content](#table-of-content))

! Prerequisities : install gettext (for envsubst)

- Download and try example from https://github.com/pamtrak06/edjanger/tree/master/scripts/templates/templating, run:

- Deploy 2 apache web sever (web1 and web2) with specific ports and shared volumes for a "production" environement.
    ```bash
    ./deploy_run.sh production 5
    ```

- Deploy 2 apache web server (web1 and web2) with specific ports and shared volumes for an "integration" environement.
    ```bash
    ./deploy_run.sh integration 5
    ```

- Instructions
From an existing edjanger root path project structure, do following
    - rename all edjanger.properties to edjanger.template
    - define variable for element to be replaced with variable value from configuration file
    - create configuration files (<name>.properties) containing SHELL-FORMAT variable
        - in each folder containing edjanger.properties (each configuration file must hase same name e.g.: production.properties)
        or
        - only in root folder (e.g.: production.properties)
    - call edjangertemplate with name of configuration file
    ```bash
    edjangertemplate <name>.properties
    ```

    Example of edjangertemplate invocation
    ```bash
    edjangertemplate production.properties
    ```

    Example of production.properties content
    ```bash
    #!/bin/bash
    export HTTPD_PORT_80=80
    export HTTPD_PORT_443=443
    ```

    Example of edjanger.template content
    ```bash
    #exposed_ports:exposed port
    exposed_ports="-p ${HTTPD_PORT_80}:80 -p ${HTTPD_PORT_443}:443"
    ```

    Script will find all edjanger.template and replace variables from root or folder(s) configuration(s) file(s) to produce edjanger.properties files.

    Example of edjanger.properties produced
    ```bash
    #exposed_ports:exposed port
    exposed_ports="-p 80:80 -p 443:443"
```

## Configure automatic container restart at boot
([go up to table of content](#table-of-content))

To configure automatic restart of container at boot, configure edjanger.properties files :
- activate cron_start=true to start existing container at boot
- activate cron_build=true to build and start a new container at boot

Configure crontab with following parameters
```bash
crontab -e
@reboot {edjangerpath}/cron_build_start.sh {edjanger properties path}
@reboot {edjangerpath}/cron_start_only.sh {edjanger properties path}
```

Example:
```bash
crontab -e
@reboot /opt/edjanger/scripts/cron_build_start.sh /root/workspace/docker
@reboot /opt/edjanger/scripts/cron_start_only.sh /root/workspace/docker
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

## Tests
([go up to table of content](#table-of-content))

Tests use following
- [travis](https://travis-ci.org/pamtrak06/edjanger)
- [bats](https://github.com/sstephenson/bats)

## License
([go up to table of content](#table-of-content))

edjanger is under  "MIT License (MIT)" see [LICENSE file](https://github.com/pamtrak06/edjanger/blob/master/LICENSE).
