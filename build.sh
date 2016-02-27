source edocker.cfg
echo build image_name: ${image_name}...
build_args=${environment_variables//-e/--build-arg}
docker build -t ${image_name} ${build_args} ${build_path}
