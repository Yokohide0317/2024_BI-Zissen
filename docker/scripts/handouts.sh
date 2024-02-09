#!/bin/bash

set -eux

#user="${1}"

while read user; do
  #cp /opt/notebooks/sequences.fasta /home/${user}/
  cp -r /diverse-tutorial /home/${user}/notebook/diverse-tutorial
  chown -R ${user}: /home/${user}/notebook
done < /tmp/users.txt
