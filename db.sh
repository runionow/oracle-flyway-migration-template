#!/bin/bash

# Oracle 23ai Docker container configuration
CONTAINER_NAME="oracle23ai"
ORACLE_PASSWORD="password"
ORACLE_IMAGE="container-registry.oracle.com/database/free:latest"

function start_container() {
    if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
      echo "Container $CONTAINER_NAME already exists. Starting container..."
      docker start $CONTAINER_NAME
    else
      echo "Creating and starting Oracle 23ai Docker container..."
      docker run -d --name $CONTAINER_NAME -p 1521:1521 -e ORACLE_PWD=$ORACLE_PASSWORD -e ENABLE_ARCHIVELOG=true -e ENABLE_FORCE_LOGGING=true $ORACLE_IMAGE
    fi

    # Show container status
    docker ps | grep $CONTAINER_NAME
}

function stop_container() {
    if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
        echo "Stopping container $CONTAINER_NAME..."
        docker stop $CONTAINER_NAME
    else
        echo "Container $CONTAINER_NAME is not running."
    fi
}

case "$1" in
    start)
        start_container
        ;;
    stop)
        stop_container
        ;;
    restart)
        stop_container
        start_container
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac
