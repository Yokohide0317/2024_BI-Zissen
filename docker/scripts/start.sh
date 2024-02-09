#!/bin/bash

set -eux

docker run -it \
  -p 2024:8888 \
  -v $PWD/notebooks:/opt/notebooks  \
  --rm \
  qiime2-hub
