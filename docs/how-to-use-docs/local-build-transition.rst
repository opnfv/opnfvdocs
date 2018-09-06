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

   if it doesn't exist along with other index file for directories
   (release, development)

In the releng repository:

#. Update your project's job file
   **jjb/<project>/<projects-jobs.yaml** with the following (taken from `this guide`)::

    ---
    - project:
        name: PROJECT
        project-name: '{name}'

        build-timeout: 60
        build-node: 'opnfv-build'
        gerrit-server-name: 'gerrit.opnfv.org'
        jenkins-ssh-credential: 'd42411ac011ad6f3dd2e1fa34eaa5d87f910eb2e'

        project-pattern: '{name}'
        rtd-build-url: RTD_BUILD_URL
        rtd-token: RTD_TOKEN

        jobs:
          - '{project-name}-rtd-jobs'

You can either send an email_ to helpdesk in order to get a copy of
**RTD_BUILD_URL** and **RTD_TOKEN**, ping *aricg* or *bramwelt* in
*#opnfv-docs* on Freenode, or add *Aric Gardner* or *Trevor Bramwell* to your
patch as a reviewer and they will pass along the token and build URL.

.. _email: mailto:helpdesk@opnfv.org
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
