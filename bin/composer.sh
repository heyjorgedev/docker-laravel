#!/usr/bin/env bash

if [ -z "$DOCKER_EXEC_IDS" ]; then
    DOCKER_EXEC_IDS="`id -u`:`id -g`"
fi

docker run --rm -it \
    -v $(pwd)/htdocs:/opt \
    -w /opt \
    -u ${DOCKER_EXEC_IDS} \
    shippingdocker/php-composer:latest \
    composer $@
