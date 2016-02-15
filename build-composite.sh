#!/bin/bash
# SPDX-license-identifier: Apache-2.0
##############################################################################
# Copyright (c) 2016 NEC and others.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License, Version 2.0
# which accompanies this distribution, and is available at
# http://www.apache.org/licenses/LICENSE-2.0
##############################################################################

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

GIT_CLONE_BASE=${GIT_CLONE_BASE:-ssh://gerrit.opnfv.org:29418}
GERRIT_BRANCH=${GERRIT_BRANCH:-master}
WORKSPACE=${WORKSPACE:-/tmp}

get_repo_names() {
    # NOTE: Not all repositories are ready for the composite docs,
    #       so we have the repo name list here to add project docs
    #       one by one. This will be replaced by the list in project.cfg .
    # grep -v '^#' releng/jjb/opnfvdocs/project.cfg | sort
    echo "sdnvpn"
    echo "fuel"
    echo "ipv6"
    echo "joid"
    echo "functest"
    echo "apex"
    echo "promise"
    echo "copper"
    echo "doctor"
    echo "vswitchperf"
    echo "fastpathmetrics"
}

git_clone() {
    _repo="$1"

    [[ -d "$WORKSPACE/$_repo" ]] && return 0
    pushd $WORKSPACE
    git clone -b $GERRIT_BRANCH --depth 1 --quiet $GIT_CLONE_BASE/$_repo
    popd
}

git_clone releng

repos=$(get_repo_names)

[[ -e docs/projects ]] && rm -rf docs/projects
mkdir -p docs/projects

echo
echo "Cloning repos of participating OPNFV Projects and copying docs"
echo
for repo in $repos; do
    echo "    $repo ($GERRIT_BRANCH)"
    git_clone $repo
    [[ -e $WORKSPACE/$repo/docs ]] || continue
    [[ -e docs/projects/$repo ]] && rm -rf docs/projects/$repo
    cp -r $WORKSPACE/$repo/docs docs/projects/$repo
done

# NOTE: Removing index.rst in project repos to reduce number of docs.
find docs/projects -type f -name 'index.rst' -print | xargs -I i rm -f i

# Correct Image file path (workaround)
sed -i -e '/^.. figure::/s|images|../projects/promise/configguide/images|' \
    docs/projects/promise/configguide/featureconfig.rst

# NOTE: automated link generation is not ready...
echo
echo "Creating document links"
echo
targets="
configguide/installer-config.rst
configguide/feature-config.rst
userguide/test-usage.rst
userguide/feature-usage.rst
"
# configguide/post-install.rst
for guide in $targets
do
    mainfile="$WORKSPACE/docs/$guide"
    for repo in $repos
    do
        projectfile="projects/$repo/${guide//-/}"
        projectlink="${mainfile%/*}/featureconfig-$repo.rst"
        [[ -e "$WORKSPACE/docs/$projectfile" ]] || continue
        echo "Adding $repo to $guide ..."
        echo "" >> $mainfile
        echo ".. toctree::" >> $mainfile
        echo "" >> $mainfile
        echo "    $projectlink" >> $mainfile
        echo ".. include:: ../$projectfile" >> $projectlink
    done
    echo
    echo "Generated $guide:"
    cat $mainfile
    echo
done

$WORKSPACE/releng/utils/docs-build.sh

echo "Done"
