# summer-school2023

## Start Server

```bash

# Build Docker image
bash script/build.sh

# Run and attach to the Container
bash script/start.sh

# Handout sequences.fasta
bash /tmp/handouts.sh

# Start JupyterHub server
unset http_proxy
conda activate qiime2-amplicon-2023.9
jupyterhub -f jupyterhub_config.py --port 8888 --ip 0.0.0.0 --no-ssl


```

## Login

Go to `<ip addr>:2024`

| Key | Value |
| :---: | :---: |
| User | user{01..10} |
| Password | 2024qiime2 |



