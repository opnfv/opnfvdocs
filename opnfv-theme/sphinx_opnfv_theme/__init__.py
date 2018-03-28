"""OPNFV Sphinx Theme"""

from os import path

__version__ = '0.2.0'


def get_html_theme_path():
    """Return list of HTML theme paths."""
    local_path = path.abspath(path.dirname(__file__))
    return [local_path]


def setup(app):
    """Required by Sphinx to create the theme."""
    app.add_html_theme('opnfv', path.abspath(path.dirname(__file__)))
