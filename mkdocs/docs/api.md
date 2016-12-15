## Command edjangerabout
```bash
 Description
   About script for edjanger.
 
 Usage
    edjangerabout
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerabout --help
```
## Command edjangeralias
```bash
 Description
   Display edjanger aliases.
 
 Usage
    edjangeralias
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangeralias --help
```
## Command edjangerattach
```bash
 Description
   Attach for a running container.
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerattach[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Define the index of the container name.
 
 Parameters (edjanger.properties):
    attach_options
           Options of "docker attach" for a running container (see docker 
           attach --help).
 
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerattach --help
```
## Command edjangerbuild
```bash
 Description Build an image from a Dockerfile. Use $image_name and $container_name.
    File edjanger.properties must be present in path.
 Usage
   edjangerbuild[option]
 
 Options
    -h, --help
           Display help.
 
 Parameters (edjanger.properties):
    build_args
           Build arguments.
 
    build_forcerm
           Always remove intermediate containers.
 
    build_rm
           Remove intermediate containers after a successful build.
 
    build_nocache
           Do not use cache when building the image.
 
    build_file
           Name of the Dockerfile (Default is 'CURRENT PATH/Dockerfile').
 
    build_path
           Path where is found Dockerfile and its dependencies.
 
    build_options
           All the other build build options (see docker build --help).
 
    docker_command
           Display docker command.
 
    image_name
           Image name.
 
 Environement:
    proxy_args
           Get proxy variables (HTTP_PROXY,HTTPS_PROXY,http_proxy,https_proxy) 
           from environment or read it from proxy.zip.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerbuild --help
```
## Command edjangercheck
```bash
 Description
   Check missing parameters in edjanger.properties from existing in template
   templates/edjanger.template.
 
 Usage
    edjangercheck
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercheck --help
```
## Command edjangerclean
```bash
 Description
   Run command "docker rmi" with parameters read from edjanger.properties.
   Delete images: with attribute name="none".
 
 Usage
   edjangerclean[option]
 
 Options
    -h, --help
           Display help.
 
        --force
           Force removal of the image.
 
        --no-prune
           Do not delete untagged parents.
 
 Parameters (edjanger.properties):
    force_rmi
           path where is found Dockerfile and its dependencies
 
    image_name
           Image name.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerclean --help
```
## Command edjangercommit
```bash
 Description
    Create a new image from a container's changes.
    
    Filtered by edjanger.properties$container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangercommit[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
        --commitname=COMMIT        commit tag like REPOSITORY[:TAG]
 
        --commitmessage=MESSAG     commit message
 
        --commitauthor=MESSAG      commit author
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    commit_options                 "docker commit" options for a running container (see docker commit --help)
    docker_command
           Display docker command.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangercommit --help
```
## Command edjangercompose
```bash
 Description
   Generate docker-compose.yaml from all local edjanger.poperties.
 
 Usage
    edjangercompose
 
 
 Usage
   edjangercompose[option]
 
 Options
    -h, --help
           Display help.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangercompose --help
```
## Command edjangercopy
```bash
 Description
    Copy files/folders between a container and the local filesystem.
    
    Filtered by edjanger.properties$container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangercopy[option]
 
 Options
    -h, --help
           Display help.
 
        --fromcontainer
           Copy file(s) from container to host.
 
        --fromhost
           Copy file(s) from host to container.
 
        --sourcepath=PATH
           Path to file(s) or folder to copy.
 
        --destinationpath=PATH
           Path where to copy file(s) or folder to copy.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    copy_options
           Options to copy files/folders between a container and the local 
           filesystem.
 
    docker_command
           Options of "docker cp" for a running container (see docker cp --help).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangercopy --help
```
## Command edjangercreate
```bash
 Description
    Create a new container.
    
    Filtered by edjanger.properties$container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangercreate[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run
      Bash command(s) to run.
 
    container_hostname
      Container host name (option -h, --hostname string for docker run).
 
    container_privilege
      Give extended privileges to this container (option --privileged for 
      docker run).
 
    container_remove
      Automatically remove the container when it exits (option --rm for 
      docker run).
 
    container_addhost
      Add a custom host-to-IP mapping (host:ip) (default []) (option 
      --add-host value for docker run).
 
    environment_variables
      Environnment variables.
 
    exposed_ports
      Exposed port.
 
    image_name
           Image name.
    linked_containers
      Linked container.
 
    network_settings
      All network settings options.
 
    run_other_options
      All other available options for "docker create".
 
    runtime_constraints_on_resources
      Runtime constraints on resources.
 
    volumes_from
      Expose volumes from another container into current container (option 
      --volumes-from value of docker run).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangercreate --help
```
## Command edjangerdiff
```bash
 Description
    Inspect changes on a container's filesystem.
    
    Filtered by edjanger.properties$container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangerdiff[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
      Container name.
 
    diff_options
      Options of "docker diff" for a running container (see docker diff --help)
 
    docker_command
           Display docker command.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerdiff --help
```
## Command edjangerevents
```bash
 Description
    Get real time events for a container.
    
    Filtered by edjanger.properties$container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangerevents[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    events_options
           Options of "docker events" for a running container (see docker events --help)
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerevents --help
```
## Command edjangerexec
```bash
 Description
    Run a command in a running container.
    
    Filtered by edjanger.properties$container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangerexec[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
        --shellcommand=COMMAND     additionnal command to execute
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    exec_options
           Options of "docker exec" for a running container (see docker exec --help)
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerexec --help
```
## Command edjangerexport
```bash
 Description
    Export a container's filesystem as a tar archive.
    Filtered by edjanger.properties$container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangerexport[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    export_options
           Options of "docker export" options for a running container (see 
           docker export --help).
 
    docker_command
           Display docker command.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerexport --help
```
## Command edjangerhelp
```bash
 Description
   Print list of all available edjanger commands. 
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
 
 Usage
   edjangerhelp [option] [config | parameters]
 
 Options
   config
           Print parameters used by edjanger commands.
 
   [edjanger short command]
           Print help for this edjanger command.
 
   -h, --help
           Display help.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerhelp --help
```
## Command edjangerhistory
```bash
 Description
   Show the history of an image.
    
   Filtered by edjanger.properties$image_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerhistory[option]
 
 Options
    -h, --help
           Display help.
 
 Parameters (edjanger.properties):
    docker_command
           Display docker command.
 
    history_options
           Options of "docker history" for a running container (see docker history --help)
 
    image_name
           Image name.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerhistory --help
```
## Command edjangerimages
```bash
 Description
    List images.
    
    Filtered by edjanger.properties$image_name
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangerimages[option]
 
 Options
    -h, --help
           Display help.
 
 Parameters (edjanger.properties):
    docker_command
           Display docker command.
 
    image_name
           Image name.
 
    images_options
           Options of "docker images" for a running container (see docker images 
           --help).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerimages --help
```
## Command edjangerimport
```bash
 Description
    Import the contents from a tarball to create a filesystem image.
    
    Filtered by edjanger.properties$container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangerimport[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    import_options
           Options of "docker import" for a running container (see docker 
           import --help).
 
    docker_command
           Display docker command.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerimport --help
```
## Command edjangerinit
```bash
 Description
   create a edjanger project with following files
     - edjanger.template (example)
     - configuration.properties (example)
     - build/Dockerfile (empty example)
 
   File edjanger.properties is build with previous template and configuration 
   files with following command :
     - edjangertemplate configure=configuration
 
 Usage
   edjangerinit[option]
 
 Options
    -h, --help
           Display help.
 
        --template=TEMPLATE-NAME
           Initialize with the name of the template which could be chozen 
           from the --templatelist option.
 
        --templatelist
           Display a comapct list of all available templates.
 
        --templatelistinfo
           Display a list of all available templates with details.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerinit --help
```
## Command edjangerinspect
```bash
 Description 
   Return low-level information on a container, image or task.
    
   Filtered by edjanger.properties$container_name and edjanger.properties$image_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerinspect[option]
 
 Options
    -h, --help
           Display help.
 
        --container
           Apply inspect to container.
 
        --image
           Apply inspect to image.
 
        --index=INDEX
           Index of the container name (used only with option --container).
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
    inspect_options
 
           Options of "docker inspect" for a running container (see docker 
           inspect --help).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerinspect --help
```
## Command edjangerkill
```bash
 Description 
   Kill one or more running containers.
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerkill[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    kill_options
           Options of "docker kill" for a running container (see docker kill 
           --help).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerkill --help
```
## Command edjangerlogs
```bash
 Description
   Fetch the logs of a container. 
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerlogs[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    logs_options
           Options "docker logs" for a running container (see docker logs 
           --help).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerlogs --help
```
## Command edjangerpause
```bash
 Description
    Pause all processes within one or more containers.
    
    Filtered by edjanger.properties$container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangerpause[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    pause_options
           Options of "docker pause" for a running container (see docker 
           pause --help).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerpause --help
```
## Command edjangerportdesc
```bash
 Description
   Description of network port numbers for a given port number parameter.
 
 Usage
   edjangerportdesc[option]
 
 Options
    -h, --help
           Display help.
 
        --port=PORT                  index number of the port
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerportdesc --help
```
## Command edjangerports
```bash
 Description List port mappings or a specific mapping for all container.
 
 Usage
   edjangerports[option]
 
 Options
    -h, --help
           Display help.
 
        --list                     print list of exposed ports for all running containers
 
        --all                      print list of ports information for all containers
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
    ports_options                  "docker ports" options for a running container (see docker ports --help)
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerports --help
```
## Command edjangerps
```bash
 Description 
   List all running container(s).
   
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerps[option]
 
 Options
    -h, --help
           Display help.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    ps_options
           Options of "docker ps" for a running container (see docker ps 
           --help).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerps --help
```
## Command edjangerpsa
```bash
 Description
   List all container(s).
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerpsa[option]
 
 Options
    -h, --help
           Display help.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.

    ps_options
           Options of "docker ps" for a running container (see docker ps 
           --help).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerpsa --help
```
## Command edjangerrename
```bash
 Description
    Rename a container.
    Filtered by edjanger.properties$container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangerrename[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
        --name=NAME
           New name of the container.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    rename_options
           Options of "docker rename" for a running container (see docker 
           rename --help).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrename --help
```
## Command edjangerrestart
```bash
 Description
   Restart one or more containers.
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerrestart[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    restart_options
           Options of "docker restart" for a running container (see docker 
           restart --help).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrestart --help
```
## Command edjangerrm
```bash
 Description
   Remove one or more containers.
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerrm[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
        --all
           Delete all containers for the container_name pattern.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    rm_options
           Options of "docker rm" for a running container (see docker rm --help)
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrm --help
```
## Command edjangerrmexiteds
```bash
 Description
   Remove all exited container.
 
 Usage
   edjangerrmexiteds[option]
 
 Options
    -h, --help
           Display help.
 
 Parameters (edjanger.properties):
    docker_command
           Display docker command.
 
    rm_options
           Options of "docker rm" for a running container (see docker rm --help)
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmexiteds --help
```
## Command edjangerrmi
```bash
 Description
   Remove one or more images. Filtered by edjanger.properties$image_name.
   File edjanger.properties must be present in path.
 
 Usage
   edjangerrmi[option]
 
 Options
    -h, --help
           Display help.
 
 Parameters (edjanger.properties):
    docker_command
           Display docker command.
 
    force_rmiF
           Force image deletion.
 
    image_name
           Image name.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmi --help
```
## Command edjangerrmorphanedvolumes
```bash
 Description
   Remove all orphaned volumes.
 
 Usage
   edjangerrmorphanedvolumes[option]
 
 Options
    -h, --help
           Display help.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrmorphanedvolumes --help
```
## Command edjangerrun
```bash
 Description
   Run a command in a new container. 
    
   Filtered by edjanger.properties$image_name and $container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerrun[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run
      Bash command(s) to run.
 
    container_hostname
      container host name (option -h, --hostname string for docker run).
 
    container_privilege
      Give extended privileges to this container (option --privileged for 
      docker run).
 
    container_remove
      Automatically remove the container when it exits (option --rm for 
      docker run).
 
    container_addhost
      Add a custom host-to-IP mapping (host:ip) (default []) (option 
      --add-host value for docker run).
 
    environment_variables
      Environnment variables.
 
    exposed_ports
      Exposed port.
 
    image_name
           Image name.
 
    linked_containers
      Linked container.
 
    network_settings
      All network settings options.
 
    run_other_options
      All other available options for docker run.
 
    runtime_constraints_on_resources
      Runtime constraints on resources.
 
    volumes_from
      Expose volumes from another container into current container (option 
      --volumes-from value of docker run).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerrun --help
```
## Command edjangerruni
```bash
 Description
   Run interactively a command in a new container.
    
   Filtered by edjanger.properties$image_name and $container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerruni[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX                index of the container name
 
 Parameters (edjanger.properties):
    command_run
      Bash command(s) to run.
 
    container_hostname
      container host name (option -h, --hostname string for docker run).
 
    container_privilege
      Give extended privileges to this container (option --privileged for 
      docker run).
 
    container_remove
      Automatically remove the container when it exits (option --rm for 
      docker run).
 
    container_addhost
      Add a custom host-to-IP mapping (host:ip) (default []) (option 
      --add-host value for docker run).
 
    environment_variables
      Environnment variables.
 
    exposed_ports
      Exposed port.
 
    image_name
           Image name.
 
    linked_containers
      Linked container.
 
    network_settings
      All network settings options.
 
    run_other_options
      All other available options for docker run.
 
    runtime_constraints_on_resources
      Runtime constraints on resources.
 
    volumes_from
      Expose volumes from another container into current container (option 
      --volumes-from value of docker run).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerruni --help
```
## Command edjangerstart
```bash
 Description
   Start one or more stopped containers.
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerstart[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    start_options
           Options of "docker start" for a running container.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstart --help
```
## Command edjangerstats
```bash
 Description
   Display a live stream of container(s) resource usage statistics.
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerstats[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    stats_options
           Options of "docker stats" for a running container.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstats --help
```
## Command edjangerstop
```bash
 Description 
    Stop one or more running containers.
    
    Filtered by edjanger.properties$container_name.
    File edjanger.properties must be present in path.
    By default executed on last container if no index specified.
 
 Usage
   edjangerstop[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    stop_options
           Options of "docker stop" for a running container.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerstop --help
```
## Command edjangertag
```bash
 Description 
   Tag an image into a repository.
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangertag[option]
 
 Options
    -h, --help
           Display help.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    tag_options
           Options of "docker tag" for a running container.
 
    docker_command
           Display docker command.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangertag --help
```
## Command edjangertemplate
```bash
 Description 
   Manage templates for edjanger.
   A template is a zip archive which contains edjanger configuration files:
   - edjanger.template
   - edjanger.properties
   - *.properties
   - build folder read from each *.properties (injection in template to read property build_path)
   - additional file pattern defined in option --savepattern="*.*"
 
   Following operations are available:
   - list available template's archive in the local database (short or detailed list)
   - unarchive a template with an archive name retrieve from the list
   - save a template in a local archive from current sources
   - delete a template from the a local archive storage
 
 Usage
   edjangertemplate[option]
 
 Options
    -h, --help
           Display help.
 
        --configure=CONFIG-NAME
           Properties file containing variables to be replaced in 
           edjanger.template to create edjanger.properties
 
        --delete
           Delete named archive 
           Must be combined with option --name=TEMPLATE-NAME
 
        --init
           Initialize with the name of the template which could be chozen 
           from the --list option.
           Must be combined with option --name=TEMPLATE-NAME.
 
        --list
           Display a compact list of all available templates.
 
        --listinfo
           Display a list of all available templates with details.
 
        --name=TEMPLATE-NAME
           Template name available from archive name list.
           Must be combined with options --init, --delete, --save.
 
        --save
           Save current directory as a template (template name is the hash 
           of the archive).
           Could be combined with option --name=TEMPLATE-NAME.
 
        --savepattern="PATTERNS with comma or semi-colon separator"
           Additionnal file pattern to save in the archive.
 
 Command lines example:
 
 Help:
    edjangertemplate --help
           Dispay help.
 Initialize a new template:
    edjangertemplate --init=demo_httpd
           initialize a nex template from the archive given by option --init.
 
 Load a template:
    edjangertemplate --configure=configuration
           Replace environement variables from file configuration.properties
           in edjanger.template to produce edjanger.properties file.
 
 Save a template:
    edjangertemplate --save
           Save all current configuration in a templating folder with an 
           hash identifiant (edjanger.*, scripts sh).
 
    edjangertemplate --save --name=demo_web
           Save all current configuration in a templating folder with the 
           template name "demo_web".
 
    edjangertemplate --save --name=demo_web --savepattern="*.html,*js,*.css"
           Save all current configuration in a templating folder with the 
           template name "demo_web" and save additional files.
 
 Print templates list:
    edjangertemplate --list
           Print the list off all stored templates with short name only.
 
 Print templates list:
    edjangertemplate --listinfo
           Print the list off all stored templates with detailed informations.
 
 Delete a template:
    edjangertemplate --delete --name=demo_web
           Remove the template from storage space defined in variable 
           templates_path from configuration file prefs.properties.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangertemplate --help
```
## Command edjangertop
```bash
 Description
   Display the running processes of a container.
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangertop[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    top_options
           Options of "docker top" for a running container.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangertop --help
```
## Command edjangerunalias
```bash
 Description
   Unalias all edjanger aliases.
 
 Usage
   edjangerunalias[option]
 
 Options
    -h, --help
           Display help.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerunalias --help
```
## Command edjangerunpause
```bash
 Description 
   Unpause all processes within one or more containers.
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerunpause[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    unpause_options
           Options of "docker unpause" for a running container.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerunpause --help
```
## Command edjangerupdate
```bash
 Description 
   Update configuration of one or more containers.
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerupdate[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    update_options
           Options of "docker update" for a running container.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerupdate --help
```
## Command edjangerupgrade
```bash
 Description : 
   Update script:
     - archive edjanger folder with date in a zip file with date timestamp
     - update edjanger : git pull origin master
 
 Usage
   edjangerupgrade[option]
 
 Options
    -h, --help
           Display help.
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
```
Note: help for this command could be retrieve by typing:
```bash
edjangerupgrade --help
```
## Command edjangerwait
```bash
 Description : 
   Block until a container stops, then print its exit code.
    
   Filtered by edjanger.properties$container_name.
   File edjanger.properties must be present in path.
   By default executed on last container if no index specified.
 
 Usage
   edjangerwait[option]
 
 Options
    -h, --help
           Display help.
 
        --index=INDEX
           Index of the container name.
 
 Parameters (edjanger.properties):
    container_name
           Container name.
 
    docker_command
           Display docker command.
 
    wait_options
           Options "docker wait" for a running container (see docker wait 
           --help).
 
 Licence & authors
    edjanger, The MIT License (MIT)
    Copyright (c) 2016 copyright pamtrak06@gmail.com
 
    -h, --help
           Display help.
```
Note: help for this command could be retrieve by typing:
```bash
edjangerwait --help
```
