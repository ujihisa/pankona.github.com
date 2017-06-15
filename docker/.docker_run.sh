#!/bin/bash -eu

docker run \
    -it \
    -v `pwd`/..:/workspace \
    -u `id -u`:`id -g` \
    -e HOME=/home/docker \
    -p 4000:4000 \
    pankona/octopress "$1"


