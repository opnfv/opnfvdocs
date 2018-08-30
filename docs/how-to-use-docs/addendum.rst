========
Addendum
========

Index File
==========

The index file must relatively refence your other rst files in that directory.

Here is an example index.rst :

.. code-block:: bash

    *******************
    Documentation Title
    *******************

    .. toctree::
       :numbered:
       :maxdepth: 2

       documentation-example

Source Files
============

Document source files have to be written in reStructuredText format (rst).
Each file would be build as an html page.

Here is an example source rst file :

.. code-block:: bash

    =============
    Chapter Title
    =============

    Section Title
    =============

    Subsection Title
    ----------------

    Hello!

Writing RST Markdown
====================

See http://sphinx-doc.org/rest.html .

**Hint:**
You can add dedicated contents by using 'only' directive with build type
('html' and 'singlehtml') for OPNFV document. But, this is not encouraged to
use since this may make different views.

.. code-block:: bash

    .. only:: html
        This line will be shown only in html version.

Verify Job
----------

The verify job name is **{project}-rtd-verify-{branch}**.

When you send document changes to Gerrit, Jenkins will build the project
documentation to make sure no syntax errors were introduced. There is no
hosted version of the docs until they are merged, so visual changes will
need to be checked by locally building the docs with **tox -e docs**.

Merge Job
----------

The merge job name is **{project}-rtd-merge-{branch}**

Once the patch is merged, jenkins will automatically trigger building of
the new documentation. This might take about 15 minutes while ReadTheDocs
builds the documentatation. The newly built documentation will show up
at opnfv-{project}.opnfv.org and under the project listing on docs.opnfv.org.

