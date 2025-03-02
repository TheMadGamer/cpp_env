#!/bin/bash

# Optionally add ports if needed: -p 8888:8888 -p 8080:8080
docker run  -it --rm \
    --privileged \
    -e "DISPLAY=$DISPLAY" \
    -v "$HOME/.Xauthority:$HOME/.Xauthority:ro" \
    -v /home/tony:/home/tony \
    -v /dev:/dev \
    --device=/dev/video0:/dev/video0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    cpp_env:latest
