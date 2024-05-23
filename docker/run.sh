IMAGE_NAME="ultralytics/ultralytics:latest"

 
HOST_VOLUME_PATH="" ### diana data path

 
CONTAINER_VOLUME_PATH="/data"

docker run -it --gpus all -v ${HOST_VOLUME_PATH}:${CONTAINER_VOLUME_PATH} ${IMAGE_NAME} bash -c 'cd /data && exec bash'
