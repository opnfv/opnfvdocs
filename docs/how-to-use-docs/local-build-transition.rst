Submodule Transition
====================

Moving away from submodules.

At the cost of some release-time overhead, there are several benefits
the transition provides projects:

* Local builds - Projects will be able to build and view there docs
  locally, as they would appear on the OPNFV Docs website.
* Reduced build time - Patchset verification would only run against
  individual projects docs, not all projects.
* Decoupled build failures - Any error introduced to project's docs
  would not break builds for all the other projects

Steps
-----

#. Create an RTD project for the OPNFV project as *opnfv-projectname*
   and add opnfv-rtd as a maintainer, or request it be created by
   helpdesk@opnfv.org.

#. Add docs/conf.py, docs/conf.yaml, and tox.ini files:

   *docs/conf.py*
   
   .. literalinclude:: files/conf.py
   
   *docs/conf.yaml*
   
   .. literalinclude:: files/conf.yaml
   
   *docs/requirements.txt*
   
   .. literalinclude:: files/requirements.txt
   
   *tox.ini*
   
   .. literalinclude:: files/tox.ini

#. Add the rtd build jobs to your project in the releng repository.

   .. code-block:: yaml
       :name: jjb/example/example-jobs.yaml
   
       ---
       project:
         project: 'example'
   
         - jobs:
             - '{project}-rtd-jobs'

#. Add a intersphinx link to the opnfvdocs repo:

   .. code-block:: python
       :name: docs/conf.py
   
       intersphinx_mapping['example'] = ('http://opnfv-example.readthedocs.io', None)

#. Ensure all references in opnfvdocs are using `:ref:` and not
   directly specifying submodule files (No `:doc:` or 'submodules/...'
   in `.. toctree:`)

#. Remove the submodule from opnfvdocs
