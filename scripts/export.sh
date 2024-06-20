#!/bin/bash

IMAGE=$1

# check if user has provided an argument
if [[ $# -eq 0 ]] ; then
    echo 'Please provide a docker image name as an argument'; exit 1;
fi

# convert a local docker image to a .sqsh file
enroot import dockerd://${IMAGE}
