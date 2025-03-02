#!/bin/bash

# Optionally add ports if needed: -p 8888:8888 -p 8080:8080
docker run  -it --rm \
    --privileged\
    --device=/dev/video0:/dev/video0 \
    -v /home/tony:/home/tony \
    cpp_env:latest
