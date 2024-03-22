#!/bin/bash

if [ -z ${SKIPTOOLINSTALL+x} ]; then
    echo "running"
fi

echo $( dirname -- "${BASH_SOURCE[0]}" )