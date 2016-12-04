# Easy, compact, shortest Docker commands : edjanger

> Tired about repeating docker commands with long parameters ?
>
> Trying to find magic one from history. Putting commands in some exotical scripts ?
>
> Try edjanger !

<!--
#![Architecture](images/edjanger_archi.png)
![Architecture](<script async src="//jsfiddle.net/pamtrak06/9wvxa133/12/embed/result/"></script>)
-->
Demo with an httpd server configuration.
```bash
mkdir webserver
cd webserver
edjangerinit --template=httpd
```
<iframe width="100%" height="250" src="//jsfiddle.net/pamtrak06/9wvxa133/36/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>
<iframe width="100%" height="400" src="//jsfiddle.net/pamtrak06/9wvxa133/27/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>
<iframe width="100%" height="400" src="//jsfiddle.net/pamtrak06/9wvxa133/29/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>
<iframe width="100%" height="400" src="//jsfiddle.net/pamtrak06/9wvxa133/30/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>
<!--script async src="//jsfiddle.net/pamtrak06/9wvxa133/14/embed/result/dark/"></script-->

## Install

**Prerequisities for installation**

- git
- zip

**Prerequisities for runtime**

- gettext (for envsubst)
- bc (optional)

<!---

> - bc

- Ubuntu / Debian

```
apt-get install bc
```

- CentOS / RHEL / Fedora

```bash
yum install bc
```

> - gettext (for envsubst)
- Ubuntu / Debian

```bash
apt-get install gettext
```

- CentOS / RHEL / Fedora

```bash
yum install gettext
```

- osx

```bash
brew install gettext
brew link --force gettext
echo "PATH=/usr/local/Cellar/gettext/0.19.8.1/bin/envsubst:$PATH" >> ~/.bashrc
source ~/.bashrc
```

- tree command (optional)

    - installation from binaries or from sources (http://mama.indstate.edu/users/ice/tree/)
-->
**Checked compatibility**

- os x El Capitan 10.11.6
- Linux ubuntu > 14.04

**Installation**

Define path where to install edjanger (variable EDJANGER_INSTALL_PATH). 
Following commands are given as example.

```bash
EDJANGER_INSTALL_PATH=/usr/local/bin
git clone https://github.com/pamtrak06/edjanger.git $EDJANGER_INSTALL_PATH
cd edjanger; chmod 755 scripts/*.sh; chmod 755 edjangerinstall.sh
```
This will install edjanger in /usr/local/bin/edjanger
If installation fail to install in this directory, try to install it in another, see [Linux Filesystem Hierarchy Standard](http://www.pathname.com/fhs/pub/fhs-2.3.pdf) for potential paths.

Run edjanger installation
```bash
./edjangerinstall.sh --alias
```

Execute the generated alias file:
```bash
. /usr/local/bin/edjanger/edjanger.alias
```

All is done !!! Run this command to see your edjanger aliases
```bash
alias|grep edjanger
```

Following configuration chapter explain how to "fix" alias in shell environement. 

**Configuration**

~bash~

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

### Uninstall

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

## Getting started

Create a new edjanger working project :
```bash
edjangerinit
```
<iframe width="100%" height="300" src="//jsfiddle.net/pamtrak06/9wvxa133/37/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

File edjanger.properties contain variables used for all edjanger commands.

Type edjanger command and --help to know parameters read from command and available arguments.

You could use a teplate file to configure edjanger.properties.

To do this, create a properties file (given at init is configuration.properties) which contain variables to be replaced in edjanger.template to produce edjanger.properties.

See following example.

```bash
edjangerinit --template=httpd
```
<iframe width="100%" height="400" src="//jsfiddle.net/pamtrak06/9wvxa133/28/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>


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

## Best practices

Use a folder for each edjanger project.

Use following structure :
```bash
- [edjanger main project folder]
    - edjanger.properties   > edjanger project configuration
    - [build]               > docker build folder (contains Dockerfile and files dependencies)
        -  Dockerfile       > default Dockerfile
    - volumes               > contains all shared volumes
```

## Help

For each commands, see edjangerhelp 'command' for list of parameters read in edjanger.properties and arguments.


## Unit tests

Tests use following

- [travis](https://travis-ci.org/pamtrak06/edjanger)
- [bats](https://github.com/sstephenson/bats)

Result Tests are visible here

- [pamtrak06/edjanger from Travis](https://travis-ci.org/pamtrak06/edjanger)

Run tests :

```
cd [edjanger path];
./run_tests.sh
```

