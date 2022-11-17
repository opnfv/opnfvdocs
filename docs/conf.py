master_doc = 'index'
project = "Anuket Documentation"
html_title = "Anuket Documentation"
copyright = '2021, Anuket. Licensed under CC BY 4.0'
author = 'Anuket Project of Linux Foundation Networking'
extensions = ['sphinx.ext.intersphinx',
              'sphinx.ext.autosectionlabel'
             ]
html_theme = "piccolo_theme"
exclude_patterns = [
    '**/.tox',
    'templates',                     # suppress warning that these files are not included in any toctree
    'how-to-use-docs/files',         # suppress warning that these files are not included in any toctree
    'development/feature.templates'  # suppress warning that these files are not included in any toctree
]

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
version = 'Latest'
# The full version, including alpha/beta/rc tags.
release = 'Latest'
# The branch this project should link against for projects
# following the stable-branch process. On the opnfvdocs stable branch
# this should be set to 'stable/<release>' where '<release>' is the
# current stable release (Ex: 'stable/gambia')
branch = 'latest'

intersphinx_mapping = {}
intersphinx_mapping['airship'] = ('https://docs.anuket.io/projects/airship/en/%s' % branch, None)
#intersphinx_mapping['apex'] = ('https://opnfv-apex.readthedocs.io/en/%s' % branch, None)
#intersphinx_mapping['armband'] = ('https://opnfv-armband.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['auto'] = ('https://docs.anuket.io/projects/auto/en/%s' % branch, None)
intersphinx_mapping['availability'] = ('https://opnfv-availability.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['barometer'] = ('https://docs.anuket.io/projects/barometer/en/%s' % branch, None)
#intersphinx_mapping['bottlenecks'] = ('https://opnfv-bottlenecks.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['calipso'] = ('https://docs.anuket.io/projects/calipso/en/%s' % branch, None)
intersphinx_mapping['cirv-sdv'] = ('https://docs.anuket.io/projects/cirv-sdv/en/%s' % branch, None)
#intersphinx_mapping['clover'] = ('https://opnfv-clover.readthedocs.io/en/%s' % branch, None)
#intersphinx_mapping['compass4nfv'] = ('https://opnfv-compass4nfv.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['container4nfv'] = ('https://opnfv-container4nfv.readthedocs.io/en/%s' % branch, None)
# intersphinx_mapping['copper'] = ('https://opnfv-copper.readthedocs.io/en/%s' % branch, None)
#intersphinx_mapping['daisy'] = ('https://opnfv-daisy.readthedocs.io/en/%s' % branch, None)
#intersphinx_mapping['doctor'] = ('https://opnfv-doctor.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['dovetail'] = ('https://docs.anuket.io/projects/dovetail/en/%s' % branch, None)
intersphinx_mapping['edgecloud'] = ('https://opnfv-edgecloud.readthedocs.io/en/%s' % branch, None)
# intersphinx_mapping['fds'] = ('https://opnfv-fds.readthedocs.io/en/%s' % branch, None)
#intersphinx_mapping['fuel'] = ('https://opnfv-fuel.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['functest'] = ('https://docs.anuket.io/projects/functest/en/%s' % branch, None)
#intersphinx_mapping['ipv6'] = ('https://opnfv-ipv6.readthedocs.io/en/%s' % branch, None)
# intersphinx_mapping['moon'] = ('https://opnfv-moon.readthedocs.io/en/%s' % branch, None)
# intersphinx_mapping['netready'] = ('https://opnfv-netready.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['kuberef'] = ('https://docs.anuket.io/projects/kuberef/en/%s' % branch, None)
intersphinx_mapping['nfvbench'] = ('https://docs.anuket.io/projects/nfvbench/en/%s' % branch, None)
#intersphinx_mapping['onosfw'] = ('https://opnfv-onosfw.readthedocs.io/en/%s' % branch, None)
#intersphinx_mapping['orchestra'] = ('https://opnfv-orchestra.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['ovn4nfv'] = ('https://opnfv-ovn4nfv.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['ovno'] = ('https://opnfv-ovno.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['parser'] = ('https://opnfv-parser.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['pharos'] = ('https://opnfv-pharos.readthedocs.io/en/%s' % branch, None)
#intersphinx_mapping['promise'] = ('https://opnfv-promise.readthedocs.io/en/%s' % branch, None)
#intersphinx_mapping['qtip'] = ('https://opnfv-qtip.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['releng'] = ('https://docs.anuket.io/projects/releng/en/latest', None)
intersphinx_mapping['releng-xci'] = ('https://opnfv-releng-xci.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['samplevnf'] = ('https://docs.anuket.io/projects/samplevnf/en/%s' % branch, None)
intersphinx_mapping['sdnvpn'] = ('https://opnfv-sdnvpn.readthedocs.io/en/%s' % branch, None)
#intersphinx_mapping['sfc'] = ('https://opnfv-sfc.readthedocs.io/en/%s' % branch, None)
#intersphinx_mapping['snaps'] = ('https://opnfv-snaps.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['stor4nfv'] = ('https://opnfv-stor4nfv.readthedocs.io/en/%s' % branch, None)
#intersphinx_mapping['storperf'] = ('https://opnfv-storperf.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['vineperf'] = ('https://docs.anuket.io/projects/vineperf/en/%s' % branch, None)
#intersphinx_mapping['yardstick'] = ('https://opnfv-yardstick.readthedocs.io/en/%s' % branch, None)
intersphinx_mapping['cntt'] = ('https://cntt.readthedocs.io/en/%s' % branch, None)


autosectionlabel_prefix_document = True
autosectionlabel_maxdepth = 4

html_static_path = ['_static']
templates_path = ['_templates']

html_show_sourcelink = False
html_theme_options = {
    'nav_title': '',
     # Set the color and the accent color
    'color_primary': 'blue-grey,',
    'color_accent': 'white',
    # Visible levels of the global TOC; -1 means unlimited
    'globaltoc_depth': 0,
    # If False, expand all TOC entries
    'globaltoc_collapse': False,
    # If True, show hidden TOC entries
    'globaltoc_includehidden': False,
    'base_url': "https://docs.anuket.io/",
    'repo_url': 'https://gerrit.opnfv.org/',
    'repo_name': '',
    'repo_type': 'github',
}

# Inverse png
html_logo = '_static/anuket-logo.png'
html_favicon = '_static/favicon.ico'
