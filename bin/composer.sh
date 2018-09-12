#!/usr/bin/env bash

docker run --rm -it \
    -v $(pwd)/src:/opt \
    -w /opt \
    shippingdocker/php-composer:latest \
    composer $@
