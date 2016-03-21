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

## How to use edocker in a docker a project working directory
Now you've got aliases to run all your docker commands like:
- edockerbuild
- edockerclean
- edockercopy
- edockerexec
- edockerhelp
- edockerimages
- edockerinit
- edockerinspect
- edockerlogs
- edockerps
- edockerrm
- edockerrun
- edockerstart
- edockerstop

!!! All thoses aliases are available only when you've got an [edocker.cfg](https://github.com/pamtrak06/edocker/blob/master/edocker.cfg.sample) file in your project folder ([docker working project]) '''

### #alias edockerbuild
Alias edockerbuild use following parameters readed from edocker.cfg:
- build_args: give build_args option to docker build command 
- build_path: folder containing Dockerfile
- image_name: image name used for build

### #alias edockerimages
Alias edockerimages use following parameters readed from edocker.cfg:
- image_name: image name used to grep for docker images command 

### #alias edockerclean
Alias edockerclean do not use parameters readed from edocker.cfg.
This alias delete all images tagged with "none" attribute

### #alias edockerrun
Alias edockerrun use following parameters readed from edocker.cfg:
- image_name: image name to create a container used by docker run command
- container_name: name of the container for option --name used by docker run command
- exposed_ports: port mapping option (-p/-P) used by docker run command
- shared_volumes: volumes mapping option (-v) used by docker run command
- environment_variables: environement variables option (-e) used by docker run command
- linked_containers: linked container mapping option (--link) used by docker run command

### #alias edockerps
Alias d[basename for \<docker working project\>]ps use following parameters readed from edocker.cfg:
- container_name: name of the container

### #alias edockerrm
Alias edockerrm use following parameters readed from edocker.cfg:
- container_name: name of the container to be deleted

### #alias edockerstart
Alias edockerstart use following parameters readed from edocker.cfg:
- container_name: name of the container to be started
 
### #alias edockerstop
Alias edockerstop use following parameters readed from edocker.cfg:
- container_name: name of the container to be stopped

### #alias edockerlogs
Alias edockerlogs use following parameters readed from edocker.cfg:
- container_name: name of the container to be logged 

### #alias edockerinspect
Alias edockerinspect use following parameters readed from edocker.cfg:
- container_name: name of the container to be inspected 

## Tips
create those two aliases and give the correct path for your project
```bash
alias cdedocker='cd [edocker path]'
alias cd[basename for your docker working project]='cd [your docker working project]'
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
