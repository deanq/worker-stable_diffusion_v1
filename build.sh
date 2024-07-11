#!/bin/bash

# Read .env file and construct --build-arg options
set -o allexport
source .env
set +o allexport

BUILD_ARGS=$(awk -F= '{print "--build-arg " $1}' .env | xargs)

docker build $BUILD_ARGS -t $MODEL_TAG .
