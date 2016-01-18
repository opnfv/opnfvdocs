#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

GIT_CLONE_BASE=${GIT_CLONE_BASE:-ssh://gerrit.opnfv.org:29418}
GERRIT_BRANCH=${GERRIT_BRANCH:-master}

get_repo_names() {
    # NOTE: Not all repositories are ready for the composite docs,
    #       so we have the repo name list here to add project docs
    #       one by one. This will be replaced by the list in project.cfg .
    # grep -v '^#' releng/jjb/opnfvdocs/project.cfg | sort
    echo "sdnvpn"
    echo "fuel"
    echo "joid"
}

git_clone() {
    _repo="$1"

    [[ -d "$_repo" ]] && return 0
    git clone -b $GERRIT_BRANCH --depth 1 --quiet $GIT_CLONE_BASE/$_repo
}

git_clone releng

repos=$(get_repo_names)

[[ -e docs/projects ]] && rm -rf docs/projects
mkdir -p docs/projects

echo
echo "Cloning repos of participating OPNFV Projects and copying docs"
echo
mkdir -p docs_build/projects
pushd docs_build/projects
for repo in $repos; do
    echo "    $repo ($GERRIT_BRANCH)"
    git_clone $repo
    [[ -e $repo/docs ]] || continue
    cp -r $repo/docs ../../docs/projects/$repo
done
popd

# NOTE: Removing index.rst in project repos to reduce number of docs.
find docs_build/projects -type f -name 'index.rst' -print | xargs -I i rm -f i

# NOTE: automated link generation is not ready...
#echo
#echo "Creating document links"
#echo
#for guide in configguide userguide
#do
#    link_list=$WORKSPACE/docs/$guide/projects-$guide.rst
#    for repo in $repos
#    do
#        file=projects/$repo/$guide/$guide.rst
#        [[ -e $WORKSPACE/docs/$file ]] || continue
#        echo "" >> $link_list
#        echo "$repo:" >> $link_list
#        echo ".. include:: ../$file" >> $link_list
#    done
#done

./releng/utils/docs-build.sh

echo "Done"
