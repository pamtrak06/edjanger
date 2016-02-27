source edocker.cfg
idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+0" | bc)
echo "logs container name:  ${container_name}_${idx}..."
docker logs ${container_name}_${idx}
