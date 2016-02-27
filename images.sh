source edocker.cfg
echo "images with beginning name like:  ${image_name}..."
docker images | grep ${image_name}
