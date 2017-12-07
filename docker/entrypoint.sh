#!/bin/bash -x

if [ ! -d /docs ]; then
    echo source path /docs not exist and no repo for building
    exit 1
fi

cd /docs
mkdir -p ./_build
for item in conf.py _templates _static
do
    cp -r /opnfvdocs/docs/$item ./
done

sphinx-build -b $build -n -d /docs/doctrees /docs/ ./_build/$build

if [ -d /output ]; then
    cp -R ./_build /output
fi

