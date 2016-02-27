source edocker.cfg
echo build image_name: ${image_name}...
if [ ! -d ${build_path} ]; then
  echo "Build path must exist and be a folder, configure variable build_path in edocker.cfg"
else
  docker build -t ${image_name} ${build_args} ${build_path}
fi
