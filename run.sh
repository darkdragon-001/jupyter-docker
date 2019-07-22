#!/bin/sh

# sharing directory
mkdir -p notebooks

# run jupyter
docker run \
    -p 8888:8888 \
    -v "$PWD/notebooks:/home/notebooks" \
    --rm \
    --name jupyter \
    jupyter:disco \
    jupyter notebook \
    '--notebook-dir=/home/notebooks' \
    --allow-root \
    --ip=0.0.0.0 \
    --port=8888 \
    --no-browser
