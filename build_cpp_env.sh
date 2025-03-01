#!/bin/bash

docker build --build-arg USER_ID=1001 --build-arg GROUP_ID=1000 -t cpp_env .
