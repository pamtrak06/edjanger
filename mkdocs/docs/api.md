## Command edjangerabout
```bash
 Description: about script for edjanger
 
 Usage:
    edjangerabout
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerabout --help
```
## Command edjangeralias
```bash
 Description: print edjanger aliases
 
 Usage:
    edjangeralias
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangeralias --help
```
## Command edjangerattach
```bash
 Description:
    Attach to a running container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerattach [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    attach_options                 "docker attach" options to a running container (see docker attach --help)
    container_name                 container name
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerattach --help
```
## Command edjangerbuild
```bash
 Description: Build an image from a Dockerfile. Use $image_name and $container_name.
    File edjanger.properties must be present in path.
 Usage:
    edjangerbuild [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    build_args                     build arguments
    build_forcerm                  always remove intermediate containers
    build_rm                       remove intermediate containers after a successful build
    build_nocache                  do not use cache when building the image
    build_file                     name of the Dockerfile (Default is 'CURRENT PATH/Dockerfile')
    build_path                     path where is found Dockerfile and its dependencies
    build_options                  all the other build build options (see docker build --help)
    docker_command                 print docker command
    image_name                     image name
 
 Environement:
    proxy_args                     proxy variables (HTTP_PROXY,HTTPS_PROXY,http_proxy,https_proxy) read from proxy.zip or environment
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerbuild --help
```
## Command edjangercheck
```bash
 Description: check missing parameters in edjanger.properties from existing in template
 templates/edjanger.template
 
 Usage:
    edjangercheck
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercheck --help
```
## Command edjangerclean
```bash
 Description: run command "docker rmi" with parameters read from edjanger.properties
 Delete images: with attribute name=\"none\"
 
 Usage:
    edjangerclean [option]
 
 Options:
    -h, --help                     print this documentation
 
        --force                    force removal of the image
 
        --no-prune                 do not delete untagged parents
 
 Parameters (edjanger.properties):
    force_rmi                      path where is found Dockerfile and its dependencies
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerclean --help
```
## Command edjangercommit
```bash
 Description:
    Create a new image from a container's changes.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercommit [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --commitname=COMMIT        commit tag like REPOSITORY[:TAG]
 
        --commitmessage=MESSAG     commit message
 
        --commitauthor=MESSAG      commit author
 
 Parameters (edjanger.properties):
    container_name                 container name
    commit_options                 "docker commit" options to a running container (see docker commit --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercommit --help
```
## Command edjangercompose
```bash
 Description: generate docker-compose.yaml from all local edjanger.poperties
 
 Usage:
    edjangercompose
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercompose --help
```
## Command edjangercopy
```bash
 Description:
    Copy files/folders between a container and the local filesystem.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercopy [option]
 
 Options:
    -h, --help                     print this documentation
 
        --fromcontainer            copy file(s) from container to host
 
        --fromhost                 copy file(s) from host to container
 
        --sourcepath=PATH          path to file(s) or folder to copy
 
        --destinationpath=PATH     path where to copy file(s) or folder to copy
 
 Parameters (edjanger.properties):
    container_name                 container name
    copy_options                   options to copy files/folders between a container and the local filesystem
    docker_command                 "docker cp" options to a running container (see docker cp --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercopy --help
```
## Command edjangercreate
```bash
 Description:
    Create a new container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercreate [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    container_hostname               container host name (option -h, --hostname string for docker run)
    container_privilege              give extended privileges to this container (option --privileged for docker run)
    container_remove                 automatically remove the container when it exits (option --rm for docker run)
    container_addhost                add a custom host-to-IP mapping (host:ip) (default []) (option --add-host value for docker run)
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for "docker create"
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container (option --volumes-from value of docker run)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercreate --help
```
## Command edjangerdiff
```bash
 Description:
    Inspect changes on a container's filesystem.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerdiff [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    diff_options                   "docker diff" options to a running container (see docker diff --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerdiff --help
```
## Command edjangerevents
```bash
 Description:
    Get real time events for a container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerevents [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    events_options                 "docker events" options to a running container (see docker events --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerevents --help
```
## Command edjangerexec
```bash
 Description:
    Run a command in a running container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerexec [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --shellcommand=COMMAND     additionnal command to execute
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    exec_options                   "docker exec" options to a running container (see docker exec --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerexec --help
```
## Command edjangerexport
```bash
 Description:
    Export a container's filesystem as a tar archive.
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerexport [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    export_options                 "docker export" options to a running container (see docker export --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerexport --help
```
## Command edjangerhelp
```bash
 Description: print list of all available edjanger commands. 
 Running command : "edjangerhelp"
 
 With parameter "config" or "parameters", print parameters read in 
 edjanger.properties and used by each edjanger commands.
 Running command : "edjangerhelp config"
 
 With parameter "[edjanger short command]", print help for this command. 
 Examples : 
     "edjangerhelp run"            => give help for edjangerrun
     "edjangerhelp build"          => give help for edjangerbuild
     ...
 
      "edjangerhelp edjangerrun"   => give help for edjangerrun
      "edjangerhelp edjangerbuild" => give help for edjangerbuild
     ...
 
 Usage:
    edjangerhelp [option] [config | parameters]
 
 Options:
    config                         print parameters used by edjanger commands.
 
    [edjanger short command]       print help for this edjanger command.
 
    -h, --help                     print this documentation
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerhelp --help
```
## Command edjangerhistory
```bash
 Description:
    Show the history of an image.
    
    Filtered by $image_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerhistory [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    history_options                "docker history" options to a running container (see docker history --help)
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerhistory --help
```
## Command edjangerimages
```bash
 Description:
    List images.
    
    Filtered by $image_name
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerimages [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    image_name                     image name
    images_options                 "docker images" options to a running container (see docker images --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerimages --help
```
## Command edjangerimport
```bash
 Description:
    Import the contents from a tarball to create a filesystem image.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerimport [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    import_options                 "docker import" options to a running container (see docker import --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerimport --help
```
## Command edjangerinit
```bash
 Description: create a edjanger project with following files
 - edjanger.template (example)
 - configuration.properties (example)
 - build/Dockerfile (empty example)
 File edjanger.properties is build with previous template and configuration files
 with followinf command :
 - edjangertemplate properties=configuration
 
 Usage:
    edjangerinit [option]
 
 Options:
    -h, --help                     print this documentation
 
        --template=TEMPLATE-NAME   initialize with the name of the template which could be chozen from the --templatelist option
 
        --templatelist             list of all available templates
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerinit --help
```
## Command edjangerinspect
```bash
 Description: 
    Return low-level information on a container, image or task.
    
    Filtered by $container_name and $image_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerinspect [option]
 
 Options:
    -h, --help                     print this documentation
 
        --container                apply to container
 
        --image                    apply to image
 
        --index=INDEX              index of the container name (valid with option --container)
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    inspect_options                "docker inspect" options to a running container (see docker inspect --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerinspect --help
```
## Command edjangerkill
```bash
 Description: 
    Kill one or more running containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerkill [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    kill_options                   "docker kill" options to a running container (see docker kill --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerkill --help
```
## Command edjangerlogs
```bash
 Description:
    Fetch the logs of a container. 
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerlogs [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    logs_options                   "docker logs" options to a running container (see docker logs --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerlogs --help
```
## Command edjangerpause
```bash
 Description:
    Pause all processes within one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerpause [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    pause_options                  "docker pause" options to a running container (see docker pause --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerpause --help
```
## Command edjangerportdesc
```bash
 Description: description of network port numbers for a given port number parameter
 
 Usage:
    edjangerportdesc [option]
 
 Options:
    -h, --help                       print this documentation
 
        --port=PORT                  index number of the port
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerportdesc --help
```
## Command edjangerports
```bash
 Description: List port mappings or a specific mapping for all container.
 
 Usage:
    edjangerports [option]
 
 Options:
    -h, --help                     print this documentation
 
        --list                     print list of exposed ports for all running containers
 
        --all                      print list of ports information for all containers
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ports_options                  "docker ports" options to a running container (see docker ports --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerports --help
```
## Command edjangerps
```bash
 Description: 
    List all running container(s).
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerps [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ps_options                     "docker ps" options to a running container (see docker ps --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerps --help
```
## Command edjangerpsa
```bash
 Description:
    List all container(s).
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerpsa [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ps_options                     "docker ps" options to a running container (see docker ps --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerpsa --help
```
## Command edjangerrename
```bash
 Description:
    Rename a container.
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrename [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --name=NAME                new name of the container.
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    rename_options                 "docker rename" options to a running container (see docker rename --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrename --help
```
## Command edjangerrestart
```bash
 Description:
    Restart one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrestart [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    restart_options                "docker restart" options to a running container (see docker restart --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrestart --help
```
## Command edjangerrm
```bash
 Description:
    Remove one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrm [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --all                      delete all containers for the container_name pattern
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    rm_options                     "docker rm" options to a running container (see docker rm --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrm --help
```
## Command edjangerrmexiteds
```bash
 Description: remove all exited container.
 
 Usage:
    edjangerrmexiteds [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    rm_options                     "docker rm" options to a running container (see docker rm --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmexiteds --help
```
## Command edjangerrmi
```bash
 Description: remove one or more images. Filtered by $image_name.
    File edjanger.properties must be present in path.
 
 Usage:
    edjangerrmi [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    force_rmi                      force image deletion
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmi --help
```
## Command edjangerrmorphanedvolumes
```bash
 Description: remove all orphaned volumes
 
 Usage:
    edjangerrmorphanedvolumes
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmorphanedvolumes --help
```
## Command edjangerrun
```bash
 Description:
    Run a command in a new container. 
    
    Filtered by $image_name and $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrun [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    container_hostname               container host name (option -h, --hostname string for docker run)
    container_privilege              give extended privileges to this container (option --privileged for docker run)
    container_remove                 automatically remove the container when it exits (option --rm for docker run)
    container_addhost                add a custom host-to-IP mapping (host:ip) (default []) (option --add-host value for docker run)
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for docker run
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container (option --volumes-from value of docker run)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrun --help
```
## Command edjangerruni
```bash
 Description:
    Run interactively a command in a new container.
    
    Filtered by $image_name and $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerruni [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for docker run
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerruni --help
```
## Command edjangerstart
```bash
 Description:
    Start one or more stopped containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstart [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    start_options                  \"docker start\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstart --help
```
## Command edjangerstats
```bash
 Description:
    Display a live stream of container(s) resource usage statistics.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstats [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    stats_options                  \"docker stats\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstats --help
```
## Command edjangerstop
```bash
 Description: 
    Stop one or more running containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstop [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    stop_options                   \"docker stop\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstop --help
```
## Command edjangertag
```bash
 Description: 
    Tag an image into a repository.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangertag [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    tag_options                    \"docker tag\" options to a running container
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertag --help
```
## Command edjangertemplate
```bash
 Description: generate edjanger.poperties from edjanger.template
 
 Usage:
    edjangertemplate [option]
 
 Options:
    -h, --help                     print this documentation
 
        --properties=CONFIG        properties file containing variables to be replaced in edjanger.template to create edjanger.properties
 
        --save                     save current directory as a template (teplate name is the hash of the archive)
 
        --delete                   delete named archive. Must be combined with option --name=TEMPLATE-NAME
 
        --savepattern              additionnal file pattern to save in the archive
 
        --init=TEMPLATE-NAME       initialize with the name of the template which could be chozen from the --list option
 
        --name=TEMPLATE-NAME       save template with specified archive name
 
        --list                     list of all available templates
 
        --listinfo                 list of all available templates with details
 
 Example:
    edjangertemplate --help        print this documentation
 
    edjangertemplate --properties=configuration
                                   replace environement variables from file configuration.properties in edjanger.template to produce edjanger.properties file
 
    edjangertemplate --save
                                   save all current configuration in a templating folder with an hash identifiant (edjanger.*, scripts sh, )
 
    edjangertemplate --save --name=demo_web
                                   save all current configuration in a templating folder with the template name "demo_web"
 
    edjangertemplate --save --name=demo_web --savepattern="*.html,*js,*.css"
                                   save all current configuration in a templating folder with the template name "demo_web" and save additional files
 
    edjangertemplate --list
                                   print the list off all stored templates
 
    edjangertemplate --delete --name=demo_web
                                   remove the template from storage space
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertemplate --help
```
## Command edjangertop
```bash
 Description:
    Display the running processes of a container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangertop [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    top_options                    \"docker top\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertop --help
```
## Command edjangerunalias
```bash
 Description: unalias all edjanger aliases
 
 Usage:
    edjangerunalias
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerunalias --help
```
## Command edjangerunpause
```bash
 Description: 
    Unpause all processes within one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerunpause [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    unpause_options                \"docker unpause\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerunpause --help
```
## Command edjangerupdate
```bash
 Description: 
    Update configuration of one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerupdate [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    update_options                 \"docker update\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerupdate --help
```
## Command edjangerupgrade
```bash

```
Note: help for this command could be retrieve by typing:
```bash
edjangerupgrade --help
```
## Command edjangerwait
```bash
 Description : 
    Block until a container stops, then print its exit code.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerwait [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    wait_options                   "docker wait" options to a running container (see docker wait --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerwait --help
```
## Command edjangerabout
```bash
 Description: about script for edjanger
 
 Usage:
    edjangerabout
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerabout --help
```
## Command edjangeralias
```bash
 Description: print edjanger aliases
 
 Usage:
    edjangeralias
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangeralias --help
```
## Command edjangerattach
```bash
 Description:
    Attach to a running container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerattach [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    attach_options                 "docker attach" options to a running container (see docker attach --help)
    container_name                 container name
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerattach --help
```
## Command edjangerbuild
```bash
 Description: Build an image from a Dockerfile. Use $image_name and $container_name.
    File edjanger.properties must be present in path.
 Usage:
    edjangerbuild [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    build_args                     build arguments
    build_forcerm                  always remove intermediate containers
    build_rm                       remove intermediate containers after a successful build
    build_nocache                  do not use cache when building the image
    build_file                     name of the Dockerfile (Default is 'CURRENT PATH/Dockerfile')
    build_path                     path where is found Dockerfile and its dependencies
    build_options                  all the other build build options (see docker build --help)
    docker_command                 print docker command
    image_name                     image name
 
 Environement:
    proxy_args                     proxy variables (HTTP_PROXY,HTTPS_PROXY,http_proxy,https_proxy) read from proxy.zip or environment
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerbuild --help
```
## Command edjangercheck
```bash
 Description: check missing parameters in edjanger.properties from existing in template
 templates/edjanger.template
 
 Usage:
    edjangercheck
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercheck --help
```
## Command edjangerclean
```bash
 Description: run command "docker rmi" with parameters read from edjanger.properties
 Delete images: with attribute name=\"none\"
 
 Usage:
    edjangerclean [option]
 
 Options:
    -h, --help                     print this documentation
 
        --force                    force removal of the image
 
        --no-prune                 do not delete untagged parents
 
 Parameters (edjanger.properties):
    force_rmi                      path where is found Dockerfile and its dependencies
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerclean --help
```
## Command edjangercommit
```bash
 Description:
    Create a new image from a container's changes.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercommit [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --commitname=COMMIT        commit tag like REPOSITORY[:TAG]
 
        --commitmessage=MESSAG     commit message
 
        --commitauthor=MESSAG      commit author
 
 Parameters (edjanger.properties):
    container_name                 container name
    commit_options                 "docker commit" options to a running container (see docker commit --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercommit --help
```
## Command edjangercompose
```bash
 Description: generate docker-compose.yaml from all local edjanger.poperties
 
 Usage:
    edjangercompose
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercompose --help
```
## Command edjangercopy
```bash
 Description:
    Copy files/folders between a container and the local filesystem.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercopy [option]
 
 Options:
    -h, --help                     print this documentation
 
        --fromcontainer            copy file(s) from container to host
 
        --fromhost                 copy file(s) from host to container
 
        --sourcepath=PATH          path to file(s) or folder to copy
 
        --destinationpath=PATH     path where to copy file(s) or folder to copy
 
 Parameters (edjanger.properties):
    container_name                 container name
    copy_options                   options to copy files/folders between a container and the local filesystem
    docker_command                 "docker cp" options to a running container (see docker cp --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercopy --help
```
## Command edjangercreate
```bash
 Description:
    Create a new container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercreate [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    container_hostname               container host name (option -h, --hostname string for docker run)
    container_privilege              give extended privileges to this container (option --privileged for docker run)
    container_remove                 automatically remove the container when it exits (option --rm for docker run)
    container_addhost                add a custom host-to-IP mapping (host:ip) (default []) (option --add-host value for docker run)
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for "docker create"
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container (option --volumes-from value of docker run)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercreate --help
```
## Command edjangerdiff
```bash
 Description:
    Inspect changes on a container's filesystem.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerdiff [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    diff_options                   "docker diff" options to a running container (see docker diff --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerdiff --help
```
## Command edjangerevents
```bash
 Description:
    Get real time events for a container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerevents [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    events_options                 "docker events" options to a running container (see docker events --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerevents --help
```
## Command edjangerexec
```bash
 Description:
    Run a command in a running container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerexec [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --shellcommand=COMMAND     additionnal command to execute
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    exec_options                   "docker exec" options to a running container (see docker exec --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerexec --help
```
## Command edjangerexport
```bash
 Description:
    Export a container's filesystem as a tar archive.
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerexport [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    export_options                 "docker export" options to a running container (see docker export --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerexport --help
```
## Command edjangerhelp
```bash
 Description: print list of all available edjanger commands. 
 Running command : "edjangerhelp"
 
 With parameter "config" or "parameters", print parameters read in 
 edjanger.properties and used by each edjanger commands.
 Running command : "edjangerhelp config"
 
 With parameter "[edjanger short command]", print help for this command. 
 Examples : 
     "edjangerhelp run"            => give help for edjangerrun
     "edjangerhelp build"          => give help for edjangerbuild
     ...
 
      "edjangerhelp edjangerrun"   => give help for edjangerrun
      "edjangerhelp edjangerbuild" => give help for edjangerbuild
     ...
 
 Usage:
    edjangerhelp [option] [config | parameters]
 
 Options:
    config                         print parameters used by edjanger commands.
 
    [edjanger short command]       print help for this edjanger command.
 
    -h, --help                     print this documentation
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerhelp --help
```
## Command edjangerhistory
```bash
 Description:
    Show the history of an image.
    
    Filtered by $image_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerhistory [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    history_options                "docker history" options to a running container (see docker history --help)
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerhistory --help
```
## Command edjangerimages
```bash
 Description:
    List images.
    
    Filtered by $image_name
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerimages [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    image_name                     image name
    images_options                 "docker images" options to a running container (see docker images --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerimages --help
```
## Command edjangerimport
```bash
 Description:
    Import the contents from a tarball to create a filesystem image.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerimport [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    import_options                 "docker import" options to a running container (see docker import --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerimport --help
```
## Command edjangerinit
```bash
 Description: create a edjanger project with following files
 - edjanger.template (example)
 - configuration.properties (example)
 - build/Dockerfile (empty example)
 File edjanger.properties is build with previous template and configuration files
 with followinf command :
 - edjangertemplate properties=configuration
 
 Usage:
    edjangerinit [option]
 
 Options:
    -h, --help                     print this documentation
 
        --template=TEMPLATE-NAME   initialize with the name of the template which could be chozen from the --templatelist option
 
        --templatelist             list of all available templates
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerinit --help
```
## Command edjangerinspect
```bash
 Description: 
    Return low-level information on a container, image or task.
    
    Filtered by $container_name and $image_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerinspect [option]
 
 Options:
    -h, --help                     print this documentation
 
        --container                apply to container
 
        --image                    apply to image
 
        --index=INDEX              index of the container name (valid with option --container)
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    inspect_options                "docker inspect" options to a running container (see docker inspect --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerinspect --help
```
## Command edjangerkill
```bash
 Description: 
    Kill one or more running containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerkill [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    kill_options                   "docker kill" options to a running container (see docker kill --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerkill --help
```
## Command edjangerlogs
```bash
 Description:
    Fetch the logs of a container. 
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerlogs [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    logs_options                   "docker logs" options to a running container (see docker logs --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerlogs --help
```
## Command edjangerpause
```bash
 Description:
    Pause all processes within one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerpause [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    pause_options                  "docker pause" options to a running container (see docker pause --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerpause --help
```
## Command edjangerportdesc
```bash
 Description: description of network port numbers for a given port number parameter
 
 Usage:
    edjangerportdesc [option]
 
 Options:
    -h, --help                       print this documentation
 
        --port=PORT                  index number of the port
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerportdesc --help
```
## Command edjangerports
```bash
 Description: List port mappings or a specific mapping for all container.
 
 Usage:
    edjangerports [option]
 
 Options:
    -h, --help                     print this documentation
 
        --list                     print list of exposed ports for all running containers
 
        --all                      print list of ports information for all containers
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ports_options                  "docker ports" options to a running container (see docker ports --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerports --help
```
## Command edjangerps
```bash
 Description: 
    List all running container(s).
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerps [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ps_options                     "docker ps" options to a running container (see docker ps --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerps --help
```
## Command edjangerpsa
```bash
 Description:
    List all container(s).
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerpsa [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ps_options                     "docker ps" options to a running container (see docker ps --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerpsa --help
```
## Command edjangerrename
```bash
 Description:
    Rename a container.
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrename [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --name=NAME                new name of the container.
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    rename_options                 "docker rename" options to a running container (see docker rename --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrename --help
```
## Command edjangerrestart
```bash
 Description:
    Restart one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrestart [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    restart_options                "docker restart" options to a running container (see docker restart --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrestart --help
```
## Command edjangerrm
```bash
 Description:
    Remove one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrm [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --all                      delete all containers for the container_name pattern
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    rm_options                     "docker rm" options to a running container (see docker rm --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrm --help
```
## Command edjangerrmexiteds
```bash
 Description: remove all exited container.
 
 Usage:
    edjangerrmexiteds [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    rm_options                     "docker rm" options to a running container (see docker rm --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmexiteds --help
```
## Command edjangerrmi
```bash
 Description: remove one or more images. Filtered by $image_name.
    File edjanger.properties must be present in path.
 
 Usage:
    edjangerrmi [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    force_rmi                      force image deletion
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmi --help
```
## Command edjangerrmorphanedvolumes
```bash
 Description: remove all orphaned volumes
 
 Usage:
    edjangerrmorphanedvolumes
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmorphanedvolumes --help
```
## Command edjangerrun
```bash
 Description:
    Run a command in a new container. 
    
    Filtered by $image_name and $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrun [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    container_hostname               container host name (option -h, --hostname string for docker run)
    container_privilege              give extended privileges to this container (option --privileged for docker run)
    container_remove                 automatically remove the container when it exits (option --rm for docker run)
    container_addhost                add a custom host-to-IP mapping (host:ip) (default []) (option --add-host value for docker run)
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for docker run
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container (option --volumes-from value of docker run)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrun --help
```
## Command edjangerruni
```bash
 Description:
    Run interactively a command in a new container.
    
    Filtered by $image_name and $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerruni [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for docker run
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerruni --help
```
## Command edjangerstart
```bash
 Description:
    Start one or more stopped containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstart [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    start_options                  \"docker start\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstart --help
```
## Command edjangerstats
```bash
 Description:
    Display a live stream of container(s) resource usage statistics.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstats [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    stats_options                  \"docker stats\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstats --help
```
## Command edjangerstop
```bash
 Description: 
    Stop one or more running containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstop [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    stop_options                   \"docker stop\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstop --help
```
## Command edjangertag
```bash
 Description: 
    Tag an image into a repository.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangertag [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    tag_options                    \"docker tag\" options to a running container
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertag --help
```
## Command edjangertemplate
```bash
 Description: generate edjanger.poperties from edjanger.template
 
 Usage:
    edjangertemplate [option]
 
 Options:
    -h, --help                     print this documentation
 
        --properties=CONFIG        properties file containing variables to be replaced in edjanger.template to create edjanger.properties
 
        --save                     save current directory as a template (teplate name is the hash of the archive)
 
        --delete                   delete named archive. Must be combined with option --name=TEMPLATE-NAME
 
        --savepattern              additionnal file pattern to save in the archive
 
        --init=TEMPLATE-NAME       initialize with the name of the template which could be chozen from the --list option
 
        --name=TEMPLATE-NAME       save template with specified archive name
 
        --list                     list of all available templates
 
        --listinfo                 list of all available templates with details
 
 Example:
    edjangertemplate --help        print this documentation
 
    edjangertemplate --properties=configuration
                                   replace environement variables from file configuration.properties in edjanger.template to produce edjanger.properties file
 
    edjangertemplate --save
                                   save all current configuration in a templating folder with an hash identifiant (edjanger.*, scripts sh, )
 
    edjangertemplate --save --name=demo_web
                                   save all current configuration in a templating folder with the template name "demo_web"
 
    edjangertemplate --save --name=demo_web --savepattern="*.html,*js,*.css"
                                   save all current configuration in a templating folder with the template name "demo_web" and save additional files
 
    edjangertemplate --list
                                   print the list off all stored templates
 
    edjangertemplate --delete --name=demo_web
                                   remove the template from storage space
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertemplate --help
```
## Command edjangertop
```bash
 Description:
    Display the running processes of a container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangertop [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    top_options                    \"docker top\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertop --help
```
## Command edjangerunalias
```bash
 Description: unalias all edjanger aliases
 
 Usage:
    edjangerunalias
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerunalias --help
```
## Command edjangerunpause
```bash
 Description: 
    Unpause all processes within one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerunpause [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    unpause_options                \"docker unpause\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerunpause --help
```
## Command edjangerupdate
```bash
 Description: 
    Update configuration of one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerupdate [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    update_options                 \"docker update\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerupdate --help
```
## Command edjangerupgrade
```bash

```
Note: help for this command could be retrieve by typing:
```bash
edjangerupgrade --help
```
## Command edjangerwait
```bash
 Description : 
    Block until a container stops, then print its exit code.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerwait [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    wait_options                   "docker wait" options to a running container (see docker wait --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerwait --help
```
## Command edjangerabout
```bash
 Description: about script for edjanger
 
 Usage:
    edjangerabout
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerabout --help
```
## Command edjangeralias
```bash
 Description: print edjanger aliases
 
 Usage:
    edjangeralias
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangeralias --help
```
## Command edjangerattach
```bash
 Description:
    Attach to a running container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerattach [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    attach_options                 "docker attach" options to a running container (see docker attach --help)
    container_name                 container name
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerattach --help
```
## Command edjangerbuild
```bash
 Description: Build an image from a Dockerfile. Use $image_name and $container_name.
    File edjanger.properties must be present in path.
 Usage:
    edjangerbuild [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    build_args                     build arguments
    build_forcerm                  always remove intermediate containers
    build_rm                       remove intermediate containers after a successful build
    build_nocache                  do not use cache when building the image
    build_file                     name of the Dockerfile (Default is 'CURRENT PATH/Dockerfile')
    build_path                     path where is found Dockerfile and its dependencies
    build_options                  all the other build build options (see docker build --help)
    docker_command                 print docker command
    image_name                     image name
 
 Environement:
    proxy_args                     proxy variables (HTTP_PROXY,HTTPS_PROXY,http_proxy,https_proxy) read from proxy.zip or environment
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerbuild --help
```
## Command edjangercheck
```bash
 Description: check missing parameters in edjanger.properties from existing in template
 templates/edjanger.template
 
 Usage:
    edjangercheck
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercheck --help
```
## Command edjangerclean
```bash
 Description: run command "docker rmi" with parameters read from edjanger.properties
 Delete images: with attribute name=\"none\"
 
 Usage:
    edjangerclean [option]
 
 Options:
    -h, --help                     print this documentation
 
        --force                    force removal of the image
 
        --no-prune                 do not delete untagged parents
 
 Parameters (edjanger.properties):
    force_rmi                      path where is found Dockerfile and its dependencies
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerclean --help
```
## Command edjangercommit
```bash
 Description:
    Create a new image from a container's changes.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercommit [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --commitname=COMMIT        commit tag like REPOSITORY[:TAG]
 
        --commitmessage=MESSAG     commit message
 
        --commitauthor=MESSAG      commit author
 
 Parameters (edjanger.properties):
    container_name                 container name
    commit_options                 "docker commit" options to a running container (see docker commit --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercommit --help
```
## Command edjangercompose
```bash
 Description: generate docker-compose.yaml from all local edjanger.poperties
 
 Usage:
    edjangercompose
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercompose --help
```
## Command edjangercopy
```bash
 Description:
    Copy files/folders between a container and the local filesystem.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercopy [option]
 
 Options:
    -h, --help                     print this documentation
 
        --fromcontainer            copy file(s) from container to host
 
        --fromhost                 copy file(s) from host to container
 
        --sourcepath=PATH          path to file(s) or folder to copy
 
        --destinationpath=PATH     path where to copy file(s) or folder to copy
 
 Parameters (edjanger.properties):
    container_name                 container name
    copy_options                   options to copy files/folders between a container and the local filesystem
    docker_command                 "docker cp" options to a running container (see docker cp --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercopy --help
```
## Command edjangercreate
```bash
 Description:
    Create a new container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercreate [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    container_hostname               container host name (option -h, --hostname string for docker run)
    container_privilege              give extended privileges to this container (option --privileged for docker run)
    container_remove                 automatically remove the container when it exits (option --rm for docker run)
    container_addhost                add a custom host-to-IP mapping (host:ip) (default []) (option --add-host value for docker run)
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for "docker create"
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container (option --volumes-from value of docker run)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercreate --help
```
## Command edjangerdiff
```bash
 Description:
    Inspect changes on a container's filesystem.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerdiff [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    diff_options                   "docker diff" options to a running container (see docker diff --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerdiff --help
```
## Command edjangerevents
```bash
 Description:
    Get real time events for a container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerevents [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    events_options                 "docker events" options to a running container (see docker events --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerevents --help
```
## Command edjangerexec
```bash
 Description:
    Run a command in a running container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerexec [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --shellcommand=COMMAND     additionnal command to execute
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    exec_options                   "docker exec" options to a running container (see docker exec --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerexec --help
```
## Command edjangerexport
```bash
 Description:
    Export a container's filesystem as a tar archive.
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerexport [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    export_options                 "docker export" options to a running container (see docker export --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerexport --help
```
## Command edjangerhelp
```bash
 Description: print list of all available edjanger commands. 
 Running command : "edjangerhelp"
 
 With parameter "config" or "parameters", print parameters read in 
 edjanger.properties and used by each edjanger commands.
 Running command : "edjangerhelp config"
 
 With parameter "[edjanger short command]", print help for this command. 
 Examples : 
     "edjangerhelp run"            => give help for edjangerrun
     "edjangerhelp build"          => give help for edjangerbuild
     ...
 
      "edjangerhelp edjangerrun"   => give help for edjangerrun
      "edjangerhelp edjangerbuild" => give help for edjangerbuild
     ...
 
 Usage:
    edjangerhelp [option] [config | parameters]
 
 Options:
    config                         print parameters used by edjanger commands.
 
    [edjanger short command]       print help for this edjanger command.
 
    -h, --help                     print this documentation
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerhelp --help
```
## Command edjangerhistory
```bash
 Description:
    Show the history of an image.
    
    Filtered by $image_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerhistory [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    history_options                "docker history" options to a running container (see docker history --help)
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerhistory --help
```
## Command edjangerimages
```bash
 Description:
    List images.
    
    Filtered by $image_name
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerimages [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    image_name                     image name
    images_options                 "docker images" options to a running container (see docker images --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerimages --help
```
## Command edjangerimport
```bash
 Description:
    Import the contents from a tarball to create a filesystem image.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerimport [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    import_options                 "docker import" options to a running container (see docker import --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerimport --help
```
## Command edjangerinit
```bash
 Description: create a edjanger project with following files
 - edjanger.template (example)
 - configuration.properties (example)
 - build/Dockerfile (empty example)
 File edjanger.properties is build with previous template and configuration files
 with followinf command :
 - edjangertemplate properties=configuration
 
 Usage:
    edjangerinit [option]
 
 Options:
    -h, --help                     print this documentation
 
        --template=TEMPLATE-NAME   initialize with the name of the template which could be chozen from the --templatelist option
 
        --templatelist             list of all available templates
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerinit --help
```
## Command edjangerinspect
```bash
 Description: 
    Return low-level information on a container, image or task.
    
    Filtered by $container_name and $image_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerinspect [option]
 
 Options:
    -h, --help                     print this documentation
 
        --container                apply to container
 
        --image                    apply to image
 
        --index=INDEX              index of the container name (valid with option --container)
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    inspect_options                "docker inspect" options to a running container (see docker inspect --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerinspect --help
```
## Command edjangerkill
```bash
 Description: 
    Kill one or more running containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerkill [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    kill_options                   "docker kill" options to a running container (see docker kill --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerkill --help
```
## Command edjangerlogs
```bash
 Description:
    Fetch the logs of a container. 
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerlogs [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    logs_options                   "docker logs" options to a running container (see docker logs --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerlogs --help
```
## Command edjangerpause
```bash
 Description:
    Pause all processes within one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerpause [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    pause_options                  "docker pause" options to a running container (see docker pause --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerpause --help
```
## Command edjangerportdesc
```bash
 Description: description of network port numbers for a given port number parameter
 
 Usage:
    edjangerportdesc [option]
 
 Options:
    -h, --help                       print this documentation
 
        --port=PORT                  index number of the port
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerportdesc --help
```
## Command edjangerports
```bash
 Description: List port mappings or a specific mapping for all container.
 
 Usage:
    edjangerports [option]
 
 Options:
    -h, --help                     print this documentation
 
        --list                     print list of exposed ports for all running containers
 
        --all                      print list of ports information for all containers
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ports_options                  "docker ports" options to a running container (see docker ports --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerports --help
```
## Command edjangerps
```bash
 Description: 
    List all running container(s).
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerps [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ps_options                     "docker ps" options to a running container (see docker ps --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerps --help
```
## Command edjangerpsa
```bash
 Description:
    List all container(s).
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerpsa [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ps_options                     "docker ps" options to a running container (see docker ps --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerpsa --help
```
## Command edjangerrename
```bash
 Description:
    Rename a container.
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrename [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --name=NAME                new name of the container.
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    rename_options                 "docker rename" options to a running container (see docker rename --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrename --help
```
## Command edjangerrestart
```bash
 Description:
    Restart one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrestart [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    restart_options                "docker restart" options to a running container (see docker restart --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrestart --help
```
## Command edjangerrm
```bash
 Description:
    Remove one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrm [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --all                      delete all containers for the container_name pattern
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    rm_options                     "docker rm" options to a running container (see docker rm --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrm --help
```
## Command edjangerrmexiteds
```bash
 Description: remove all exited container.
 
 Usage:
    edjangerrmexiteds [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    rm_options                     "docker rm" options to a running container (see docker rm --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmexiteds --help
```
## Command edjangerrmi
```bash
 Description: remove one or more images. Filtered by $image_name.
    File edjanger.properties must be present in path.
 
 Usage:
    edjangerrmi [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    force_rmi                      force image deletion
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmi --help
```
## Command edjangerrmorphanedvolumes
```bash
 Description: remove all orphaned volumes
 
 Usage:
    edjangerrmorphanedvolumes
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmorphanedvolumes --help
```
## Command edjangerrun
```bash
 Description:
    Run a command in a new container. 
    
    Filtered by $image_name and $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrun [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    container_hostname               container host name (option -h, --hostname string for docker run)
    container_privilege              give extended privileges to this container (option --privileged for docker run)
    container_remove                 automatically remove the container when it exits (option --rm for docker run)
    container_addhost                add a custom host-to-IP mapping (host:ip) (default []) (option --add-host value for docker run)
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for docker run
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container (option --volumes-from value of docker run)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrun --help
```
## Command edjangerruni
```bash
 Description:
    Run interactively a command in a new container.
    
    Filtered by $image_name and $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerruni [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for docker run
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerruni --help
```
## Command edjangerstart
```bash
 Description:
    Start one or more stopped containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstart [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    start_options                  \"docker start\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstart --help
```
## Command edjangerstats
```bash
 Description:
    Display a live stream of container(s) resource usage statistics.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstats [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    stats_options                  \"docker stats\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstats --help
```
## Command edjangerstop
```bash
 Description: 
    Stop one or more running containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstop [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    stop_options                   \"docker stop\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstop --help
```
## Command edjangertag
```bash
 Description: 
    Tag an image into a repository.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangertag [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    tag_options                    \"docker tag\" options to a running container
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertag --help
```
## Command edjangertemplate
```bash
 Description: generate edjanger.poperties from edjanger.template
 
 Usage:
    edjangertemplate [option]
 
 Options:
    -h, --help                     print this documentation
 
        --properties=CONFIG        properties file containing variables to be replaced in edjanger.template to create edjanger.properties
 
        --save                     save current directory as a template (teplate name is the hash of the archive)
 
        --delete                   delete named archive. Must be combined with option --name=TEMPLATE-NAME
 
        --savepattern              additionnal file pattern to save in the archive
 
        --init=TEMPLATE-NAME       initialize with the name of the template which could be chozen from the --list option
 
        --name=TEMPLATE-NAME       save template with specified archive name
 
        --list                     list of all available templates
 
        --listinfo                 list of all available templates with details
 
 Example:
    edjangertemplate --help        print this documentation
 
    edjangertemplate --properties=configuration
                                   replace environement variables from file configuration.properties in edjanger.template to produce edjanger.properties file
 
    edjangertemplate --save
                                   save all current configuration in a templating folder with an hash identifiant (edjanger.*, scripts sh, )
 
    edjangertemplate --save --name=demo_web
                                   save all current configuration in a templating folder with the template name "demo_web"
 
    edjangertemplate --save --name=demo_web --savepattern="*.html,*js,*.css"
                                   save all current configuration in a templating folder with the template name "demo_web" and save additional files
 
    edjangertemplate --list
                                   print the list off all stored templates
 
    edjangertemplate --delete --name=demo_web
                                   remove the template from storage space
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertemplate --help
```
## Command edjangertop
```bash
 Description:
    Display the running processes of a container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangertop [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    top_options                    \"docker top\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertop --help
```
## Command edjangerunalias
```bash
 Description: unalias all edjanger aliases
 
 Usage:
    edjangerunalias
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerunalias --help
```
## Command edjangerunpause
```bash
 Description: 
    Unpause all processes within one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerunpause [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    unpause_options                \"docker unpause\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerunpause --help
```
## Command edjangerupdate
```bash
 Description: 
    Update configuration of one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerupdate [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    update_options                 \"docker update\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerupdate --help
```
## Command edjangerupgrade
```bash

```
Note: help for this command could be retrieve by typing:
```bash
edjangerupgrade --help
```
## Command edjangerwait
```bash
 Description : 
    Block until a container stops, then print its exit code.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerwait [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    wait_options                   "docker wait" options to a running container (see docker wait --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerwait --help
```
## Command edjangerabout
```bash
 Description: about script for edjanger
 
 Usage:
    edjangerabout
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerabout --help
```
## Command edjangeralias
```bash
 Description: print edjanger aliases
 
 Usage:
    edjangeralias
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangeralias --help
```
## Command edjangerattach
```bash
 Description:
    Attach to a running container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerattach [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    attach_options                 "docker attach" options to a running container (see docker attach --help)
    container_name                 container name
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerattach --help
```
## Command edjangerbuild
```bash
 Description: Build an image from a Dockerfile. Use $image_name and $container_name.
    File edjanger.properties must be present in path.
 Usage:
    edjangerbuild [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    build_args                     build arguments
    build_forcerm                  always remove intermediate containers
    build_rm                       remove intermediate containers after a successful build
    build_nocache                  do not use cache when building the image
    build_file                     name of the Dockerfile (Default is 'CURRENT PATH/Dockerfile')
    build_path                     path where is found Dockerfile and its dependencies
    build_options                  all the other build build options (see docker build --help)
    docker_command                 print docker command
    image_name                     image name
 
 Environement:
    proxy_args                     proxy variables (HTTP_PROXY,HTTPS_PROXY,http_proxy,https_proxy) read from proxy.zip or environment
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerbuild --help
```
## Command edjangercheck
```bash
 Description: check missing parameters in edjanger.properties from existing in template
 templates/edjanger.template
 
 Usage:
    edjangercheck
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercheck --help
```
## Command edjangerclean
```bash
 Description: run command "docker rmi" with parameters read from edjanger.properties
 Delete images: with attribute name=\"none\"
 
 Usage:
    edjangerclean [option]
 
 Options:
    -h, --help                     print this documentation
 
        --force                    force removal of the image
 
        --no-prune                 do not delete untagged parents
 
 Parameters (edjanger.properties):
    force_rmi                      path where is found Dockerfile and its dependencies
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerclean --help
```
## Command edjangercommit
```bash
 Description:
    Create a new image from a container's changes.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercommit [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --commitname=COMMIT        commit tag like REPOSITORY[:TAG]
 
        --commitmessage=MESSAG     commit message
 
        --commitauthor=MESSAG      commit author
 
 Parameters (edjanger.properties):
    container_name                 container name
    commit_options                 "docker commit" options to a running container (see docker commit --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercommit --help
```
## Command edjangercompose
```bash
 Description: generate docker-compose.yaml from all local edjanger.poperties
 
 Usage:
    edjangercompose
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercompose --help
```
## Command edjangercopy
```bash
 Description:
    Copy files/folders between a container and the local filesystem.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercopy [option]
 
 Options:
    -h, --help                     print this documentation
 
        --fromcontainer            copy file(s) from container to host
 
        --fromhost                 copy file(s) from host to container
 
        --sourcepath=PATH          path to file(s) or folder to copy
 
        --destinationpath=PATH     path where to copy file(s) or folder to copy
 
 Parameters (edjanger.properties):
    container_name                 container name
    copy_options                   options to copy files/folders between a container and the local filesystem
    docker_command                 "docker cp" options to a running container (see docker cp --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercopy --help
```
## Command edjangercreate
```bash
 Description:
    Create a new container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangercreate [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    container_hostname               container host name (option -h, --hostname string for docker run)
    container_privilege              give extended privileges to this container (option --privileged for docker run)
    container_remove                 automatically remove the container when it exits (option --rm for docker run)
    container_addhost                add a custom host-to-IP mapping (host:ip) (default []) (option --add-host value for docker run)
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for "docker create"
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container (option --volumes-from value of docker run)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercreate --help
```
## Command edjangerdiff
```bash
 Description:
    Inspect changes on a container's filesystem.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerdiff [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    diff_options                   "docker diff" options to a running container (see docker diff --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerdiff --help
```
## Command edjangerevents
```bash
 Description:
    Get real time events for a container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerevents [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    events_options                 "docker events" options to a running container (see docker events --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerevents --help
```
## Command edjangerexec
```bash
 Description:
    Run a command in a running container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerexec [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --shellcommand=COMMAND     additionnal command to execute
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    exec_options                   "docker exec" options to a running container (see docker exec --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerexec --help
```
## Command edjangerexport
```bash
 Description:
    Export a container's filesystem as a tar archive.
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerexport [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    export_options                 "docker export" options to a running container (see docker export --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerexport --help
```
## Command edjangerhelp
```bash
 Description: print list of all available edjanger commands. 
 Running command : "edjangerhelp"
 
 With parameter "config" or "parameters", print parameters read in 
 edjanger.properties and used by each edjanger commands.
 Running command : "edjangerhelp config"
 
 With parameter "[edjanger short command]", print help for this command. 
 Examples : 
     "edjangerhelp run"            => give help for edjangerrun
     "edjangerhelp build"          => give help for edjangerbuild
     ...
 
      "edjangerhelp edjangerrun"   => give help for edjangerrun
      "edjangerhelp edjangerbuild" => give help for edjangerbuild
     ...
 
 Usage:
    edjangerhelp [option] [config | parameters]
 
 Options:
    config                         print parameters used by edjanger commands.
 
    [edjanger short command]       print help for this edjanger command.
 
    -h, --help                     print this documentation
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerhelp --help
```
## Command edjangerhistory
```bash
 Description:
    Show the history of an image.
    
    Filtered by $image_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerhistory [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    history_options                "docker history" options to a running container (see docker history --help)
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerhistory --help
```
## Command edjangerimages
```bash
 Description:
    List images.
    
    Filtered by $image_name
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerimages [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    image_name                     image name
    images_options                 "docker images" options to a running container (see docker images --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerimages --help
```
## Command edjangerimport
```bash
 Description:
    Import the contents from a tarball to create a filesystem image.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerimport [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    import_options                 "docker import" options to a running container (see docker import --help)
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerimport --help
```
## Command edjangerinit
```bash
 Description: create a edjanger project with following files
 - edjanger.template (example)
 - configuration.properties (example)
 - build/Dockerfile (empty example)
 File edjanger.properties is build with previous template and configuration files
 with followinf command :
 - edjangertemplate properties=configuration
 
 Usage:
    edjangerinit [option]
 
 Options:
    -h, --help                     print this documentation
 
        --template=TEMPLATE-NAME   initialize with the name of the template which could be chozen from the --templatelist option
 
        --templatelist             list of all available templates
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerinit --help
```
## Command edjangerinspect
```bash
 Description: 
    Return low-level information on a container, image or task.
    
    Filtered by $container_name and $image_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerinspect [option]
 
 Options:
    -h, --help                     print this documentation
 
        --container                apply to container
 
        --image                    apply to image
 
        --index=INDEX              index of the container name (valid with option --container)
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    inspect_options                "docker inspect" options to a running container (see docker inspect --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerinspect --help
```
## Command edjangerkill
```bash
 Description: 
    Kill one or more running containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerkill [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    kill_options                   "docker kill" options to a running container (see docker kill --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerkill --help
```
## Command edjangerlogs
```bash
 Description:
    Fetch the logs of a container. 
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerlogs [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    logs_options                   "docker logs" options to a running container (see docker logs --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerlogs --help
```
## Command edjangerpause
```bash
 Description:
    Pause all processes within one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerpause [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    pause_options                  "docker pause" options to a running container (see docker pause --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerpause --help
```
## Command edjangerportdesc
```bash
 Description: description of network port numbers for a given port number parameter
 
 Usage:
    edjangerportdesc [option]
 
 Options:
    -h, --help                       print this documentation
 
        --port=PORT                  index number of the port
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerportdesc --help
```
## Command edjangerports
```bash
 Description: List port mappings or a specific mapping for all container.
 
 Usage:
    edjangerports [option]
 
 Options:
    -h, --help                     print this documentation
 
        --list                     print list of exposed ports for all running containers
 
        --all                      print list of ports information for all containers
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ports_options                  "docker ports" options to a running container (see docker ports --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerports --help
```
## Command edjangerps
```bash
 Description: 
    List all running container(s).
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerps [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ps_options                     "docker ps" options to a running container (see docker ps --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerps --help
```
## Command edjangerpsa
```bash
 Description:
    List all container(s).
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerpsa [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    ps_options                     "docker ps" options to a running container (see docker ps --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerpsa --help
```
## Command edjangerrename
```bash
 Description:
    Rename a container.
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrename [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --name=NAME                new name of the container.
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    rename_options                 "docker rename" options to a running container (see docker rename --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrename --help
```
## Command edjangerrestart
```bash
 Description:
    Restart one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrestart [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    restart_options                "docker restart" options to a running container (see docker restart --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrestart --help
```
## Command edjangerrm
```bash
 Description:
    Remove one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrm [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
        --all                      delete all containers for the container_name pattern
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    rm_options                     "docker rm" options to a running container (see docker rm --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrm --help
```
## Command edjangerrmexiteds
```bash
 Description: remove all exited container.
 
 Usage:
    edjangerrmexiteds [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    rm_options                     "docker rm" options to a running container (see docker rm --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmexiteds --help
```
## Command edjangerrmi
```bash
 Description: remove one or more images. Filtered by $image_name.
    File edjanger.properties must be present in path.
 
 Usage:
    edjangerrmi [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    docker_command                 print docker command
    force_rmi                      force image deletion
    image_name                     image name
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmi --help
```
## Command edjangerrmorphanedvolumes
```bash
 Description: remove all orphaned volumes
 
 Usage:
    edjangerrmorphanedvolumes
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmorphanedvolumes --help
```
## Command edjangerrun
```bash
 Description:
    Run a command in a new container. 
    
    Filtered by $image_name and $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerrun [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    container_hostname               container host name (option -h, --hostname string for docker run)
    container_privilege              give extended privileges to this container (option --privileged for docker run)
    container_remove                 automatically remove the container when it exits (option --rm for docker run)
    container_addhost                add a custom host-to-IP mapping (host:ip) (default []) (option --add-host value for docker run)
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for docker run
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container (option --volumes-from value of docker run)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrun --help
```
## Command edjangerruni
```bash
 Description:
    Run interactively a command in a new container.
    
    Filtered by $image_name and $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerruni [option]
 
 Options:
    -h, --help                       print this documentation
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run                      bash command(s) to run
    environment_variables            environnment variables
    exposed_ports                    exposed port
    image_name                       image name
    linked_containers                linked container
    network_settings                 all network settings options
    run_other_options                all other available options for docker run
    runtime_constraints_on_resources runtime constraints on resources
    volumes_from                     expose volumes from another container into current container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerruni --help
```
## Command edjangerstart
```bash
 Description:
    Start one or more stopped containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstart [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    start_options                  \"docker start\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstart --help
```
## Command edjangerstats
```bash
 Description:
    Display a live stream of container(s) resource usage statistics.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstats [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    stats_options                  \"docker stats\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstats --help
```
## Command edjangerstop
```bash
 Description: 
    Stop one or more running containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerstop [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    stop_options                   \"docker stop\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstop --help
```
## Command edjangertag
```bash
 Description: 
    Tag an image into a repository.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangertag [option]
 
 Options:
    -h, --help                     print this documentation
 
 Parameters (edjanger.properties):
    container_name                 container name
    tag_options                    \"docker tag\" options to a running container
    docker_command                 print docker command
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertag --help
```
## Command edjangertemplate
```bash
 Description: manage templates for edjanger :
   - list available template's archive in the local database (short or detailed list)
   - initialize a template from a local archive name
   - save a template in a local archive from current sources
   - delete a template from the a local database
 
 Usage:
    edjangertemplate [option]
 
 Options:
    -h, --help                     print this documentation
 
        --properties=CONFIG        properties file containing variables to be replaced in edjanger.template to create edjanger.properties
 
        --save                     save current directory as a template (teplate name is the hash of the archive)
 
        --delete                   delete named archive. Must be combined with option --name=TEMPLATE-NAME
 
        --savepattern              additionnal file pattern to save in the archive
 
        --init=TEMPLATE-NAME       initialize with the name of the template which could be chozen from the --list option
 
        --name=TEMPLATE-NAME       save template with specified archive name
 
        --list                     list of all available templates
 
        --listinfo                 list of all available templates with details
 
 Example:
    edjangertemplate --help        print this documentation
 
    edjangertemplate --properties=configuration
                                   replace environement variables from file configuration.properties in edjanger.template to produce edjanger.properties file
 
    edjangertemplate --save
                                   save all current configuration in a templating folder with an hash identifiant (edjanger.*, scripts sh, )
 
    edjangertemplate --save --name=demo_web
                                   save all current configuration in a templating folder with the template name "demo_web"
 
    edjangertemplate --save --name=demo_web --savepattern="*.html,*js,*.css"
                                   save all current configuration in a templating folder with the template name "demo_web" and save additional files
 
    edjangertemplate --list
                                   print the list off all stored templates
 
    edjangertemplate --delete --name=demo_web
                                   remove the template from storage space
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertemplate --help
```
## Command edjangertop
```bash
 Description:
    Display the running processes of a container.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangertop [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    top_options                    \"docker top\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertop --help
```
## Command edjangerunalias
```bash
 Description: unalias all edjanger aliases
 
 Usage:
    edjangerunalias
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerunalias --help
```
## Command edjangerunpause
```bash
 Description: 
    Unpause all processes within one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerunpause [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    unpause_options                \"docker unpause\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerunpause --help
```
## Command edjangerupdate
```bash
 Description: 
    Update configuration of one or more containers.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerupdate [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    update_options                 \"docker update\" options to a running container
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerupdate --help
```
## Command edjangerupgrade
```bash

```
Note: help for this command could be retrieve by typing:
```bash
edjangerupgrade --help
```
## Command edjangerwait
```bash
 Description : 
    Block until a container stops, then print its exit code.
    
    Filtered by $container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage:
    edjangerwait [option]
 
 Options:
    -h, --help                     print this documentation
 
        --index=INDEX              index of the container name
 
 Parameters (edjanger.properties):
    container_name                 container name
    docker_command                 print docker command
    wait_options                   "docker wait" options to a running container (see docker wait --help)
 
 edjanger, The MIT License (MIT)
 Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerwait --help
```
