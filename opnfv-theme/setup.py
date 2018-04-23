from setuptools import setup, find_packages

from sphinx_opnfv_theme import __version__


setup(
    name='sphinx_opnfv_theme',
    description="OPNFV Theme for Sphinx",
    long_description=open('README.rst').read(),
    url='https://docs.opnfv.org/',
    author='Trevor Bramwell',
    author_email='tbramwell@linuxfoundation.org',
    version=__version__,
    entry_points={
        'sphinx.html_themes': [
            'opnfv = sphinx_opnfv_theme',
        ]
    },
    packages=find_packages(),
    install_requires=[
        'sphinx_bootstrap_theme',
        'sphinxcontrib-httpdomain',
    ],
    include_package_data=True,
    package_data={'sphinx_opnfv_theme': [
        'theme.conf',
        'static/*',
        '*.html',
    ]},
)
