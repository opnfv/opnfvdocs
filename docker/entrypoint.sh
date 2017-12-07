#!/bin/bash -e

#if repo is existed, git clone it
if [ ! -z $repo ]; then
    rm -rf /docs/workspace
    git clone -b ${BRANCH} $repo /docs/workspace
    cd /docs/workspace
elif [ ! -d /docs ]; then
    echo source path /docs not exist and no repo for download
    exit
else
    cd /docs
fi

mkdir -p ./_build

sphinx-build -b html -n -d /docs/doctrees /docs/ ./_build/html

if [ -d /output ]; then
    cp -R ./_build /output
fi

