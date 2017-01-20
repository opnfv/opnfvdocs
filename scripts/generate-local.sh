# Copyright 2017 OPNFV

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set +e

DOCS_DIR=${DOCS_DIR:-docs}
BUILD_DIR=${BUILD_DIR:-docs_build}
OUTPUT_DIR=${OUTPUT_DIR:-docs_output}
SRC_DIR=${SRC_DIR:-$BUILD_DIR/_src}
VENV_DIR=${VENV_DIR:-$BUILD_DIR/_venv}
OPNFVDOCS_DIR=${OPNFVDOCS_DIR:-$BUILD_DIR/_opnfvdocs}

revision="$(git rev-parse --short HEAD)"
rev_full="$(git rev-parse HEAD)"
version="$(git tag | tail -1)"
project="$(basename $(git rev-parse --show-toplevel))"
html_notes="    Revision: $rev_full\n    Build date: $(date -u +'%Y-%m-%d')"
opnfv_logo="$OPNFVDOCS_DIR/etc/opnfv-logo.png"
copyright="$(date +%Y), OPNFV."
copyrightlong="$(date +%Y), OPNFV. Licensed under CC BY 4.0."
error_count=0

function set_error() {
    # TODO(yujunz) log detail errors
    error_count=$((error_count + 1))
}

if [ "$(uname)" == "Darwin" ]; then
  # Override system $SED/$FIND with gnu $SED and gnu $FIND
  # If not found, install with
  # $ brew install gnu-sed findutils
  echo "macOS detected."
  SED="gsed"
  FIND="gfind"
else
  SED="sed"
  FIND="find"
fi

function copy() {
    mkdir -p "$(dirname $SRC_DIR)"

    if [ -e "$SRC_DIR" ]; then
        rm -rf "$SRC_DIR"
    fi
    cp -r "$DOCS_DIR" "$SRC_DIR"
}


function check_rst_doc() {
    _src="$1"

    # Note: This check may fail in many jobs for building project docs, since
    #       the old sample has lines more than 120. We ignore failures on this
    #       check right now, but these have to be fixed before OPNFV B release.
    _out=$(doc8 --max-line-length 240 --ignore D000 "$_src") || {
        _msg='Warning: rst validation (doc8) has failed, please fix the following error(s).'
        _errs=$(echo "$_out" | $SED -n -e "/^$_src/s/^/    /p")
        echo
        echo -e "$_msg\n$_errs"
        echo
    }
}

function add_config() {
    _conf="$1"
    _param="$2"
    _val="$3"

    if ! grep -q -e "^$_param = " "$_conf" ; then
        echo "Adding '$_param' into $_conf ..."
        echo "$_param = $_val" >> "$_conf"
    fi
}

# Note: User can customize config for specific document by creating 'conf.py'
#       in the taeget document dir (e.g. docs/abc/conf.py). This config file does
#       not need to cover all config parameter, as all missing parameter will be
#       automatically filled by this function.
function prepare_config() {
    _src="$1"
    _conf="$_src/conf.py"

    touch "$_conf"

    # default params
    # Note: If you want to add a new sphinx extention here, you may need python
    #       package for it (e.g. python package 'sphinxcontrib-httpdomain' is
    #       required by 'sphinxcontrib.httpdomain'). If you need such python
    #       package, add the name of the python package into the requirement
    #       list 'docs/etc/requirements.txt' .
    echo "import sphinx_bootstrap_theme" >> "$_conf"
    add_config "$_conf" 'extensions' \
    "['sphinxcontrib.httpdomain', 'sphinx.ext.autodoc', 'sphinx.ext.viewcode', 'sphinx.ext.napoleon']"
    add_config "$_conf" 'needs_sphinx' "'1.4'"
    add_config "$_conf" 'numfig' "True"
    add_config "$_conf" 'master_doc' "'index'"
    add_config "$_conf" 'pygments_style' "'sphinx'"
    add_config "$_conf" 'html_theme' "'bootstrap'"
    add_config "$_conf" 'html_theme_options' "{'bootswatch_theme': 'united',}"
    add_config "$_conf" 'html_theme_path' "sphinx_bootstrap_theme.get_html_theme_path()"
    add_config "$_conf" 'html_last_updated_fmt' "'%b %d, %Y'"
    add_config "$_conf" 'html_logo' "'opnfv-logo.png'"
        # genarated params
    add_config "$_conf" 'release' "u'$version'"
    add_config "$_conf" 'version' "u'$version'"
    add_config "$_conf" 'project' "'Documentation'"
    add_config "$_conf" 'copyright' "u'$copyrightlong'"

    echo "sphinx config to be used:"
    echo
    $SED -e "s/^/    /" "$_conf"
    echo
}

if [[ ! -d "$OPNFVDOCS_DIR" ]] ; then
    echo "Error: $OPNFVDOCS_DIR dir not found."
    echo "See <To provide updated link> ."
    set_error
fi

if ! which virtualenv > /dev/null ; then
    echo "Error: 'virtualenv' not found. Exec 'sudo pip install virtualenv' first."
    set_error
fi

# workaround for doc8 error in python2.6
if [[ $(python -V 2>&1) == Python\ 2.6.* ]] && [ -e /usr/bin/python2.7 ]; then
    echo "creating venv with Python 2.7 instead of Python 2.6.x ..."
    virtualenv "$VENV_DIR" --python=/usr/bin/python2.7
else
    virtualenv "$VENV_DIR"
fi

source "$VENV_DIR/bin/activate"
pip install -r "$OPNFVDOCS_DIR/etc/requirements.txt"

check_rst_doc $DOCS_DIR
copy
prepare_config "$SRC_DIR"
cp -f $opnfv_logo "$SRC_DIR/opnfv-logo.png"

sphinx-build -b html $SRC_DIR $OUTPUT_DIR

deactivate

exit $error_count