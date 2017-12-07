FROM debian:stable

MAINTAINER Julien Zhang <julienjut@gmail.com>
LABEL version="0.1" Description="OPNFVDocs Docker containter"
ARG BRANCH=master
ENV BRANCH=$BRANCH

# Dependencies for sphinx, pip and git
RUN apt-get update && apt-get install -y \
	python-pip python-sphinx latexdiff \
    texlive texlive-latex-extra texlive-humanities \
    texlive-generic-recommended \
    graphviz git \
	rm -rf /var/lib/apt-lists/*

# fetching the only file from git repo without ssh can not be achieved
# tricky to add the file /etc/requirements.txt in opnfvdocs
ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

ADD ./entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT /sbin/entrypoint.sh
