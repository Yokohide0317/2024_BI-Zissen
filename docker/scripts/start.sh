#!/bin/bash

set -eux

docker run -it \
  -p 2024:8888 \
  -v $PWD/notebooks/user01:/home/user01/notebook \
  -v $PWD/notebooks/user02:/home/user02/notebook \
  -v $PWD/notebooks/user03:/home/user03/notebook \
  -v $PWD/notebooks/user04:/home/user04/notebook \
  -v $PWD/notebooks/user05:/home/user05/notebook \
  -v $PWD/notebooks/user06:/home/user06/notebook \
  -v $PWD/notebooks/user07:/home/user07/notebook \
  -v $PWD/notebooks/user08:/home/user08/notebook \
  -v $PWD/notebooks/user09:/home/user09/notebook \
  -v $PWD/notebooks/user10:/home/user10/notebook \
  --rm \
  qiime2-hub
