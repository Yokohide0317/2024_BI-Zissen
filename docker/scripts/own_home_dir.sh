#!/bin/bash

while read line; do
    chown -R ${line}:${line} /home/${line}
done < /tmp/users.txt
