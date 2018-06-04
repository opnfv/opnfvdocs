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

To make the transition the following steps need to be taken across the
project repository, releng repository and opnfvdocs repository.

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

   *.gitignore*

   .tox/
   docs/_build/*

   *docs/index.rst*

   if it doesn't exist along with other index file for directories
   (release, development)

In the releng repository:

#. Follow the steps in `this guide`_ from the Linux Foundation Releng team on
   bootstrapping a new ReadTheDocs (RTD) project.

   This will ensure RTD will update each time docs patches are merged to
   the repository.

.. note: In step 4 of the guide, the file this job should be added to is:
         **jjb/project/project-jobs.yaml**, where project is the OPNFV project.

.. _`this guide`: https://docs.releng.linuxfoundation.org/en/latest/project-documentation.html#bootstrap-a-new-project


In the opnfvdocs repository:

#. Add a intersphinx link to the opnfvdocs repo:

   Here 'example' should be replaced with the name of your project.

   .. code-block:: python
       :name: docs/conf.py

       intersphinx_mapping['example'] = ('http://opnfv-example.readthedocs.io', None)

#. Ensure all references in opnfvdocs are using `:ref:` and not
   directly specifying submodule files (No `:doc:` or 'submodules/...'
   in `.. toctree:`)

#. Remove the submodule from opnfvdocs::

    diff --git a/.gitmodules b/.gitmodules
    index 846ab245..aab01642 100644
    --- a/.gitmodules
    +++ b/.gitmodules
    @@ -151,4 +150,0 @@
    -[submodule "docs/submodules/releng"]
    -       path = docs/submodules/releng
    -       url = ../releng
    -       branch = master
