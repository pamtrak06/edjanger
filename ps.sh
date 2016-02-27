source edocker.cfg
echo "ps container with beginning name like:  ${container_name}..."
docker ps -a | grep ${container_name}
