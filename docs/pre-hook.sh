#!/bin/bash
# SPDX-license-identifier: Apache-2.0
##############################################################################
# Copyright (c) 2016 NEC and others.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License, Version 2.0
# which accompanies this distribution, and is available at
# http://www.apache.org/licenses/LICENSE-2.0
##############################################################################

GIT_CLONE_BASE=${GIT_CLONE_BASE:-ssh://gerrit.opnfv.org:29418}
GERRIT_BRANCH=${GERRIT_BRANCH:-master}
WORKSPACE=${WORKSPACE:-.}

get_repo_names() {
    # NOTE: Not all repositories are ready for the composite docs,
    #       so we have the repo name list here to add project docs
    #       one by one. This will be replaced by the list in project.cfg .
    # grep -v '^#' releng/jjb/opnfvdocs/project.cfg | sort
    echo "apex"
    echo "bottlenecks"
    echo "compass4nfv"
    echo "copper"
    echo "daisy"
    echo "doctor"
    echo "fastpathmetrics"
    echo "fuel"
    echo "functest"
    echo "ipv6"
    echo "joid"
    echo "ovsnfv"
    echo "pharos"
    echo "prediction"
    echo "promise"
    echo "sdnvpn"
    echo "vswitchperf"
    echo "yardstick"
}

git_clone() {
    _repo="$1"

    [[ -d "$WORKSPACE/$_repo" ]] && return 0
    pushd $WORKSPACE
    git clone -b $GERRIT_BRANCH --depth 1 --quiet $GIT_CLONE_BASE/$_repo
    popd
}

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

# fix relative file paths
pattern='.. \(include\|figure\):: *[^ \/]'
base_path="/$(pwd)/docs_build/_src"
find docs/projects -type f -name '*.rst' -print | while read f
do
    sed -i -e "/$pattern/s|:: *|:: $base_path/$(dirname ${f#docs/})/|" $f
done

# for debug
grep -e '.. include::' -e '.. figure::' -r docs/projects

# NOTE: automated link generation is not ready...
echo
echo "Creating document links"
echo
targets="
configurationguide/configuration.options.render.rst
configurationguide/scenario.description.rst
userguide/feature.userguide.render.rst
testframework/framework.installation.procedure.render.rst
testframework/framework.userguide.render.rst
"
# configurationguide/post-install.rst
for guide in $targets
do
    mainfile="$WORKSPACE/docs/$guide"
    basefilename=$(basename ${guide/-/})
    for repo in $repos
    do
        targetfile="$WORKSPACE/docs/projects/$repo/${guide/-/}"
        targetlink="../projects/$repo/${guide/-/}"
        projectfilename="${basefilename/.rst/-$repo.rst}"
        projectfile="$(dirname $mainfile)/$projectfilename"
        [[ -e "$targetfile" ]] || continue
        echo "Adding $repo to $guide ..."
        echo "" >> $mainfile
        echo ".. toctree::" >> $mainfile
        echo "" >> $mainfile
        echo "    $projectfilename" >> $mainfile
        echo ".. include:: $targetlink" > $projectfile
    done
    echo
    echo "Generated $guide:"
    cat $mainfile
    echo
done
