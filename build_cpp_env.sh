#!/bin/bash

docker build \
    --build-arg DEV_UID=1001\
    --build-arg DEV_GID=1001\
    --build-arg DEV_USER=tony\
    --build-arg DEV_GROUP=tony\
    -t cpp_env \
    .
