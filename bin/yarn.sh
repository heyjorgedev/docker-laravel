#!/usr/bin/env bash

docker run --rm -it \
    -v $(pwd)/htdocs:/app \
    -w /app \
    node:8.12 \
    yarn $@
