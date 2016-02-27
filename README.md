# edocker
Scripts for easyest docker commands in a docker working folder (Dockerfile)

Annoying about repeating docker commands with long parameters ?
Don't want to write a docker-compose yaml for your testing Dockerfile ?

Try edocker !
## ! Warrantly !
Script edocker_install.sh is updating your bash environnement (~/.bash_aliases, ...) at your own risk.
Please read the script edocker-installation.sh before any installation.

## How to install edocker
edocker must be installed in /usr/local/edocker, like:
```bash
cd /usr/local; git clone https://github.com/pamtrak06/edocker.git
cd edocker; chmod 755 *.sh
```

Put edocker in your PATH:
```bash
export PATH=$PATH:/usr/local/edocker
```
Put edocker in your bash sessions:
```bash
echo "export PATH=$PATH:/usr/local/edocker" >> ~/.bashrc
```

## How to activate edocker for a project
Go to your working docker folder
```bash
cd [docker working project]
```
Copy the edocker.cfg model in your working docker folder
```bash
cp /usr/local/edocker/edocker.cfg [docker working project] 
```
Configure your edocker.cfg with correct parameters
By example, you could create a Dockerfile with this path :
```bash
vi [docker working project]/build/Dockerfile
```
Run th edocker installation
```bash
edcoker-install.sh
```bash
Execute the generated alias file
```bash
source [basename for <docker working project>].alias
```
You could remove those aliases by execute :
```bash
source [basename for <docker working project>].unalias
```
Your ~/bash_aliases contain alias activation for future bash sessions like:
```bash
source [basename for <docker working project>].alias
```

## How to use edocker for a project
Now you've got aliases to run all your docker commands like:
- d[basename for \<docker working project\>]build
- d[basename for \<docker working project\>]images
- d[basename for \<docker working project\>]rmi
- d[basename for \<docker working project\>]run
- d[basename for \<docker working project\>]ps
- d[basename for \<docker working project\>]rm
- d[basename for \<docker working project\>]start
- d[basename for \<docker working project\>]stop
- d[basename for \<docker working project\>]logs
- d[basename for \<docker working project\>]inspect

!!! All thoses aliases are available only when you're in your project folder ([docker working project]) '''

### #build alias
Alias d[basename for \<docker working project\>]build use following parameters readed from edocker.cfg:
- environment_variables: give build_args option to docker build command 
- build_path: folder containing Dockerfile
- image_name: image name used for build

### #images alias
Alias d[basename for \<docker working project\>]images use following parameters readed from edocker.cfg:
- image_name: image name used to grep for docker images command 

### #rmi alias
Alias d[basename for \<docker working project\>]rmi do not use parameters readed from edocker.cfg.
This alias delete all images tagged with "none" attribute

### #run alias
Alias d[basename for \<docker working project\>]run use following parameters readed from edocker.cfg:
- image_name: image name to create a container used by docker run command
- container_name: name of the container for option --name used by docker run command
- exposed_ports: port mapping option (-p/-P) used by docker run command
- shared_volumes: volumes mapping option (-v) used by docker run command
- environment_variables: environement variables option (-e) used by docker run command
- linked_containers: linked container mapping option (--link) used by docker run command

### #ps alias
Alias d[basename for \<docker working project\>]ps use following parameters readed from edocker.cfg:
- container_name: name of the container

### #rm alias
Alias d[basename for \<docker working project\>]rm use following parameters readed from edocker.cfg:
- container_name: name of the container to be deleted

### #start alias
Alias d[basename for \<docker working project\>]start use following parameters readed from edocker.cfg:
- container_name: name of the container to be started
 
### #stop alias
Alias d[basename for \<docker working project\>]stop use following parameters readed from edocker.cfg:
- container_name: name of the container to be stopped

### #logs alias
Alias d[basename for \<docker working project\>]logs use following parameters readed from edocker.cfg:
- container_name: name of the container to be logged 

### #inspect alias
Alias d[basename for \<docker working project\>]inspect use following parameters readed from edocker.cfg:
- container_name: name of the container to be inspected 

## Tips
create those two aliases and give the correct path for your project
```bash
alias cdedocker='cd /usr/local/edocker'
alias cd[basename for <docker working project>]='cd [docker working project]'
```
## Work in progress
Please contribute !

- daemon               => TO BE Implemented
- attach               => TO BE Implemented
- build                => OK
- commit               => TO BE Implemented
- cp                   => OK
- create               => TO BE Implemented
- diff                 => TO BE Implemented
- events               => TO BE Implemented
- exec                 => OK
- export               => TO BE Implemented
- history              => TO BE Implemented
- images               => OK
- import               => TO BE Implemented
- info                 => TO BE Implemented
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
- port                 => TO BE Implemented
- ps                   => OK
- pull                 => TO BE Implemented
- push                 => TO BE Implemented
- rename               => TO BE Implemented
- restart              => TO BE Implemented
- rm                   => OK
- rmi                  => OK
- run                  => OK
- save                 => TO BE Implemented
- search               => TO BE Implemented ?
- start                => OK
- stats                => TO BE Implemented
- stop                 => OK
- tag                  => TO BE Implemented
- top                  => TO BE Implemented
- unpause              => TO BE Implemented
- update               => TO BE Implemented ?
- version              => TO BE Implemented ?
- volume create        => TO BE Implemented
- volume inspect       => TO BE Implemented
- volume ls            => TO BE Implemented
- volume rm            => TO BE Implemented
- wait                 => TO BE Implemented

## License
edocker is under  "MIT License (MIT)" see LICENSE file.
