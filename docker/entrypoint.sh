#!/bin/bash -x

if [ ! -d /docs ]; then
    echo source path /docs not exist and no repo for building
    exit 1
fi

cd /docs
for item in conf.py _templates _static
do
    cp -r /opnfvdocs/docs/$item ./
done

# use the same procedure as verify Job
# [TODO]create a common macro can be consumed in Docker and Jenkins
sudo pip install virtualenv
virtualenv $WORKSPACE/venv
. $WORKSPACE/venv/bin/activate
pip install --upgrade pip
pip freeze
pip install tox
sed -i s,\-b\ html,\-b\ singlehtml,g tox.ini
tox -edocs

# copy the building result to host
if [ -d /output ]; then
    cp -R ./docs/_build /output
fi

