#!/usr/bin/env bash

docker run --rm -it \
    -v $(pwd)/htdocs:/opt \
    -w /opt \
    shippingdocker/php-composer:latest \
    composer $@
