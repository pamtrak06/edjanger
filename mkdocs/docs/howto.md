# How to

## How to : basic

All those command are compact and useful docker shortcuts !

Those aliases overrides standard docker commands for container and images.

|                   | Description                                                                     | IMAGE | CONTAINER |
 ------------------ | ------------------------------------------------------------------------------- | ----- | --------- |
| [edjangerattach](http://127.0.0.1:8000/api/#command-edjangerattach)  | "docker attach" with parameters read from local edjanger.properties.            |       |     X     |
| [edjangeredjangerbuild](http://127.0.0.1:8000/api/#command-edjangerbuild)  | "docker build" with parameters read from local edjanger.properties.             |   X   |           |
| [edjangeredjangercommit](http://127.0.0.1:8000/api/#command-edjangercommit)  | "docker commit" with parameters read from local edjanger.properties.            |   X   |     X     |
| [edjangeredjangercopy](http://127.0.0.1:8000/api/#command-edjangercopy)    | "docker copy" with parameters read from local edjanger.properties.              |       |     X     |
| [edjangeredjangercreate](http://127.0.0.1:8000/api/#command-edjangercreate)  | "docker create" with parameters read from local edjanger.properties.            |   X   |           |
| [edjangeredjangerdiff](http://127.0.0.1:8000/api/#command-edjangerdiff)    | "docker diff" with parameters read from local edjanger.properties.              |       |     X     |
| [edjangeredjangerevents](http://127.0.0.1:8000/api/#command-edjangerevents)  | "docker events" with parameters read from local edjanger.properties.            |       |     X     |
| [edjangeredjangerexec](http://127.0.0.1:8000/api/#command-edjangerexec)    | "docker exec" with parameters read from local edjanger.properties.              |       |     X     |
| [edjangeredjangerexport](http://127.0.0.1:8000/api/#command-edjangerexport)  | "docker port" with parameters read from local edjanger.properties.              |       |     X     |
| [edjangeredjangerhistory](http://127.0.0.1:8000/api/#command-edjangerhistory) | "docker history" with parameters read from local edjanger.properties.           |   X   |           |
| [edjangeredjangerimages](http://127.0.0.1:8000/api/#command-edjangerimages)  | "docker images" with parameters read from local edjanger.properties.            |   X   |     X     |
| [edjangeredjangerimport](http://127.0.0.1:8000/api/#command-edjangerimport)  | "docker import" with parameters read from local edjanger.properties.            |   X   |           |
| [edjangeredjangerinspect](http://127.0.0.1:8000/api/#command-edjangerinspect) | "docker inspect" with parameters read from local edjanger.properties.           |   X   |     X     |
| [edjangeredjangerkill](http://127.0.0.1:8000/api/#command-edjangerkill)    | "docker kill" with parameters read from local edjanger.properties.              |       |     X     |
| [edjangeredjangerlogs](http://127.0.0.1:8000/api/#command-edjangerlogs)    | "docker logs" with parameters read from local edjanger.properties.              |       |     X     |
| [edjangeredjangerpause](http://127.0.0.1:8000/api/#command-edjangerpause)  | "docker pause" with parameters read from local edjanger.properties.             |       |     X     |
| [edjangeredjangerps](http://127.0.0.1:8000/api/#command-edjangerps)      | "docker ps" with parameters read from local edjanger.properties.                |       |     X     |
| [edjangeredjangerpsa](http://127.0.0.1:8000/api/#command-edjangerpsa)     | "docker ps -a" with parameters read from local edjanger.properties.             |       |     X     |
| [edjangeredjangerrename](http://127.0.0.1:8000/api/#command-edjangerrename)  | "docker rename" with parameters read from local edjanger.properties.            |       |     X     |
| [edjangeredjangerrestart](http://127.0.0.1:8000/api/#command-edjangerrestart) | "docker restart" with parameters read from local edjanger.properties.           |       |     X     |
| [edjangeredjangerm](http://127.0.0.1:8000/api/#command-edjangerrm)       | "docker rm" with parameters read from local edjanger.properties.                |       |     X     |
| [edjangeredjangermi](http://127.0.0.1:8000/api/#command-edjangerrmi)      | "docker rmi" with parameters read from local edjanger.properties.               |   X   |           |
| [edjangeredjangerun](http://127.0.0.1:8000/api/#command-edjangerrun)      | "docker run -d" with parameters read from local edjanger.properties.            |       |     X     |
| [edjangeredjangeruni](http://127.0.0.1:8000/api/#command-edjangerruni)     | "docker run -it" with parameters read from local edjanger.properties.           |       |     X     |
| [edjangeredockestart](http://127.0.0.1:8000/api/#command-edjangerstart)     | "docker start" with parameters read from local edjanger.properties.             |       |     X     |
| [edjangeredockestats](http://127.0.0.1:8000/api/#command-edjangerstats)     | "docker stats" with parameters read from local edjanger.properties.             |       |     X     |
| [edjangeredockestop](http://127.0.0.1:8000/api/#command-edjangerstop)      | "docker stop" with parameters read from local edjanger.properties.              |       |     X     |
| [edjangeredjangertag](http://127.0.0.1:8000/api/#command-edjangertag)     | "docker tag" with parameters read from local edjanger.properties.               |   X   |           |
| [edjangeredjangertop](http://127.0.0.1:8000/api/#command-edjangertop)     | "docker top" with parameters read from local edjanger.properties.               |       |     X     |
| [edjangeredjangerunpause](http://127.0.0.1:8000/api/#command-edjangerpause) | "docker unpause" with parameters read from local edjanger.properties.           |       |     X     |
| [edjangeredjangerupdate](http://127.0.0.1:8000/api/#command-edjangerupdate)  | "docker update" with parameters read from local edjanger.properties.            |       |     X     |
| [edjangeredjangerwait](http://127.0.0.1:8000/api/#command-edjangerwait)    | "docker wait" with parameters read from local edjanger.properties.              |       |     X     |

## How to : advanced

|                     | Description                                                                   | IMAGE | CONTAINER |
| ------------------- | ----------------------------------------------------------------------------- |
| [edjangeredjangerclean](http://127.0.0.1:8000/api/#command-edjangerclean)     | clean all images with none attribute (run docker rmi with "none" filter).     |   X   |           |
| [edjangeredjangerports](http://127.0.0.1:8000/api/#command-edjangerports)     | "docker ports" on all running container.                                      |       |     X     |
| [edjangeredjangermexiteds](http://127.0.0.1:8000/api/#command-edjangerrmexiteds)  | docker rm with list of container with exited status.                          |       |     X     |
| [edjangeredjangerrmorphanedvolumes](http://127.0.0.1:8000/api/#command-edjangerrmorphanedvolumes)  | remove all orphaned volumes.                                         |       |     X     |


## How to : useful

|                     | Description                                                                   |
| ------------------- | ----------------------------------------------------------------------------- |
| [edjangeredjangerabout](http://127.0.0.1:8000/api/#command-edjangerabout)     | about script for edjanger.                                                    |
| [edjangeredjangeralias](http://127.0.0.1:8000/api/#command-edjangeralias)     | print edjanger aliases.                                                       |
| [edjangeredjangercheck](http://127.0.0.1:8000/api/#command-edjangercheck)     | check missing parameters in edjanger.properties.                              |
| [edjangeredjangercompose](http://127.0.0.1:8000/api/#command-edjangercompose)   | create docker-compose.yaml from all edjanger.propeorties in current path.     |
| [edjangeredjangerhelp](http://127.0.0.1:8000/api/#command-edjangerhelp)      | help for all commands.                                                        |
| [edjangeredjangerinit](http://127.0.0.1:8000/api/#command-edjangerinit)      | initialize an edjanger project.                                               |
| [edjangeredjangerportdesc](http://127.0.0.1:8000/api/#command-edjangerportdec)  | description of port.                                                          |
| [edjangeredjangertemplate](http://127.0.0.1:8000/api/#command-edjangertemplate)  | generate edjanger.poperties from edjanger.template.                           |
| [edjangeredjangerunalias](http://127.0.0.1:8000/api/#command-edjangerunalias)   | help script for edjanger command.                                             |
| [edjangeredjangerupgrade](http://127.0.0.1:8000/api/#command-edjangerupgrade)   | upgrade edjanger.                                                             |


**Check missing parameters in edjanger.properties**

<iframe width="100%" height="300" src="//jsfiddle.net/pamtrak06/9wvxa133/35/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

Remark : even when parameters are missing in edjanger.properties, they are initialized empty.


## How to : compose

From an existing edjanger root path project structure, call edcokercompose.
Script will parse all edjanger.properties in subfolders and create docker-compose.yaml at upper path.

```bash
edjangercompose
vi docker-compose.yaml
```

<iframe width="100%" height="300" src="//jsfiddle.net/pamtrak06/9wvxa133/34/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>
<iframe width="100%" height="300" src="//jsfiddle.net/pamtrak06/9wvxa133/33/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

## How to : template

> Prerequisities : install gettext (for envsubst)

- Download and try example from [https://github.com/pamtrak06/edjanger/tree/master/scripts/templates/templating](https://github.com/pamtrak06/edjanger/tree/master/scripts/templates/templating), run:

- Deploy 2 apache web sever (web1 and web2) with specific ports and shared volumes for a "production" environement.
    ```bash
    ./deploy_run.sh --properties=production 5
    ```

- Deploy 2 apache web server (web1 and web2) with specific ports and shared volumes for an "integration" environement.
    ```bash
    ./deploy_run.sh --properties=integration 5
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

```
edjangertemplate --properties=<name>.properties
```

Example of edjangertemplate invocation

```
edjangertemplate --properties=production.properties
```

Example of production.properties content

```
#!/bin/bash
export HTTPD_PORT_80=80
export HTTPD_PORT_443=443
```

Example of edjanger.template content

```
#exposed_ports:exposed port
exposed_ports="-p ${HTTPD_PORT_80}:80 -p ${HTTPD_PORT_443}:443"
```

Script will find all edjanger.template and replace variables from root or folder(s) configuration(s) file(s) to produce edjanger.properties files.

Example of edjanger.properties produced

```
#exposed_ports:exposed port
exposed_ports="-p 80:80 -p 443:443"
```

## How to : crontab

Configure automatic container restart at boot

To configure automatic restart of container at boot, configure edjanger.properties files :
- activate cron_start=true to start existing container at boot
- activate cron_build=true to build and start a new container at boot

Configure crontab with following parameters

```
crontab -e
@reboot {edjangerpath}/cron_build_start.sh {edjanger properties path}
@reboot {edjangerpath}/cron_start_only.sh {edjanger properties path}
```

Example:

```
crontab -e
@reboot /opt/edjanger/scripts/cron_build_start.sh /root/workspace/docker
@reboot /opt/edjanger/scripts/cron_start_only.sh /root/workspace/docker
```