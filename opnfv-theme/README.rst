OPNFV Documentation Theme
=========================

This theme is used for all OPNFV documentation and is released seperatly
from the documentation itself. It's and extention of the `Sphinx
Bootstrap Theme`_

Installation
------------

Here's how to install the theme from PyPI_

To install and configure the theme do the following.

#. Install the theme from pypi:

   .. code-block:: bash

      $ pip install sphinx_opnfv_theme

#. Configure Sphinx to use the theme:

   .. code-block:: python

      # conf.py
      import sphinx_opnfv_theme

      # ...

      html_theme = 'opnfv'
      html_theme_path = sphinx_opnfv_theme.get_html_theme_path()

Customization
-------------

There are no customization specific to this theme yet, but all
all customizations_ Sphinx Bootstrap Theme are supported.

If you'd like your documentation to match OPNFV's style configure the
following options for the bootstrap theme::

  html_theme_options = {
    'bootswatch_theme': 'journal',
    'navbar_sidebarrel': False,
    'navbar_title': '',
  }

.. _Sphinx Bootstrap Theme: https://github.com/ryan-roemer/sphinx-bootstrap-theme
.. _Pypi: http://pypi.python.org/pypi/sphinx-opnfv-theme/
.. _customizations: https://github.com/ryan-roemer/sphinx-bootstrap-theme#customization
