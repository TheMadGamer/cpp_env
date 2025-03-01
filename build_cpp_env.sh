#!/bin/bash

docker build \
    --build-arg USER_ID=1001\
    --build-arg GROUP_ID=1001\
    --build-arg DEV_USER=tony\
    --build-arg DEV_GROUP=tony\
    -t cpp_env \
    .
