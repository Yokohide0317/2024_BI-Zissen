#!/bin/bash

set -eux

docker image build -t qiime2-hub -f Dockerfile .
