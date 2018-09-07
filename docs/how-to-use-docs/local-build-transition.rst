Submodule Transition
====================

Moving away from submodules.

At the cost of some release-time overhead, there are several benefits
the transition provides projects:

* Local builds - Projects will be able to build and view there docs
  locally, as they would appear on the OPNFV Docs website.
* Reduced build time - Patchset verification will only run against
  individual projects docs, not all projects.
* Decoupled build failures - Any error introduced to project's docs
  would not break builds for all the other projects

Steps
-----

To make the transition the following steps need to be taken across three
repositories:

* Your project repository (Ex. Fuel)
* The `Releng`_ repository
* The `OPNFV Docs`_ repository

.. _Releng: https://git.opnfv.org/releng/
.. _`OPNFV Docs`: https://git.opnfv.org/opnfvdocs/

Adding a Local Build
~~~~~~~~~~~~~~~~~~~~

In your project repo:

#. Add the following files:

   *docs/conf.py*

   .. literalinclude:: files/conf.py

   *docs/conf.yaml*

   .. literalinclude:: files/conf.yaml

   *docs/requirements.txt*

   .. literalinclude:: files/requirements.txt

   *tox.ini*

   .. literalinclude:: files/tox.ini

   *.gitignore*::

      .tox/
      docs/_build/*

   *docs/index.rst*

   If this file doesn't exist, it will need to be created along any other
   missing index file for directories (release, development). Any
   example of the file's content looks like this:

   .. literalinclude:: files/index.rst

You can verify the build works by running::

  tox -e docs

Creating a CI Job
~~~~~~~~~~~~~~~~~

In the releng repository:

#. Update your project's job file
   **jjb/<project>/<projects-jobs.yaml** with the following (taken from `this guide`_):

   .. literalinclude:: files/build.yaml

You can either send an email_ to helpdesk in order to get a copy of
**RTD_BUILD_URL** and **RTD_TOKEN**, ping *aricg* or *bramwelt* in
*#opnfv-docs* on Freenode, or add *Aric Gardner* or *Trevor Bramwell* to your
patch as a reviewer and they will pass along the token and build URL.

.. _email: mailto:helpdesk@opnfv.org
.. _`this guide`: https://docs.releng.linuxfoundation.org/en/latest/project-documentation.html#bootstrap-a-new-project

Removing the Submodule
~~~~~~~~~~~~~~~~~~~~~~

In the opnfvdocs repository:

#. Add an intersphinx link to the opnfvdocs repo configuration:

   *docs/conf.py*

   .. code-block:: python

      intersphinx_mapping['<project>'] = ('http://opnfv-<project>.readthedocs.io', None)

   If the project exists on ReadTheDocs, and the previous build was
   merged in and ran, you can verify the linking is working currectly by
   finding the following line in the output of **tox -e docs**::

     loading intersphinx inventory from https://opnfv-<project>.readthedocs.io/en/latest/objects.inv...

#. Ensure all references in opnfvdocs are using **:ref:** or **:doc:** and
   not directly specifying submodule files with *../submodules/<project>*.

   For example::

     .. toctree::

        ../submodules/releng/docs/overview.rst

   Would become::

     .. toctree::

        :ref:`Releng Overview <releng:overview>`

   Some more examples can be seen `here`_.

   .. _here: https://docs.releng.linuxfoundation.org/en/latest/project-documentation.html#cross-reference-external-docs

#. Remove the submodule from opnfvdocs, replacing *<project>* with your
   project and commit the change::

     git rm docs/submodules/<project>
     git commit -s
     git review
