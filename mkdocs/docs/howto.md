# How to

## How to : basic commands

All those command are compact and useful docker shortcuts !

Those aliases overrides standard docker commands for container and images.

|                   | Description                                                                     | IMAGE | CONTAINER |
 ------------------ | ------------------------------------------------------------------------------- | ----- | --------- |
| `edjangerbuild`   | "docker build" with parameters read from local edjanger.properties.             |   X   |           |
| `edjangerclean`   | clean all images with none attribute (run docker rmi with "none" filter).       |   X   |           |
| `edjangercopy`    | "docker copy" with parameters read from local edjanger.properties.              |       |     X     |
| `edjangerexec`    | "docker exec" with parameters read from local edjanger.properties.              |       |     X     |
| `edjangerimages`  | "docker exec" with parameters read from local edjanger.properties.              |   X   |     X     |
| `edjangerinspect` | "docker inspect" with parameters read from local edjanger.properties.           |       |     X     |
| `edjangerlogs`    | "docker logs" with parameters read from local edjanger.properties.              |       |     X     |
| `edjangerps`      | "docker ps" with parameters read from local edjanger.properties.                |       |     X     |
| `edjangerpsa`     | "docker ps -a" with parameters read from local edjanger.properties.             |       |     X     |
| `edjangerrename`  | "docker rename" with parameters read from local edjanger.properties.            |       |     X     |
| `edjangerrestart` | "docker restart" with parameters read from local edjanger.properties.           |       |     X     |
| `edjangerm`       | "docker rm" with parameters read from local edjanger.properties.                |       |     X     |
| `edjangermi`      | "docker rmi" with parameters read from local edjanger.properties.               |   X   |           |
| `edjangerun`      | "docker run -d" with parameters read from local edjanger.properties.            |       |     X     |
| `edjangeruni`     | "docker run -it" with parameters read from local edjanger.properties.           |       |     X     |
| `edockestart`     | "docker start" with parameters read from local edjanger.properties.             |       |     X     |
| `edockestop`      | "docker stop" with parameters read from local edjanger.properties.              |       |     X     |
| `edjangertag`     | "docker tag" with parameters read from local edjanger.properties.               |   X   |           |
| `edjangertop`     | "docker top" with parameters read from local edjanger.properties.               |       |     X     |

## How to : advanced

|                     | Description                                                                   |
| ------------------- | ----------------------------------------------------------------------------- |
| `edjangerports`     | "docker ports" on all running container.                                      |
| `edjangerportdesc`  | description of port.                                                          |
| `edjangermexiteds`  | docker rm with list of container with exited status.                          |


## How to : useful

|                     | Description                                                                   |
| ------------------- | ----------------------------------------------------------------------------- |
| `edjangerabout`     | about script for edjanger.                                                    |
| `edjangercheck`     | check missing parameters in edjanger.properties.                              |
| `edjangeralias`     | print edjanger aliases.                                                       |
| `edjangerunalias`   | help script for edjanger command.                                             |


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