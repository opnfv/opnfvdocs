FROM ubuntu:14.04

MAINTAINER Julien Zhang <julienjut@gmail.com>
LABEL version="0.1" Description="OPNFVDocs Docker container"
ARG BRANCH=master
ARG build=html
ENV BRANCH=$BRANCH
ENV build=$build

# Dependencies for sphinx, pip and git
RUN apt-get update && apt-get install -y \
    python-pip python-sphinx git

RUN git clone --depth=1 --branch=$BRANCH https://git.opnfv.org/opnfvdocs /opnfvdocs
RUN pip install -r /opnfvdocs/etc/requirements.txt
RUN pip install virtualenv
RUN rm -rf /var/lib/apt-lists/* /root/.cache/pip /opnfvdocs/.git

ADD ./entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT /sbin/entrypoint.sh
