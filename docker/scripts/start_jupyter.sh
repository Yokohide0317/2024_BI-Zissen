#!/bin/bash

set -eux

unset http_proxy

mamba activate qiime2-amplicon-2023.9
jupyterhub -f /jupyterhub_config.py --port 8888 --ip 0.0.0.0 --no-ssl
