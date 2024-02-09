FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

# {{{ apt
RUN apt update && \
    apt install -y wget vim unzip screenfetch pigz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# }}}

# {{{ Qiime2
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge-pypy3-Linux-x86_64.sh -O /tmp/Miniforge-pypy3-Linux-x86_64.sh && \
    bash /tmp/Miniforge-pypy3-Linux-x86_64.sh -bup /opt/miniforge && \
    rm /tmp/Miniforge-pypy3-Linux-x86_64.sh && \
    wget https://data.qiime2.org/distro/amplicon/qiime2-amplicon-2023.9-py38-linux-conda.yml -O /tmp/qiime2-amplicon-2023.9-py38-linux-conda.yml

ENV PATH /opt/miniforge/bin:$PATH

# install packages


ARG env_name="qiime2-amplicon-2023.9"
ENV CONDA_DEFAULT_ENV ${env_name}
ENV PATH /opt/miniforge/envs/${env_name}/bin:$PATH

RUN source /opt/miniforge/etc/profile.d/conda.sh && \
    mamba env create -n ${env_name} --file /tmp/qiime2-amplicon-2023.9-py38-linux-conda.yml && \
    rm /tmp/qiime2-amplicon-2023.9-py38-linux-conda.yml && \
    echo "mamba activate ${env_name}" >> ~/.bashrc

# JupyterHub
RUN source /opt/miniforge/etc/profile.d/conda.sh && \
    mamba install -y -c conda-forge jupyterhub jupyterlab notebook jupyter_client && \
    mamba clean -i -t -y && \
    mamba init bash

# }}}

# {{{ Seqfu

WORKDIR /tmp
RUN wget https://github.com/telatin/seqfu2/releases/download/v1.20.0/SeqFu-v1.20.0-Linux-x86_64.zip -O /tmp/SeqFu-v1.20.0-Linux-x86_64.zip && \
    unzip SeqFu-v1.20.0-Linux-x86_64.zip && \
    mv seqfu /usr/local/bin/ && \
    rm -r /tmp/SeqFu-v1.20.0-Linux-x86_64*

# csvlens
RUN wget https://github.com/YS-L/csvlens/releases/download/v0.6.0/csvlens-x86_64-unknown-linux-gnu.tar.xz -O /tmp/csvlens-x86_64-unknown-linux-gnu.tar.xz && \
    tar Jxfv csvlens-x86_64-unknown-linux-gnu.tar.xz && \
    mv csvlens-x86_64-unknown-linux-gnu/csvlens /usr/local/bin/ && \
    rm -r /tmp/csvlens-x86_64-unknown-linux-gnu*


# }}}

# {{{ MyScripts
COPY scripts/make_users.sh /tmp/
COPY scripts/users.txt /tmp/
COPY scripts/start_jupyter.sh /tmp/
COPY scripts/handouts.sh /tmp/
COPY scripts/jupyterhub_config.py /

COPY handouts/diverse-tutorial /diverse-tutorial

# create users

RUN user="jupyterhub_admin" && \
     pw="password-0" && \
     useradd -m $user && \
     echo "${user}:${pw}" | chpasswd && \
     mkdir -p -m 777 /home/${user}/notebook && \
     chown ${user}: /home/${user}/notebook

RUN bash /tmp/make_users.sh
# }}}
#RUN bash /tmp/handouts.sh

WORKDIR /
